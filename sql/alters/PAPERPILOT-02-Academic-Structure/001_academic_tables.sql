-- ==========================================
-- ACADEMIC STRUCTURE: Tables
-- ==========================================
/**
 * @description Creates the core academic structure tables: Subjects, Classes, Chapters, and Topics.
 * Uses BIGINT for scale (millions of records) and ON DELETE RESTRICT to protect data integrity.
 */

-- 1. Subjects (e.g., Mathematics, Physics)
CREATE TABLE IF NOT EXISTS subjects (
    sub_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sub_name VARCHAR(100) NOT NULL UNIQUE,
    sub_code VARCHAR(20) UNIQUE,
    sta_id INT REFERENCES statuses(sta_id) DEFAULT fn_get_status_id('general', 'active'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Classes (e.g., Class 9, Class 10)
CREATE TABLE IF NOT EXISTS classes (
    cla_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cla_name VARCHAR(100) NOT NULL UNIQUE,
    sta_id INT REFERENCES statuses(sta_id) DEFAULT fn_get_status_id('general', 'active'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Chapters (Linked to Subjects and Classes)
CREATE TABLE IF NOT EXISTS chapters (
    cha_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sub_id BIGINT NOT NULL REFERENCES subjects(sub_id) ON DELETE RESTRICT,
    cla_id BIGINT NOT NULL REFERENCES classes(cla_id) ON DELETE RESTRICT,
    cha_name VARCHAR(200) NOT NULL,
    cha_number INT,
    sta_id INT REFERENCES statuses(sta_id) DEFAULT fn_get_status_id('general', 'active'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(sub_id, cla_id, cha_name)
);

-- 4. Topics (Linked to Chapters)
CREATE TABLE IF NOT EXISTS topics (
    top_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cha_id BIGINT NOT NULL REFERENCES chapters(cha_id) ON DELETE RESTRICT,
    top_name VARCHAR(200) NOT NULL,
    sta_id INT REFERENCES statuses(sta_id) DEFAULT fn_get_status_id('general', 'active'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add updated_at triggers
DROP TRIGGER IF EXISTS trg_subjects_updated_at ON subjects;
CREATE TRIGGER trg_subjects_updated_at BEFORE UPDATE ON subjects FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at();

DROP TRIGGER IF EXISTS trg_classes_updated_at ON classes;
CREATE TRIGGER trg_classes_updated_at BEFORE UPDATE ON classes FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at();

DROP TRIGGER IF EXISTS trg_chapters_updated_at ON chapters;
CREATE TRIGGER trg_chapters_updated_at BEFORE UPDATE ON chapters FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at();

DROP TRIGGER IF EXISTS trg_topics_updated_at ON topics;
CREATE TRIGGER trg_topics_updated_at BEFORE UPDATE ON topics FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at();


-- ==========================================
-- ACADEMIC STRUCTURE: Seed Data
-- ==========================================

-- Seed Subjects
INSERT INTO subjects (sub_name, sub_code) VALUES 
('Mathematics', 'MATH'), 
('Physics', 'PHY'), 
('Computer Science', 'CS')
ON CONFLICT (sub_name) DO NOTHING;

-- Seed Classes
INSERT INTO classes (cla_name) VALUES 
('Class 9'), 
('Class 10'), 
('Class 11')
ON CONFLICT (cla_name) DO NOTHING;

-- Seed Chapters (Example for Mathematics Class 9)
INSERT INTO chapters (sub_id, cla_id, cha_name, cha_number) VALUES 
((SELECT sub_id FROM subjects WHERE sub_code = 'MATH'), (SELECT cla_id FROM classes WHERE cla_name = 'Class 9'), 'Matrices and Determinants', 1),
((SELECT sub_id FROM subjects WHERE sub_code = 'MATH'), (SELECT cla_id FROM classes WHERE cla_name = 'Class 9'), 'Real and Complex Numbers', 2)
ON CONFLICT DO NOTHING;