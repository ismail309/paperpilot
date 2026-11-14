-- ==========================================
-- TRIGGERS: Timestamp Management
-- ==========================================

/**
 * @description Automatically updates 'updated_at' on the users table.
 */
DROP TRIGGER IF EXISTS trg_users_updated_at ON users;
CREATE TRIGGER trg_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at();

/**
 * @description Automatically updates 'updated_at' on the head_offices table.
 */
DROP TRIGGER IF EXISTS trg_head_offices_updated_at ON head_offices;
CREATE TRIGGER trg_head_offices_updated_at BEFORE UPDATE ON head_offices FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at();

/**
 * @description Automatically updates 'updated_at' on the campuses table.
 */
DROP TRIGGER IF EXISTS trg_campuses_updated_at ON campuses;
CREATE TRIGGER trg_campuses_updated_at BEFORE UPDATE ON campuses FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at();

/**
 * @description Automatically updates 'updated_at' on the organisation_members table.
 */
DROP TRIGGER IF EXISTS trg_org_members_updated_at ON organisation_members;
CREATE TRIGGER trg_org_members_updated_at BEFORE UPDATE ON organisation_members FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at();

/**
 * @description Automatically updates 'updated_at' on the campus_members table.
 */
DROP TRIGGER IF EXISTS trg_campus_members_updated_at ON campus_members;
CREATE TRIGGER trg_campus_members_updated_at BEFORE UPDATE ON campus_members FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at();


-- ==========================================
-- TRIGGERS: Cascade Deactivations
-- ==========================================

/**
 * @description Triggers the campus cascade function when a campus status is updated.
 * @fires fn_cascade_campus_deactivation()
 */
DROP TRIGGER IF EXISTS trg_cascade_campus_deactivation ON campuses;
CREATE TRIGGER trg_cascade_campus_deactivation
AFTER UPDATE OF sta_id ON campuses
FOR EACH ROW
EXECUTE FUNCTION fn_cascade_campus_deactivation();

/**
 * @description Triggers the head office cascade function when a head office status is updated.
 * @fires fn_cascade_head_office_deactivation()
 */
DROP TRIGGER IF EXISTS trg_cascade_head_office_deactivation ON head_offices;
CREATE TRIGGER trg_cascade_head_office_deactivation
AFTER UPDATE OF sta_id ON head_offices
FOR EACH ROW
EXECUTE FUNCTION fn_cascade_head_office_deactivation();