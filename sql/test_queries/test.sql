-- select * from users;
-- select * from user_roles;


	 SELECT 
                u.usr_id, 
                u.first_name, 
                u.last_name, 
                u.email, 
                u.sta_id,
                STRING_AGG(DISTINCT r.rol_name, ', ') AS roles,
                COALESCE(STRING_AGG(DISTINCT h.head_off_name, ', '), '-') AS head_office,
                COALESCE(STRING_AGG(DISTINCT c.cam_name, ', '), '-') AS campus
            FROM users u
            -- We use an INNER JOIN here to ONLY get users with active roles
            JOIN user_roles ur ON u.usr_id = ur.usr_id AND ur.sta_id = fn_get_status_id('general', 'active')
            JOIN roles r ON ur.rol_id = r.rol_id
            LEFT JOIN head_offices h ON ur.head_off_id = h.head_off_id
            LEFT JOIN campuses c ON ur.cam_id = c.cam_id
            WHERE u.sta_id = fn_get_status_id('general', 'active')
            GROUP BY u.usr_id, u.first_name, u.last_name, u.email, u.sta_id
            ORDER BY u.usr_id DESC