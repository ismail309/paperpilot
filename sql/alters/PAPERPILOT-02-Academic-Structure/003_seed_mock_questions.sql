-- Auto-generated mock questions


INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Medium',
    'Mock Medium question #1 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Easy',
    'Mock Easy question #2 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Easy',
    'Mock Easy question #3 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Hard',
    'Mock Hard question #4 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Kinematics' LIMIT 1),
    'Hard',
    'Mock Hard question #5 regarding Kinematics in Physics.',
    '{"A": "Option A for Kinematics", "B": "Option B for Kinematics", "C": "Option C for Kinematics", "D": "Option D for Kinematics"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Easy',
    'Mock Easy question #6 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Hard',
    'Mock Hard question #7 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Easy',
    'Mock Easy question #8 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Hard',
    'Mock Hard question #9 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Matrices and Determinants' LIMIT 1),
    'Medium',
    'Mock Medium question #10 regarding Matrices and Determinants in Mathematics.',
    '{"A": "Option A for Matrices and Determinants", "B": "Option B for Matrices and Determinants", "C": "Option C for Matrices and Determinants", "D": "Option D for Matrices and Determinants"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Medium',
    'Mock Medium question #11 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Matrices and Determinants' LIMIT 1),
    'Easy',
    'Mock Easy question #12 regarding Matrices and Determinants in Mathematics.',
    '{"A": "Option A for Matrices and Determinants", "B": "Option B for Matrices and Determinants", "C": "Option C for Matrices and Determinants", "D": "Option D for Matrices and Determinants"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Hard',
    'Mock Hard question #13 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Medium',
    'Mock Medium question #14 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Hard',
    'Mock Hard question #15 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Medium',
    'Mock Medium question #16 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Matrices and Determinants' LIMIT 1),
    'Easy',
    'Mock Easy question #17 regarding Matrices and Determinants in Mathematics.',
    '{"A": "Option A for Matrices and Determinants", "B": "Option B for Matrices and Determinants", "C": "Option C for Matrices and Determinants", "D": "Option D for Matrices and Determinants"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Kinematics' LIMIT 1),
    'Hard',
    'Mock Hard question #18 regarding Kinematics in Physics.',
    '{"A": "Option A for Kinematics", "B": "Option B for Kinematics", "C": "Option C for Kinematics", "D": "Option D for Kinematics"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Hard',
    'Mock Hard question #19 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Hard',
    'Mock Hard question #20 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Easy',
    'Mock Easy question #21 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Hard',
    'Mock Hard question #22 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Matrices and Determinants' LIMIT 1),
    'Hard',
    'Mock Hard question #23 regarding Matrices and Determinants in Mathematics.',
    '{"A": "Option A for Matrices and Determinants", "B": "Option B for Matrices and Determinants", "C": "Option C for Matrices and Determinants", "D": "Option D for Matrices and Determinants"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Medium',
    'Mock Medium question #24 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Medium',
    'Mock Medium question #25 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Kinematics' LIMIT 1),
    'Easy',
    'Mock Easy question #26 regarding Kinematics in Physics.',
    '{"A": "Option A for Kinematics", "B": "Option B for Kinematics", "C": "Option C for Kinematics", "D": "Option D for Kinematics"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Easy',
    'Mock Easy question #27 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Hard',
    'Mock Hard question #28 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Easy',
    'Mock Easy question #29 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Kinematics' LIMIT 1),
    'Medium',
    'Mock Medium question #30 regarding Kinematics in Physics.',
    '{"A": "Option A for Kinematics", "B": "Option B for Kinematics", "C": "Option C for Kinematics", "D": "Option D for Kinematics"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Easy',
    'Mock Easy question #31 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Medium',
    'Mock Medium question #32 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Kinematics' LIMIT 1),
    'Medium',
    'Mock Medium question #33 regarding Kinematics in Physics.',
    '{"A": "Option A for Kinematics", "B": "Option B for Kinematics", "C": "Option C for Kinematics", "D": "Option D for Kinematics"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Matrices and Determinants' LIMIT 1),
    'Easy',
    'Mock Easy question #34 regarding Matrices and Determinants in Mathematics.',
    '{"A": "Option A for Matrices and Determinants", "B": "Option B for Matrices and Determinants", "C": "Option C for Matrices and Determinants", "D": "Option D for Matrices and Determinants"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Medium',
    'Mock Medium question #35 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Easy',
    'Mock Easy question #36 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Easy',
    'Mock Easy question #37 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Hard',
    'Mock Hard question #38 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Easy',
    'Mock Easy question #39 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Medium',
    'Mock Medium question #40 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Hard',
    'Mock Hard question #41 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Hard',
    'Mock Hard question #42 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Kinematics' LIMIT 1),
    'Easy',
    'Mock Easy question #43 regarding Kinematics in Physics.',
    '{"A": "Option A for Kinematics", "B": "Option B for Kinematics", "C": "Option C for Kinematics", "D": "Option D for Kinematics"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Hard',
    'Mock Hard question #44 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Medium',
    'Mock Medium question #45 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Hard',
    'Mock Hard question #46 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Medium',
    'Mock Medium question #47 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Hard',
    'Mock Hard question #48 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Easy',
    'Mock Easy question #49 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Hard',
    'Mock Hard question #50 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Hard',
    'Mock Hard question #51 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Matrices and Determinants' LIMIT 1),
    'Easy',
    'Mock Easy question #52 regarding Matrices and Determinants in Mathematics.',
    '{"A": "Option A for Matrices and Determinants", "B": "Option B for Matrices and Determinants", "C": "Option C for Matrices and Determinants", "D": "Option D for Matrices and Determinants"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Easy',
    'Mock Easy question #53 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Medium',
    'Mock Medium question #54 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Matrices and Determinants' LIMIT 1),
    'Hard',
    'Mock Hard question #55 regarding Matrices and Determinants in Mathematics.',
    '{"A": "Option A for Matrices and Determinants", "B": "Option B for Matrices and Determinants", "C": "Option C for Matrices and Determinants", "D": "Option D for Matrices and Determinants"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Medium',
    'Mock Medium question #56 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Hard',
    'Mock Hard question #57 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Easy',
    'Mock Easy question #58 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Matrices and Determinants' LIMIT 1),
    'Medium',
    'Mock Medium question #59 regarding Matrices and Determinants in Mathematics.',
    '{"A": "Option A for Matrices and Determinants", "B": "Option B for Matrices and Determinants", "C": "Option C for Matrices and Determinants", "D": "Option D for Matrices and Determinants"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Easy',
    'Mock Easy question #60 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Matrices and Determinants' LIMIT 1),
    'Hard',
    'Mock Hard question #61 regarding Matrices and Determinants in Mathematics.',
    '{"A": "Option A for Matrices and Determinants", "B": "Option B for Matrices and Determinants", "C": "Option C for Matrices and Determinants", "D": "Option D for Matrices and Determinants"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Easy',
    'Mock Easy question #62 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Easy',
    'Mock Easy question #63 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Hard',
    'Mock Hard question #64 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Easy',
    'Mock Easy question #65 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Kinematics' LIMIT 1),
    'Hard',
    'Mock Hard question #66 regarding Kinematics in Physics.',
    '{"A": "Option A for Kinematics", "B": "Option B for Kinematics", "C": "Option C for Kinematics", "D": "Option D for Kinematics"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Matrices and Determinants' LIMIT 1),
    'Easy',
    'Mock Easy question #67 regarding Matrices and Determinants in Mathematics.',
    '{"A": "Option A for Matrices and Determinants", "B": "Option B for Matrices and Determinants", "C": "Option C for Matrices and Determinants", "D": "Option D for Matrices and Determinants"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Matrices and Determinants' LIMIT 1),
    'Medium',
    'Mock Medium question #68 regarding Matrices and Determinants in Mathematics.',
    '{"A": "Option A for Matrices and Determinants", "B": "Option B for Matrices and Determinants", "C": "Option C for Matrices and Determinants", "D": "Option D for Matrices and Determinants"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Easy',
    'Mock Easy question #69 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Medium',
    'Mock Medium question #70 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Medium',
    'Mock Medium question #71 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Kinematics' LIMIT 1),
    'Hard',
    'Mock Hard question #72 regarding Kinematics in Physics.',
    '{"A": "Option A for Kinematics", "B": "Option B for Kinematics", "C": "Option C for Kinematics", "D": "Option D for Kinematics"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Medium',
    'Mock Medium question #73 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Kinematics' LIMIT 1),
    'Medium',
    'Mock Medium question #74 regarding Kinematics in Physics.',
    '{"A": "Option A for Kinematics", "B": "Option B for Kinematics", "C": "Option C for Kinematics", "D": "Option D for Kinematics"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Hard',
    'Mock Hard question #75 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Easy',
    'Mock Easy question #76 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Medium',
    'Mock Medium question #77 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Hard',
    'Mock Hard question #78 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Medium',
    'Mock Medium question #79 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Medium',
    'Mock Medium question #80 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Medium',
    'Mock Medium question #81 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Hard',
    'Mock Hard question #82 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Medium',
    'Mock Medium question #83 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Easy',
    'Mock Easy question #84 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Medium',
    'Mock Medium question #85 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Matrices and Determinants' LIMIT 1),
    'Easy',
    'Mock Easy question #86 regarding Matrices and Determinants in Mathematics.',
    '{"A": "Option A for Matrices and Determinants", "B": "Option B for Matrices and Determinants", "C": "Option C for Matrices and Determinants", "D": "Option D for Matrices and Determinants"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Hard',
    'Mock Hard question #87 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Kinematics' LIMIT 1),
    'Hard',
    'Mock Hard question #88 regarding Kinematics in Physics.',
    '{"A": "Option A for Kinematics", "B": "Option B for Kinematics", "C": "Option C for Kinematics", "D": "Option D for Kinematics"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Medium',
    'Mock Medium question #89 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Medium',
    'Mock Medium question #90 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Easy',
    'Mock Easy question #91 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Dynamics' LIMIT 1),
    'Hard',
    'Mock Hard question #92 regarding Dynamics in Physics.',
    '{"A": "Option A for Dynamics", "B": "Option B for Dynamics", "C": "Option C for Dynamics", "D": "Option D for Dynamics"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Medium',
    'Mock Medium question #93 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Data Structures' LIMIT 1),
    'Easy',
    'Mock Easy question #94 regarding Data Structures in Computer Science.',
    '{"A": "Option A for Data Structures", "B": "Option B for Data Structures", "C": "Option C for Data Structures", "D": "Option D for Data Structures"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Kinematics' LIMIT 1),
    'Medium',
    'Mock Medium question #95 regarding Kinematics in Physics.',
    '{"A": "Option A for Kinematics", "B": "Option B for Kinematics", "C": "Option C for Kinematics", "D": "Option D for Kinematics"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Physics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Kinematics' LIMIT 1),
    'Easy',
    'Mock Easy question #96 regarding Kinematics in Physics.',
    '{"A": "Option A for Kinematics", "B": "Option B for Kinematics", "C": "Option C for Kinematics", "D": "Option D for Kinematics"}',
    '{"answer": "D"}',
    'This is the explanation for why D is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Matrices and Determinants' LIMIT 1),
    'Hard',
    'Mock Hard question #97 regarding Matrices and Determinants in Mathematics.',
    '{"A": "Option A for Matrices and Determinants", "B": "Option B for Matrices and Determinants", "C": "Option C for Matrices and Determinants", "D": "Option D for Matrices and Determinants"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Real and Complex Numbers' LIMIT 1),
    'Easy',
    'Mock Easy question #98 regarding Real and Complex Numbers in Mathematics.',
    '{"A": "Option A for Real and Complex Numbers", "B": "Option B for Real and Complex Numbers", "C": "Option C for Real and Complex Numbers", "D": "Option D for Real and Complex Numbers"}',
    '{"answer": "A"}',
    'This is the explanation for why A is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Mathematics' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Matrices and Determinants' LIMIT 1),
    'Medium',
    'Mock Medium question #99 regarding Matrices and Determinants in Mathematics.',
    '{"A": "Option A for Matrices and Determinants", "B": "Option B for Matrices and Determinants", "C": "Option C for Matrices and Determinants", "D": "Option D for Matrices and Determinants"}',
    '{"answer": "B"}',
    'This is the explanation for why B is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);

INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = 'Computer Science' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = 'Basic Programming' LIMIT 1),
    'Hard',
    'Mock Hard question #100 regarding Basic Programming in Computer Science.',
    '{"A": "Option A for Basic Programming", "B": "Option B for Basic Programming", "C": "Option C for Basic Programming", "D": "Option D for Basic Programming"}',
    '{"answer": "C"}',
    'This is the explanation for why C is the correct answer.',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);
