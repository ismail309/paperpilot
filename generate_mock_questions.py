import random

# Configuration
NUM_QUESTIONS = 100
OUTPUT_FILE = "sql/alters/PAPERPILOT-02-Academic-Structure/003_seed_mock_questions.sql"

# We will fetch IDs dynamically in SQL using subqueries, 
# but we need the names to generate the text.
subjects = ["Mathematics", "Physics", "Computer Science"]
chapters = {
    "Mathematics": ["Matrices and Determinants", "Real and Complex Numbers"],
    "Physics": ["Kinematics", "Dynamics"],
    "Computer Science": ["Basic Programming", "Data Structures"]
}

difficulties = ["Easy", "Medium", "Hard"]
letters = ["A", "B", "C", "D"]

def generate_question_sql(index, sub_name, cha_name, diff):
    """Generates a single SQL INSERT statement for a mock question."""
    
    # Create a fake question text based on the subject/chapter
    q_text = f"Mock {diff} question #{index} regarding {cha_name} in {sub_name}."
    
    # Fake options
    opt_a = f"Option A for {cha_name}"
    opt_b = f"Option B for {cha_name}"
    opt_c = f"Option C for {cha_name}"
    opt_d = f"Option D for {cha_name}"
    
    correct = random.choice(letters)
    explanation = f"This is the explanation for why {correct} is the correct answer."
    
    # We use the JSONB syntax for options and correct_answer
    options_json = f'{{"A": "{opt_a}", "B": "{opt_b}", "C": "{opt_c}", "D": "{opt_d}"}}'
    correct_json = f'{{"answer": "{correct}"}}'
    
    # SQL uses subqueries to look up the sub_id and cha_id dynamically
    sql = f"""
INSERT INTO questions (sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by, sta_id)
VALUES (
    (SELECT sub_id FROM subjects WHERE sub_name = '{sub_name}' LIMIT 1),
    (SELECT cha_id FROM chapters WHERE cha_name = '{cha_name}' LIMIT 1),
    '{diff}',
    '{q_text}',
    '{options_json}',
    '{correct_json}',
    '{explanation}',
    1, -- Created by Platform Admin (Ismail)
    fn_get_status_id('question', 'draft')
);
"""
    return sql

def main():
    sql_statements = ["-- Auto-generated mock questions\n\n"]
    
    for i in range(1, NUM_QUESTIONS + 1):
        sub_name = random.choice(subjects)
        cha_name = random.choice(chapters[sub_name])
        diff = random.choice(difficulties)
        
        sql_statements.append(generate_question_sql(i, sub_name, cha_name, diff))

    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.writelines(sql_statements)
        
    print(f"✅ Successfully generated {NUM_QUESTIONS} questions in {OUTPUT_FILE}")

if __name__ == "__main__":
    main()