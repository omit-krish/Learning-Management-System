<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Instructor Details</title>
    <style>
        :root {
            --primary: #0d6efd;
            --primary-dark: #0b5ed7;
            --secondary: #6c757d;
            --light: #f8f9fa;
            --dark: #212529;
            --white: #ffffff;
            --border-color: #dee2e6;
            --shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            --radius: 12px;
        }

        body {
            margin: 0;
            font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            color: var(--dark);
            background-color: #f4f7fc;
        }

        .bg-container {
            background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url('https://images.unsplash.com/photo-1543269865-cbf427effbad?q=80&w=2070&auto=format&fit=crop');
            background-size: cover;
            background-position: center;
            padding: 50px 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .page-header {
            text-align: center;
            color: var(--white);
            margin-bottom: 40px;
        }

        .page-header h1 {
            font-size: 3rem;
            font-weight: 700;
            margin: 0;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .search-and-add-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            background: rgba(255,255,255,0.9);
            backdrop-filter: blur(8px);
            padding: 20px;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
        }

        .search-form {
            display: flex;
            gap: 10px;
            align-items: center;
            flex-grow: 1;
        }

        .search-form input[type="number"] {
            padding: 10px 15px;
            border-radius: 8px;
            border: 1px solid var(--border-color);
            font-size: 1rem;
            flex-grow: 1;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.2s ease;
        }
        .btn-primary { background-color: var(--primary); color: var(--white); }
        .btn-primary:hover { background-color: var(--primary-dark); }
        .btn-danger { background-color: #dc3545; color: var(--white); }
        .btn-danger:hover { background-color: #bb2d3b; }
        .btn-secondary { background-color: var(--secondary); color: var(--white); }
        .btn-secondary:hover { background-color: #5a6268; }

        .instructor-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 30px;
            padding: 40px 0;
        }

        .instructor-card {
            background: var(--white);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .card-header {
            padding: 20px;
            border-bottom: 1px solid var(--border-color);
        }
        .card-header h3 { margin: 0; font-size: 1.5rem; }
        .card-header .email { color: var(--secondary); font-size: 0.9rem; }

        .card-body { padding: 20px; flex-grow: 1; }
        .card-body h4 { margin-top: 0; margin-bottom: 10px; color: var(--primary); }

        .course-list { list-style: none; padding: 0; margin: 0; }
        .course-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #f1f1f1;
        }
        .course-item:last-child { border-bottom: none; }
        .course-name { font-weight: 500; }

        .card-footer {
            background-color: var(--light);
            padding: 15px 20px;
            text-align: right;
        }

        @media (max-width: 768px) {
            .search-and-add-bar { flex-direction: column; align-items: stretch; }
            .page-header h1 { font-size: 2.5rem; }
        }
    </style>
</head>
<body>

    <%@ include file="main.jsp" %>

    <div class="bg-container">
        <div class="container">
            <div class="page-header">
                <h1>Instructor Dashboard</h1>
            </div>
            <div class="search-and-add-bar">
                <form action="instructor/search" method="get" class="search-form">
                    <input type="number" name="id" placeholder="Search by Instructor ID..." required />
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
                <a href="addInstructor" class="btn btn-secondary">Add Instructor</a>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="instructor-grid">
            <c:forEach var="instructor" items="${instructors}">
                <div class="instructor-card">
                    <div class="card-header">
                        <h3>${instructor.name}</h3>
                        <span class="email">${instructor.mailId}</span>
                    </div>
                    <div class="card-body">
                        <h4>Courses</h4>
                        <ul class="course-list">
                            <c:forEach var="course" items="${instructor.courses}">
                                <li class="course-item">
                                    <span class="course-name">${course.name} (${course.duration})</span>
                                    <a href="viewCourse?courseID=${course.id}" class="btn btn-primary" style="padding: 5px 10px; font-size: 0.8rem;">View</a>
                                </li>
                            </c:forEach>
                            <c:if test="${empty instructor.courses}">
                                <li style="color: var(--secondary);">No courses assigned.</li>
                            </c:if>
                        </ul>
                    </div>
                    <div class="card-footer">
                        <a href="deleteByID/${instructor.id}" class="btn btn-danger">Delete Instructor</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</body>
</html>
