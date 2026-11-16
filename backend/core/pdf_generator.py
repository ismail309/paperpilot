from reportlab.lib.pagesizes import A4
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle
import io

def generate_exam_pdf(exam_title, subject_name, questions):
    """
    Generates a PDF for an exam paper.
    Returns a BytesIO object containing the PDF data.
    """
    buffer = io.BytesIO()
    doc = SimpleDocTemplate(
        buffer, 
        pagesize=A4, 
        rightMargin=40, leftMargin=40, topMargin=40, bottomMargin=40
    )
    
    styles = getSampleStyleSheet()
    title_style = ParagraphStyle(
        'TitleStyle', parent=styles['Heading1'], alignment=1, spaceAfter=20
    )
    question_style = ParagraphStyle(
        'QuestionStyle', parent=styles['Normal'], spaceAfter=10, fontName='Helvetica-Bold'
    )
    option_style = ParagraphStyle(
        'OptionStyle', parent=styles['Normal'], leftIndent=20, spaceAfter=5
    )

    elements = []

    # 1. Header
    elements.append(Paragraph(f"<b>{exam_title}</b>", title_style))
    elements.append(Paragraph(f"Subject: {subject_name}", styles['Heading2']))
    elements.append(Spacer(1, 10))
    elements.append(Paragraph("Total Marks: " + str(len(questions)), styles['Normal']))
    elements.append(Paragraph("Time Allowed: 60 Minutes", styles['Normal']))
    elements.append(Spacer(1, 20))

    # 2. Questions
    for idx, q in enumerate(questions, 1):
        snapshot = q['question_snapshot']
        q_text = snapshot.get('question_text', '')
        options = snapshot.get('options', {})

        elements.append(Paragraph(f"Q{idx}. {q_text}", question_style))
        
        for key, value in options.items():
            elements.append(Paragraph(f"<b>{key})</b> {value}", option_style))
            
        elements.append(Spacer(1, 10))

    # 3. Build PDF
    doc.build(elements)
    buffer.seek(0)
    return buffer