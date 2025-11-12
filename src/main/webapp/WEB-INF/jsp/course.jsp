<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My JSP Page</title>
    <style>
        /* Lesson list styles */
        .lessons-wrap { max-width: 1100px; margin: 0 auto; padding: 20px; }
        .lessons-header { text-align: center; margin-bottom: 16px; }
        .lesson-list { display: flex; flex-wrap: wrap; gap: 16px; justify-content: center; }
        .lesson-card {
            width: 260px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 14px;
            box-shadow: 0 2px 6px rgba(16,24,40,0.04);
            transition: transform .15s ease, box-shadow .15s ease;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .lesson-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 8px 20px rgba(16,24,40,0.08);
        }
        .lesson-link { color: #0b5ed7; text-decoration: none; display:block; }
        .lesson-link:hover { text-decoration: underline; }
        .lesson-title { font-weight: 600; color: #111827; margin-bottom: 6px; }
        .lesson-meta { font-size: 0.9rem; color: #6b7280; }
        .lesson-empty { text-align: center; color: #6b7280; padding: 20px 0; }
        @media (max-width: 480px) {
            .lesson-card { width: 100%; }
        }
    </style>
</head>
<body  style="text-align: center;">
<%@ include file="main.jsp" %>
<hr/>
<br/>

    <div class="lessons-wrap">
        <h1 class="lessons-header">Lesson - Details</h1>
        <hr/>

        <!-- Iterate lessons collection and render as cards -->
        <c:if test="${not empty course.lessons}">
            <div class="lesson-list">
                <c:forEach var="lesson" items="${course.lessons}">
                    <div class="lesson-card">
                        <div>
                            <a class="lesson-link" href="${pageContext.request.contextPath}/openLesson?lessonId=${lesson.id}">
                                <div class="lesson-title">${lesson.name}</div>
                                <div class="lesson-meta">Lesson ID: ${lesson.id}</div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty course.lessons}">
            <div class="lesson-empty">No lessons available for this course.</div>
        </c:if>

    </div>

<br/>
<br/>

</body>
</html>