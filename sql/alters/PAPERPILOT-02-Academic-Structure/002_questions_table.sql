-- ==========================================
-- QUESTION BANK: Tables
-- ==========================================
/**
 * @description Creates the central questions table. 
 * Uses BIGINT for scalability (10M+ rows) and JSONB for flexible content.
 */

CREATE TABLE IF NOT EXISTS questions (
    que_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    
    -- Ownership Context (Platform Admin creates these, so owner is Platform)
    sub_id BIGINT NOT NULL REFERENCES subjects(sub_id) ON DELETE RESTRICT,
    cha_id BIGINT REFERENCES chapters(cha_id) ON DELETE RESTRICT, -- Optional (can be a general question)
    
    -- Question Data
    difficulty VARCHAR(20) NOT NULL CHECK (Difficulty IN ('Easy', 'Medium', 'Hard')),
    question_text TEXT NOT NULL,
    
    -- Flexible options for MCQ/True-False/Matching
    options JSONB NOT NULL, 
    correct_answer JSONB NOT NULL,
    explanation TEXT, -- Optional explanation for the answer
    
    -- Status & Audit
    sta_id INT REFERENCES statuses(sta_id) DEFAULT fn_get_status_id('question', 'draft'),
    created_by INT REFERENCES users(usr_id) ON DELETE RESTRICT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add updated_at trigger
DROP TRIGGER IF EXISTS trg_questions_updated_at ON questions;
CREATE TRIGGER trg_questions_updated_at BEFORE UPDATE ON questions FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at();

-- Grant permissions to the app user
SELECT grant_app_permissions();