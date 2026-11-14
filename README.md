# PaperPilot

![Python](https://img.shields.io/badge/Python-3.10%2B-blue)
![Flask](https://img.shields.io/badge/Flask-3.0.0-green)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15%2B-blue)
![License](https://img.shields.io/badge/License-MIT-yellow)

## 📌 Project Overview

PaperPilot is a **multi-tenant, cloud-based Examination and Question Bank Management System**. It is designed for independent teachers, schools, colleges, universities, and educational organizations to manage question banks, prepare examination papers, assign exams to students, and analyze results.

The platform supports multiple account types (Individual, Organisation, and Platform Admin) and handles complex scenarios like multi-campus organizations, cross-campus question sharing, and immutable historical exam snapshots.

## 🏗️ Core Architecture Principles

- **Modular Monolith:** Built as a single FastAPI application divided into logical modules (Auth, Orgs, Question Bank, Exams, Grading) rather than premature microservices.
- **Strict Tenant Isolation:** Ensures data from one organization or campus cannot be accessed by another.
- **Explicit Question Ownership:** Questions are stored once and reused via references, preventing unnecessary duplication.
- **Immutable Snapshots:** Once an exam is published, its content is snapshotted. Future edits to a question will never alter historical exams.
- **Versioning:** Full revision history for both questions and exams.

## 🛠️ Full Tech Stack

### Backend & Database

- **Language:** Python 3.10+
- **Web Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Database:** PostgreSQL
- **ORM:** SQLAlchemy 2.x
- **Database Migrations:** Alembic (alongside our custom `db_deploy` GitHub migration tool)
- **Authentication:** Argon2id (Password Hashing), JWT (Access/Refresh tokens)

### Frontend

- **Framework:** React
- **Language:** TypeScript
- **Build Tool:** Vite
- **Routing:** React Router
- **API State Management:** TanStack Query (React Query)
- **Local State:** Zustand
- **Forms & Validation:** React Hook Form + Zod
- **Styling:** Tailwind CSS
- **Rich Text & Math:** Tiptap (Rich Text), KaTeX/MathJax (Mathematics)
- **Charts & PDF:** Recharts (Analytics), PDF.js (Preview)

### Infrastructure & DevOps

- **Caching & Background Jobs:** Redis + Celery
- **File Storage:** S3-Compatible Object Storage (e.g., AWS S3, MinIO)
- **Containerization:** Docker
- **CI/CD:** GitHub Actions
- **Monitoring & Error Tracking:** Prometheus, Grafana, Sentry

---

## 🗄️ Database Architecture (ERD)

PaperPilot uses a highly normalized, multi-tenant PostgreSQL database.

To view the full Entity-Relationship Diagram, click the link below:
👉 **[View Full ERD](docs/paperpilot_erd.png)**

![PaperPilot ERD](docs/paperpilot_erd.png)

## 🗄️ Database Architecture Highlights

### 1. Central Status & Account Normalization

No arbitrary `VARCHAR` statuses in business tables. All statuses (Active, Inactive, Draft, Published, etc.) reference a central `statuses` table (`sta_id`). Account types (Individual, Organisation, Platform) reference a central `account_types` table (`act_id`).

### 2. Question Bank Ownership (4 Levels)

Questions are strictly owned and access is enforced via FastAPI and PostgreSQL Row-Level Security (where applicable):

1.  **Platform Question Bank:** Managed by SaaS Admin (Read-only for authorized customers).
2.  **Organisation Question Bank:** Managed by Head Office.
3.  **Campus Question Bank:** Managed by Campus Admins.
4.  **Individual Question Bank:** Managed by Independent Teachers.

### 3. JSONB for Flexible Content

Question content (rich text, math equations, images, options) is stored in a `JSONB` column (`question_revisions`). This allows the system to support MCQs, True/False, Short Answer, and Matching questions without schema changes for every new format.

### 4. Exam Versioning & Snapshots

The `exam_versions` table stores the logical paper, while `exam_version_questions` stores a **snapshot** of the question text and answer key at the time of publishing. This guarantees historical integrity.

---

## 📂 Project Structure

```text
PaperPilot/
│
├── frontend/               # React + Vite + Tailwind Frontend
│   ├── src/
│   │   ├── components/     # Reusable UI parts
│   │   ├── App.jsx         # Main App Router
│   │   ├── Auth.jsx        # Login/Register UI
│   │   ├── PlatformLayout.jsx
│   │   ├── TenantLayout.jsx
│   │   └── PlatformAdmin.jsx
│   └── package.json
│
├── backend/                # FastAPI Application (Modular Monolith)
│   ├── api/                # API Routers (auth, dashboard, platform)
│   ├── core/               # Security, Config, Auth logic
│   ├── schemas/            # Pydantic validation models
│   ├── services/           # Business logic (future)
│   ├── config.py           # Environment variables (ignored by Git)
│   └── main.py             # FastAPI Entrypoint
│
├── db_deploy/              # Custom Database CI/CD Tool
│   ├── bootstrap.py        # Creates DB and App Users securely
│   ├── deploy.py           # Fetches SQL from GitHub & runs migrations
│   └── config.py           # Migrator credentials (ignored by Git)
│
├── sql/                    # Database Engineering Scripts
│   │
│   ├── alters/             # Schema changes (Run ONCE, tracked in 'alters' table)
│   │   └── PAPERPILOT-01-Core-Foundation/
│   │       ├── 001_core_tables.sql
│   │       ├── 002_seed_tenants.sql
│   │       ├── 003_seed_users_roles.sql
│   │       └── 004_apply_triggers.sql
│   │
│   ├── utilities/          # Helper Functions (Run EVERY deployment)
│   │   └── 001_utility_functions.sql  # fn_get_status_id, cascade triggers, etc.
│   │
│   └── stored_procedures/  # Business Logic (Run EVERY deployment)
│       └── sp_manage_questions.sql    # CRUD for question bank (Phase 4)
│
├── docs/                   # Documentation & Diagrams
│   └── paperpilot_erd.png  # Database Entity-Relationship Diagram
│
├── requirements.txt        # Python dependencies
├── pyproject.toml          # uv project configuration
└── README.md
```

### THE PROJECT FOLLOWS A PHASED ARCHITECTURAL APPROACH:

- **Phase 1 - Foundation:** Project setup, FastAPI, React, PostgreSQL, Authentication, Account Types, Statuses.
- **Phase 2 - Organisation Management:** Organisation registration, campuses, invitations, memberships, roles/permissions.
- **Phase 3 - Academic Structure:** Subjects, Classes, Chapters, Topics.
- **Phase 4 - Question Bank:** Platform, Organisation, Campus, and Individual banks. Question Editor, Revisions, Media, Sharing.
- **Phase 5 - Examination Builder:** Exam creation, mixed-source selection, versioning, PDF generation.
- **Phase 6 - Student Management:** Registration, assignment, attempts, submission.
- **Phase 7 - Results & Reporting:** Automatic/Manual grading, student and campus reports.
- **Phase 8 - Production Readiness:** Security review, performance tuning, backups, deployment.
- **Phase 9 - Future Enhancements:** AI question generation, OCR, LMS integration, billing.

## 💻 How to Run Locally

### 1️⃣ Prerequisites

Ensure you have the following installed on your machine:

Python 3.10+
PostgreSQL (running on port 5432)
Node.js & npm (for the React frontend)
uv (Python package manager)

### 2️⃣ Set Up the Database

Create a PostgreSQL database named aoqpgs_db.
Duplicate config.example.py and rename it to config.py.
Open config.py and update the DB_PASS with your PostgreSQL password.

### 3️⃣ Run the Database Migration Tool

This tool will fetch the latest SQL scripts from the GitHub dev branch and execute them:

```sh
# Create virtual environment and install dependencies
uv venv
uv pip install -r requirements.txt

# Run the deployment tool
uv run python db_deploy/deploy.py
```

### 4️⃣ Start the FastAPI Backend

Open a terminal and run:

```sh
uv run uvicorn main:app --reload
```

The API will run at http://127.0.0.1:8000
You can view the interactive Swagger API documentation at http://127.0.0.1:8000/docs

### 5️⃣ Start the React Frontend

Open a new terminal window, navigate to the frontend folder, and run:

```sh
cd frontend
npm install
npm run dev
```

The React app will run at http://localhost:5173

## 🔥 Future Enhancements

- 📝 Admin Dashboard: A React form to add/edit questions directly from the UI.
- 🔐 User Authentication: Restrict paper generation to logged-in teachers.
- 📄 PDF Export: Export the generated paper as a printable PDF.
- 📱 Mobile App: React Native app communicating with the same FastAPI backend

## 🤝 Contribution

Feel free to fork this repository and submit pull requests! Contributions are welcome.

## 📜 License

This project is licensed under the MIT License.

For queries or collaborations, reach out to me at:

- 🔗 [LinkedIn Profile](https://www.linkedin.com/in/mohammad-ismail-382087105/)
- 💻 [GitHub Profile](https://github.com/ismail309)
