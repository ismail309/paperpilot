from fastapi import APIRouter, HTTPException
from backend.config import get_connection_string
from psycopg.rows import dict_row
import psycopg
from pydantic import BaseModel
from typing import Optional, Dict
import json

router = APIRouter()

class QuestionCreate(BaseModel):
    sub_id: int
    cha_id: Optional[int] = None
    difficulty: str
    question_text: str
    options: Dict[str, str]
    correct_answer: Dict[str, str]
    explanation: Optional[str] = None
    created_by: int # For now, we pass the user_id manually

@router.get("/questions")
def get_questions(sub_id: Optional[int] = None):
    conn = psycopg.connect(get_connection_string())
    with conn.cursor(row_factory=dict_row) as cursor:
        query = """
            SELECT q.*, s.sub_name, c.cha_name 
            FROM questions q
            JOIN subjects s ON q.sub_id = s.sub_id
            LEFT JOIN chapters c ON q.cha_id = c.cha_id
            WHERE q.sta_id = fn_get_status_id('question', 'draft')
        """
        params = []
        
        if sub_id:
            query += " AND q.sub_id = %s"
            params.append(sub_id)
            
        query += " ORDER BY q.que_id DESC"
        
        cursor.execute(query, tuple(params))
        return cursor.fetchall()

@router.post("/questions")
def create_question(data: QuestionCreate):
    conn = psycopg.connect(get_connection_string())
    try:
        with conn.cursor() as cursor:
            cursor.execute("""
                INSERT INTO questions (
                    sub_id, cha_id, difficulty, question_text, options, correct_answer, explanation, created_by
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                RETURNING que_id
            """, (
                data.sub_id, data.cha_id, data.difficulty, data.question_text, 
                json.dumps(data.options), json.dumps(data.correct_answer), 
                data.explanation, data.created_by
            ))
            new_id = cursor.fetchone()[0]
            conn.commit()
            return {"message": "Question created", "que_id": new_id}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()