-- ==========================================
-- EXAMINATION BUILDER: Tables
-- ==========================================
/**
 * @description Creates tables for Exams, Exam Versions, and Exam Questions.
 * Uses snapshotting to ensure historical exam papers are immutable.
 */

-- 1. Logical Exams (The container)
CREATE TABLE IF NOT EXISTS exams (
    exa_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    exa_title VARCHAR(255) NOT NULL,
    sub_id BIGINT NOT NULL REFERENCES subjects(sub_id) ON DELETE RESTRICT,
    created_by INT NOT NULL REFERENCES users(usr_id) ON DELETE RESTRICT,
    sta_id INT REFERENCES statuses(sta_id) DEFAULT fn_get_status_id('exam', 'draft'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Exam Versions (Draft vs Published)
CREATE TABLE IF NOT EXISTS exam_versions (
    exv_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    exa_id BIGINT NOT NULL REFERENCES exams(exa_id) ON DELETE RESTRICT,
    version_number INT NOT NULL DEFAULT 1,
    total_marks INT NOT NULL DEFAULT 0,
    sta_id INT REFERENCES statuses(sta_id) DEFAULT fn_get_status_id('exam', 'draft'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(exa_id, version_number)
);

-- 3. Exam Version Questions (The Snapshots)
CREATE TABLE IF NOT EXISTS exam_version_questions (
    evq_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    exv_id BIGINT NOT NULL REFERENCES exam_versions(exv_id) ON DELETE RESTRICT,
    que_id BIGINT NOT NULL REFERENCES questions(que_id) ON DELETE RESTRICT,
    
    -- Snapshot columns to preserve history
    question_snapshot JSONB NOT NULL,
    answer_snapshot JSONB NOT NULL,
    marks INT DEFAULT 1,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Triggers for updated_at
DROP TRIGGER IF EXISTS trg_exams_updated_at ON exams;
CREATE TRIGGER trg_exams_updated_at BEFORE UPDATE ON exams FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at();

-- Grant permissions
SELECT grant_app_permissions();