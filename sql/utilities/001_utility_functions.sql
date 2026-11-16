-- ==========================================
-- UTILITY: Auto-Update Timestamps
-- ==========================================
/**
 * @description Automatically updates the 'updated_at' column to the current timestamp.
 * @usage Attach this function to a BEFORE UPDATE trigger on any table with an 'updated_at' column.
 * @trigger trg_users_updated_at, trg_head_offices_updated_at, etc.
 */
CREATE OR REPLACE FUNCTION fn_set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- ==========================================
-- UTILITY: Get Status ID
-- ==========================================
/**
 * @description Fetches the primary key (sta_id) for a given status group and name.
 * @param p_group VARCHAR - The status group (e.g., 'general', 'question', 'exam').
 * @param p_name VARCHAR - The status name (e.g., 'active', 'inactive', 'draft').
 * @return INT - The sta_id.
 * @throws Exception if the status is not found.
 */
CREATE OR REPLACE FUNCTION fn_get_status_id(p_group VARCHAR, p_name VARCHAR)
RETURNS INT AS $$
DECLARE
    v_sta_id INT;
BEGIN
    SELECT sta_id INTO v_sta_id
    FROM statuses
    WHERE sta_group = p_group AND sta_name = p_name;

    IF v_sta_id IS NULL THEN
        RAISE EXCEPTION 'Status not found for group: %, name: %', p_group, p_name;
    END IF;
    RETURN v_sta_id;
END;
$$ LANGUAGE plpgsql;


-- ==========================================
-- UTILITY: Get Role ID
-- ==========================================
/**
 * @description Fetches the primary key (rol_id) for a given role name.
 * @param p_role_name VARCHAR - The name of the role (e.g., 'teacher', 'platform_admin').
 * @return INT - The rol_id.
 * @throws Exception if the role is not found.
 */
CREATE OR REPLACE FUNCTION fn_get_role_id(p_role_name VARCHAR)
RETURNS INT AS $$
DECLARE
    v_rol_id INT;
BEGIN
    SELECT rol_id INTO v_rol_id
    FROM roles
    WHERE rol_name = p_role_name;

    IF v_rol_id IS NULL THEN
        RAISE EXCEPTION 'Role not found: %', p_role_name;
    END IF;
    RETURN v_rol_id;
END;
$$ LANGUAGE plpgsql;


-- ==========================================
-- UTILITY: Get Account Type ID
-- ==========================================
/**
 * @description Fetches the primary key (act_id) for a given account type name.
 * @param p_type_name VARCHAR - The name of the account type (e.g., 'individual', 'organisation').
 * @return INT - The act_id.
 * @throws Exception if the account type is not found.
 */
CREATE OR REPLACE FUNCTION fn_get_account_type_id(p_type_name VARCHAR)
RETURNS INT AS $$
DECLARE
    v_act_id INT;
BEGIN
    SELECT act_id INTO v_act_id
    FROM account_types
    WHERE act_name = p_type_name;

    IF v_act_id IS NULL THEN
        RAISE EXCEPTION 'Account Type not found: %', p_type_name;
    END IF;
    RETURN v_act_id;
END;
$$ LANGUAGE plpgsql;


-- ==========================================
-- UTILITY: Get User ID by Email
-- ==========================================
/**
 * @description Fetches the primary key (usr_id) for a user based on their email address.
 * @param p_email VARCHAR - The email address of the user.
 * @return INT - The usr_id.
 * @throws Exception if the user is not found.
 */
CREATE OR REPLACE FUNCTION fn_get_user_id_by_email(p_email VARCHAR)
RETURNS INT AS $$
DECLARE
    v_usr_id INT;
BEGIN
    SELECT usr_id INTO v_usr_id
    FROM users
    WHERE email = p_email;

    IF v_usr_id IS NULL THEN
        RAISE EXCEPTION 'User not found with email: %', p_email;
    END IF;
    RETURN v_usr_id;
END;
$$ LANGUAGE plpgsql;


-- ==========================================
-- UTILITY: Cascade Campus Deactivation
-- ==========================================
/**
 * @description Deactivates all campus memberships and user roles when a campus is no longer active.
 * @logic Checks if the NEW status is not 'active'. If so, it updates all campus_members and user_roles
 * tied to this campus to 'inactive'.
 * @trigger trg_cascade_campus_deactivation (AFTER UPDATE OF sta_id ON campuses)
 */
CREATE OR REPLACE FUNCTION fn_cascade_campus_deactivation()
RETURNS TRIGGER AS $$
DECLARE
    v_active_sta_id INT;
    v_inactive_sta_id INT;
BEGIN
    SELECT sta_id INTO v_active_sta_id FROM statuses WHERE sta_group = 'general' AND sta_name = 'active';
    SELECT sta_id INTO v_inactive_sta_id FROM statuses WHERE sta_group = 'general' AND sta_name = 'inactive';

    IF NEW.sta_id != v_active_sta_id THEN
        -- 1. Deactivate Campus Memberships
        UPDATE campus_members
        SET sta_id = v_inactive_sta_id
        WHERE cam_id = NEW.cam_id;

        -- 2. Deactivate User Roles
        UPDATE user_roles
        SET sta_id = v_inactive_sta_id
        WHERE cam_id = NEW.cam_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- ==========================================
-- UTILITY: Cascade Head Office Deactivation
-- ==========================================
/**
 * @description Deactivates all related entities when a Head Office is no longer active.
 * @logic Checks if the NEW status is not 'active'. If so, it cascades the 'inactive' status
 * to all Campuses, Campus Members, Organisation Members, and User Roles belonging to this Head Office.
 * @trigger trg_cascade_head_office_deactivation (AFTER UPDATE OF sta_id ON head_offices)
 */
CREATE OR REPLACE FUNCTION fn_cascade_head_office_deactivation()
RETURNS TRIGGER AS $$
DECLARE
    v_active_sta_id INT;
    v_inactive_sta_id INT;
BEGIN
    SELECT sta_id INTO v_active_sta_id FROM statuses WHERE sta_group = 'general' AND sta_name = 'active';
    SELECT sta_id INTO v_inactive_sta_id FROM statuses WHERE sta_group = 'general' AND sta_name = 'inactive';

    IF NEW.sta_id != v_active_sta_id THEN
        -- 1. Deactivate Campuses
        UPDATE campuses
        SET sta_id = v_inactive_sta_id
        WHERE head_off_id = NEW.head_off_id;

        -- 2. Deactivate Organisation Memberships
        UPDATE organisation_members
        SET sta_id = v_inactive_sta_id
        WHERE head_off_id = NEW.head_off_id;

        -- 3. Deactivate Campus Memberships
        UPDATE campus_members
        SET sta_id = v_inactive_sta_id
        WHERE cam_id IN (SELECT cam_id FROM campuses WHERE head_off_id = NEW.head_off_id);

        -- 4. Deactivate User Roles (Org Level and Campus Level)
        UPDATE user_roles
        SET sta_id = v_inactive_sta_id
        WHERE head_off_id = NEW.head_off_id;

        UPDATE user_roles
        SET sta_id = v_inactive_sta_id
        WHERE cam_id IN (SELECT cam_id FROM campuses WHERE head_off_id = NEW.head_off_id);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ==========================================
-- UTILITY: Grant App Permissions
-- ==========================================
/**
 * @description Grants the restricted application user (paperpilot_app) 
 * read/write access to all tables and sequences in the public schema.
 * @usage Call this function at the end of any migration that creates new tables.
 */
CREATE OR REPLACE FUNCTION grant_app_permissions()
RETURNS VOID AS $$
BEGIN
    GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO paperpilot_app;
    GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO paperpilot_app;
END;
$$ LANGUAGE plpgsql;