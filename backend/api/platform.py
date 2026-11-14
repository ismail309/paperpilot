from fastapi import APIRouter, HTTPException, Depends
from backend.config import get_connection_string
from backend.schemas.platform import HeadOfficeCreate, CampusCreate, UserCreate
from backend.core.security import get_password_hash
from psycopg.rows import dict_row
import psycopg

router = APIRouter()

# --- HEAD OFFICES ---
@router.get("/head-offices")
def get_head_offices():
    conn = psycopg.connect(get_connection_string())
    with conn.cursor(row_factory=dict_row) as cursor:
        # ADDED: WHERE sta_id = fn_get_status_id('general', 'active')
        cursor.execute("""
            SELECT head_off_id, head_off_name, email, city 
            FROM head_offices 
            WHERE sta_id = fn_get_status_id('general', 'active')
        """)
        return cursor.fetchall()

@router.post("/head-offices")
def create_head_office(data: HeadOfficeCreate):
    conn = psycopg.connect(get_connection_string())
    try:
        with conn.cursor() as cursor:
            # Using the utility function to get active status
            cursor.execute("""
                INSERT INTO head_offices (head_off_name, email, phone_no, city, sta_id)
                VALUES (%s, %s, %s, %s, fn_get_status_id('general', 'active'))
                RETURNING head_off_id
            """, (data.head_off_name, data.email, data.phone_no, data.city))
            new_id = cursor.fetchone()[0]
            conn.commit()
            return {"message": "Head Office created", "head_off_id": new_id}
    except psycopg.errors.UniqueViolation: # <-- CATCH UNIQUE ERROR
        conn.rollback()
        raise HTTPException(status_code=400, detail="A Head Office with this name already exists.")
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()

# --- CAMPUSES ---
@router.get("/campuses")
def get_campuses():
    conn = psycopg.connect(get_connection_string())
    with conn.cursor(row_factory=dict_row) as cursor:
        cursor.execute("""
            SELECT c.cam_id, c.cam_name, c.city, h.head_off_name 
            FROM campuses c 
            JOIN head_offices h ON c.head_off_id = h.head_off_id 
            WHERE c.sta_id = fn_get_status_id('general', 'active')
            AND h.sta_id = fn_get_status_id('general', 'active') 
        """)
        return cursor.fetchall()

@router.post("/campuses")
def create_campus(data: CampusCreate):
    conn = psycopg.connect(get_connection_string())
    try:
        with conn.cursor() as cursor:
            cursor.execute("""
                INSERT INTO campuses (head_off_id, cam_name, email, phone_no, city, sta_id)
                VALUES (%s, %s, %s, %s, %s, fn_get_status_id('general', 'active'))
                RETURNING cam_id
            """, (data.head_off_id, data.cam_name, data.email, data.phone_no, data.city))
            new_id = cursor.fetchone()[0]
            conn.commit()
            return {"message": "Campus created", "cam_id": new_id}
    except psycopg.errors.UniqueViolation: # <-- CATCH UNIQUE ERROR
        conn.rollback()
        raise HTTPException(status_code=400, detail="A Campus with this name already exists.")
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()

# --- USERS ---
@router.get("/users")
def get_users():
    conn = psycopg.connect(get_connection_string())
    with conn.cursor(row_factory=dict_row) as cursor:
        cursor.execute("""
            SELECT 
                u.usr_id, 
                u.first_name, 
                u.last_name, 
                u.email, 
                u.sta_id,
                STRING_AGG(r.rol_name, ', ') AS roles
            FROM users u
            LEFT JOIN user_roles ur ON u.usr_id = ur.usr_id
            LEFT JOIN roles r ON ur.rol_id = r.rol_id
            WHERE u.sta_id = fn_get_status_id('general', 'active')
            GROUP BY u.usr_id, u.first_name, u.last_name, u.email, u.sta_id
            ORDER BY u.usr_id DESC
        """)
        return cursor.fetchall()

@router.post("/users")
def create_user(data: UserCreate):
    conn = psycopg.connect(get_connection_string())
    try:
        with conn.cursor(row_factory=dict_row) as cursor:
            # Check if email exists
            cursor.execute("SELECT usr_id FROM users WHERE email = %s", (data.email,))
            if cursor.fetchone():
                raise HTTPException(status_code=400, detail="Email already registered")

            # Hash password
            hashed_pw = get_password_hash(data.password)

            # Insert User (using act_id for 'organisation' or 'individual')
            # For simplicity, we assume act_id 2 (Organisation) if head_off_id is provided, else 1 (Individual)
            act_type = 'organisation' if data.head_off_id else 'individual'
            
            cursor.execute("""
                INSERT INTO users (act_id, sta_id, first_name, last_name, email, password_hash)
                VALUES (fn_get_account_type_id(%s), fn_get_status_id('general', 'active'), %s, %s, %s, %s)
                RETURNING usr_id
            """, (act_type, data.first_name, data.last_name, data.email, hashed_pw))
            new_usr_id = cursor.fetchone()["usr_id"]

            # Assign Role
            cursor.execute("""
                INSERT INTO user_roles (usr_id, rol_id, head_off_id, cam_id)
                VALUES (%s, fn_get_role_id(%s), %s, %s)
            """, (new_usr_id, data.role_name, data.head_off_id, data.cam_id))

            conn.commit()
            return {"message": "User created", "usr_id": new_usr_id}
    except HTTPException as he:
        raise he
    except psycopg.errors.UniqueViolation:
        conn.rollback()
        raise HTTPException(status_code=400, detail="Email already registered.")
    except psycopg.errors.ForeignKeyViolation:
        conn.rollback()
        raise HTTPException(status_code=400, detail="Invalid Campus or Head Office selected.")
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()

# --- INDIVIDUAL USERS ---
@router.get("/individual-users")
def get_individual_users():
    conn = psycopg.connect(get_connection_string())
    with conn.cursor(row_factory=dict_row) as cursor:
        cursor.execute("""
            SELECT u.usr_id, u.first_name, u.last_name, u.email, u.created_at
            FROM users u
            JOIN account_types at ON u.act_id = at.act_id
            WHERE at.act_name = 'individual'
            ORDER BY u.usr_id DESC
        """)
        return cursor.fetchall()

@router.post("/individual-users")
def create_individual_user(data: UserCreate):
    conn = psycopg.connect(get_connection_string())
    try:
        with conn.cursor(row_factory=dict_row) as cursor:
            # Check if email exists
            cursor.execute("SELECT usr_id FROM users WHERE email = %s", (data.email,))
            if cursor.fetchone():
                raise HTTPException(status_code=400, detail="Email already registered")

            # Hash password
            hashed_pw = get_password_hash(data.password)

            # Insert User (Force Account Type to 'individual')
            cursor.execute("""
                INSERT INTO users (act_id, sta_id, first_name, last_name, email, password_hash)
                VALUES (fn_get_account_type_id('individual'), fn_get_status_id('general', 'active'), %s, %s, %s, %s)
                RETURNING usr_id
            """, (data.first_name, data.last_name, data.email, hashed_pw))
            
            new_usr_id = cursor.fetchone()["usr_id"]

            # Assign Role (Force role to 'individual_teacher')
            cursor.execute("""
                INSERT INTO user_roles (usr_id, rol_id)
                VALUES (%s, fn_get_role_id('individual_teacher'))
            """, (new_usr_id,))

            conn.commit()
            return {"message": "Individual User created", "usr_id": new_usr_id}
    except HTTPException as he:
            raise he
    except psycopg.errors.UniqueViolation:
            conn.rollback()
            raise HTTPException(status_code=400, detail="Email already registered.")
    except Exception as e:
            conn.rollback()
            raise HTTPException(status_code=500, detail=str(e))
    finally:
            conn.close()

# --- UPDATE & DEACTIVATE CAMPUS ---
@router.put("/campuses/{cam_id}")
def update_campus(cam_id: int, data: CampusCreate):
    conn = psycopg.connect(get_connection_string())
    try:
        with conn.cursor() as cursor:
            cursor.execute("""
                UPDATE campuses 
                SET cam_name = %s, email = %s, phone_no = %s, city = %s
                WHERE cam_id = %s
            """, (data.cam_name, data.email, data.phone_no, data.city, cam_id))
            conn.commit()
            return {"message": "Campus updated"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()

# --- DEACTIVATE HEAD OFFICE ---
@router.delete("/head-offices/{head_off_id}")
def deactivate_head_office(head_off_id: int):
    conn = psycopg.connect(get_connection_string())
    try:
        with conn.cursor() as cursor:
            cursor.execute("""
                UPDATE head_offices 
                SET sta_id = fn_get_status_id('general', 'inactive') 
                WHERE head_off_id = %s
            """, (head_off_id,))
            conn.commit()
            return {"message": "Head Office and all associated campuses deactivated"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()

# --- DEACTIVATE campuses ---
@router.delete("/campuses/{cam_id}")
def deactivate_campus(cam_id: int):
    conn = psycopg.connect(get_connection_string())
    try:
        with conn.cursor() as cursor:
            # The Database Trigger handles the campus_members cascade!
            cursor.execute("""
                UPDATE campuses 
                SET sta_id = fn_get_status_id('general', 'inactive') 
                WHERE cam_id = %s
            """, (cam_id,))
            conn.commit()
            return {"message": "Campus deactivated. Memberships handled by database trigger."}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()

# --- UPDATE & DEACTIVATE USER ---
@router.put("/users/{usr_id}/status")
def toggle_user_status(usr_id: int, is_active: bool):
    conn = psycopg.connect(get_connection_string())
    try:
        with conn.cursor() as cursor:
            status_name = 'active' if is_active else 'inactive'
            cursor.execute("""
                UPDATE users 
                SET sta_id = fn_get_status_id('general', %s) 
                WHERE usr_id = %s
            """, (status_name, usr_id))
            conn.commit()
            return {"message": f"User status changed to {status_name}"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()

