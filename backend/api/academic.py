from fastapi import APIRouter, HTTPException
from backend.config import get_connection_string
from psycopg.rows import dict_row
import psycopg
from pydantic import BaseModel
from typing import Optional

router = APIRouter()

# Schemas
class SubjectCreate(BaseModel):
    sub_name: str
    sub_code: Optional[str] = None

class ClassCreate(BaseModel):
    cla_name: str

class ChapterCreate(BaseModel):
    sub_id: int
    cla_id: int
    cha_name: str
    cha_number: Optional[int] = None

@router.get("/subjects")
def get_subjects():
    conn = psycopg.connect(get_connection_string())
    with conn.cursor(row_factory=dict_row) as cursor:
        cursor.execute("SELECT * FROM subjects WHERE sta_id = 1 ORDER BY sub_name")
        return cursor.fetchall()

@router.post("/subjects")
def create_subject(data: SubjectCreate):
    conn = psycopg.connect(get_connection_string())
    try:
        with conn.cursor(row_factory=dict_row) as cursor:
            cursor.execute("INSERT INTO subjects (sub_name, sub_code) VALUES (%s, %s) RETURNING sub_id", 
                           (data.sub_name, data.sub_code))
            conn.commit()
            return {"message": "Subject created", "sub_id": cursor.fetchone()["sub_id"]}
    except psycopg.errors.UniqueViolation:
        conn.rollback()
        raise HTTPException(status_code=400, detail="Subject name or code already exists.")
    finally:
        conn.close()

@router.get("/classes")
def get_classes():
    conn = psycopg.connect(get_connection_string())
    with conn.cursor(row_factory=dict_row) as cursor:
        cursor.execute("SELECT * FROM classes WHERE sta_id = 1 ORDER BY cla_name")
        return cursor.fetchall()

@router.post("/classes")
def create_class(data: ClassCreate):
    conn = psycopg.connect(get_connection_string())
    try:
        with conn.cursor(row_factory=dict_row) as cursor:
            cursor.execute("INSERT INTO classes (cla_name) VALUES (%s) RETURNING cla_id", (data.cla_name,))
            conn.commit()
            return {"message": "Class created", "cla_id": cursor.fetchone()["cla_id"]}
    except psycopg.errors.UniqueViolation:
        conn.rollback()
        raise HTTPException(status_code=400, detail="Class already exists.")
    finally:
        conn.close()

@router.get("/chapters")
def get_chapters():
    conn = psycopg.connect(get_connection_string())
    with conn.cursor(row_factory=dict_row) as cursor:
        cursor.execute("""
            SELECT c.*, s.sub_name, cl.cla_name 
            FROM chapters c
            JOIN subjects s ON c.sub_id = s.sub_id
            JOIN classes cl ON c.cla_id = cl.cla_id
            WHERE c.sta_id = 1 
            ORDER BY s.sub_name, cl.cla_name, c.cha_number
        """)
        return cursor.fetchall()

@router.post("/chapters")
def create_chapter(data: ChapterCreate):
    conn = psycopg.connect(get_connection_string())
    try:
        with conn.cursor(row_factory=dict_row) as cursor:
            cursor.execute("""
                INSERT INTO chapters (sub_id, cla_id, cha_name, cha_number) 
                VALUES (%s, %s, %s, %s) RETURNING cha_id
            """, (data.sub_id, data.cla_id, data.cha_name, data.cha_number))
            conn.commit()
            return {"message": "Chapter created", "cha_id": cursor.fetchone()["cha_id"]}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()