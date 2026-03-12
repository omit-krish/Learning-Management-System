<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Lesson</title>
    <style>
        :root{
            --bg: #f5f7fb;
            --card: #ffffff;
            --primary: #0d6efd; /* blue */
            --primary-600: #0b5ed7;
            --accent: #06b6d4; /* teal */
            --danger: #dc3545;
            --text: #111827;
            --muted: #6b7280;
            --border: #e6eef6;
            --radius: 10px;
        }

        html,body{height:100%;}
        body {
            font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
            background-color: var(--bg);
            padding: 40px 20px;
            color: var(--text);
            -webkit-font-smoothing:antialiased;
        }

        .form-container {
            background-color: var(--card);
            padding: 28px;
            max-width: 480px;
            margin: 24px auto;
            border-radius: var(--radius);
            box-shadow: 0 8px 30px rgba(14, 30, 37, 0.06);
            border: 1px solid rgba(15, 35, 45, 0.03);
        }

        h1 {
            margin-top: 0;
            margin-bottom: 24px;
            font-size: 1.5rem;
            color: var(--primary);
            text-align: center;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 16px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: var(--text);
            font-size: 0.95rem;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"],
        .form-control {
            width: 100%;
            padding: 10px 12px;
            /* margin-bottom: 14px; /* Removed for form-group */
            border: 1px solid var(--border);
            border-radius: 8px;
            background: #fff;
            box-sizing: border-box;
            color: var(--text);
            transition: box-shadow .12s ease, border-color .12s ease, transform .06s ease;
            font-size: 0.95rem;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="number"]:focus,
        .form-control:focus {
            outline: none;
            box-shadow: 0 6px 20px rgba(13,110,253,0.08);
            border-color: var(--primary-600);
            transform: translateY(-1px);
        }

        .hint { font-size:0.85rem; color:var(--muted); margin-top:-8px; margin-bottom:12px; }

        .actions { display:flex; gap:12px; align-items:center; justify-content:flex-end; margin-top:24px; }

        .btn-primary {
            background-color: var(--primary);
            color: #fff;
            padding: 10px 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 700;
            text-decoration: none;
            display:inline-block;
            box-shadow: 0 6px 18px rgba(13,110,253,0.12);
            transition: transform .08s ease, box-shadow .12s ease, background .08s ease;
        }

        .btn-primary:hover { background-color: var(--primary-600); transform: translateY(-2px); }

        .btn-secondary {
            background: transparent;
            border: 1px solid rgba(15,35,45,0.06);
            color: var(--muted);
            padding: 8px 12px;
            border-radius: 8px;
            cursor: pointer;
            font-weight:600;
        }

        /* small-screen adjustments */
        @media (max-width: 520px) {
            .form-container { padding: 18px; margin: 12px; }
            .actions { justify-content:stretch; flex-direction:column-reverse; }
            .btn-primary, .btn-secondary { width:100%; text-align:center; }
        }
    </style>
</head>
<body>
<%@ include file="main.jsp" %>

<div class="form-container">

    <h1>Add Lesson</h1>
    <form:form modelAttribute="lesson" method="post" action="save/lesson">
        <form:input type="hidden" path="course.id"/>
        <form:input type="hidden" path="id"/>

        <div class="form-group">
            <label for="name">Name:</label>
            <form:input path="name" id="name" cssClass="form-control" />
        </div>

        <div class="form-group">
            <label for="link">Lesson Link:</label>
            <form:input path="link" id="link" cssClass="form-control" />
        </div>

        <div class="form-group">
            <label for="courseName">Course:</label>
            <form:input path="course.name" id="courseName" cssClass="form-control" readonly="true"/>
        </div>

        <div class="actions">
            <input class="btn-primary" type="submit" value="Save Lesson" />
        </div>
    </form:form>
</div>

</body>
</html>
