from fastapi import APIRouter, HTTPException
from backend.config import get_connection_string
from fastapi.responses import StreamingResponse
from backend.core.pdf_generator import generate_exam_pdf
from psycopg.rows import dict_row
import psycopg
from pydantic import BaseModel
from typing import Optional
import json
import random

router = APIRouter()

class ExamGenerateRequest(BaseModel):
    exa_title: str
    sub_id: int
    easy_count: int = 0
    medium_count: int = 0
    hard_count: int = 0
    created_by: int

@router.post("/generate")
def generate_exam(data: ExamGenerateRequest):
    conn = psycopg.connect(get_connection_string())
    try:
        with conn.cursor(row_factory=dict_row) as cursor:
            # 1. Fetch Questions based on criteria
            final_questions = []
            
            def fetch_qs(difficulty, count):
                if count <= 0: return []
                cursor.execute("""
                    SELECT * FROM questions 
                    WHERE sub_id = %s AND difficulty = %s 
                    AND sta_id = fn_get_status_id('question', 'draft')
                """, (data.sub_id, difficulty))
                qs = cursor.fetchall()
                # Randomly sample, or take all if not enough
                return random.sample(qs, min(count, len(qs)))

            final_questions.extend(fetch_qs('Easy', data.easy_count))
            final_questions.extend(fetch_qs('Medium', data.medium_count))
            final_questions.extend(fetch_qs('Hard', data.hard_count))

            if not final_questions:
                raise HTTPException(status_code=400, detail="No questions found for this criteria.")

            # 2. Create the Exam (Logical container)
            cursor.execute("""
                INSERT INTO exams (exa_title, sub_id, created_by)
                VALUES (%s, %s, %s) RETURNING exa_id
            """, (data.exa_title, data.sub_id, data.created_by))
            exa_id = cursor.fetchone()["exa_id"]

            # 3. Create the Exam Version (Version 1, Draft)
            cursor.execute("""
                INSERT INTO exam_versions (exa_id, version_number, total_marks)
                VALUES (%s, 1, %s) RETURNING exv_id
            """, (exa_id, len(final_questions))) # 1 mark per question for simplicity
            exv_id = cursor.fetchone()["exv_id"]

            # 4. Insert Exam Questions with Snapshots
            for q in final_questions:
                # Combine question text and options into a snapshot JSON
                snapshot = {
                    "question_text": q["question_text"],
                    "options": q["options"]
                }
                
                cursor.execute("""
                    INSERT INTO exam_version_questions (
                        exv_id, que_id, question_snapshot, answer_snapshot, marks
                    ) VALUES (%s, %s, %s, %s, 1)
                """, (exv_id, q["que_id"], json.dumps(snapshot), json.dumps(q["correct_answer"])))

            conn.commit()
            return {
                "message": "Exam generated successfully", 
                "exa_id": exa_id, 
                "exv_id": exv_id, 
                "total_questions": len(final_questions)
            }
            
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()

@router.get("/")
def get_exams():
    conn = psycopg.connect(get_connection_string())
    with conn.cursor(row_factory=dict_row) as cursor:
        cursor.execute("""
            SELECT 
                e.exa_id, 
                e.exa_title, 
                s.sub_name, 
                e.created_at, 
                ev.exv_id,
                ev.total_marks, 
                ev.sta_id
            FROM exams e
            JOIN subjects s ON e.sub_id = s.sub_id
            JOIN exam_versions ev ON e.exa_id = ev.exa_id
            ORDER BY e.exa_id DESC
        """)
        return cursor.fetchall()

@router.get("/{exv_id}/paper")
def get_exam_paper(exv_id: int):
    conn = psycopg.connect(get_connection_string())
    with conn.cursor(row_factory=dict_row) as cursor:
        cursor.execute("""
            SELECT evq.evq_id, evq.question_snapshot, evq.marks
            FROM exam_version_questions evq
            WHERE evq.exv_id = %s
        """, (exv_id,))
        return cursor.fetchall()

@router.get("/{exv_id}/pdf")
def download_exam_pdf(exv_id: int):
    conn = psycopg.connect(get_connection_string())
    try:
        with conn.cursor(row_factory=dict_row) as cursor:
            # 1. Get Exam Info
            cursor.execute("""
                SELECT e.exa_title, s.sub_name 
                FROM exam_versions ev
                JOIN exams e ON ev.exa_id = e.exa_id
                JOIN subjects s ON e.sub_id = s.sub_id
                WHERE ev.exv_id = %s
            """, (exv_id,))
            exam_info = cursor.fetchone()
            
            if not exam_info:
                raise HTTPException(status_code=404, detail="Exam not found")

            # 2. Get Questions
            cursor.execute("""
                SELECT question_snapshot FROM exam_version_questions 
                WHERE exv_id = %s ORDER BY evq_id
            """, (exv_id,))
            questions = cursor.fetchall()

            # 3. Generate PDF
            pdf_buffer = generate_exam_pdf(
                exam_info['exa_title'], 
                exam_info['sub_name'], 
                questions
            )

            # 4. Return as a downloadable file
            filename = f"Exam_{exv_id}.pdf"
            return StreamingResponse(
                pdf_buffer, 
                media_type="application/pdf",
                headers={"Content-Disposition": f"attachment; filename={filename}"}
            )
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()