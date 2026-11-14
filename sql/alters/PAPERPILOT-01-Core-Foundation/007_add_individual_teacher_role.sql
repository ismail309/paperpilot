INSERT INTO roles (rol_name, description) VALUES
('individual_teacher', 'Independent teacher operating outside an organisation')
ON CONFLICT (rol_name) DO NOTHING;