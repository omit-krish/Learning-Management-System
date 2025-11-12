<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lesson</title>
    <style>
        .nav-buttons { margin: 20px 0; display:flex; gap:12px; justify-content:center; }
        .btn { padding:8px 12px; border-radius:6px; text-decoration:none; color:#fff; border: none; font-weight:600; }
        .btn-prev { background: #6c757d; /* gray */ }
        .btn-prev:hover { background: #5a6167; }
        .btn-next { background: #198754; /* green */ }
        .btn-next:hover { background: #146c43; }
        .btn-disabled { background:#e9ecef; color:#6c757d; cursor:not-allowed; padding:8px 12px; border-radius:6px; }
        .lesson-container { max-width:900px; margin:0 auto; text-align:left; }
        .nav-row { display:flex; justify-content:space-between; align-items:center; width:100%; margin-top:16px; }
        @media (max-width:480px) { .nav-row { flex-direction:column; gap:8px; } }
    </style>
</head>
<body>
<%@ include file="main.jsp" %>
<div class="lesson-container">
    <h1>Welcome to ${lesson.name}</h1>
    <hr/>
    <div align="center" class="nav-buttons">

        <c:choose>
            <c:when test="${not empty lesson.link}">
                ${lesson.link}
            </c:when>
            <c:otherwise>
                <span>No link available</span>
            </c:otherwise>
        </c:choose>
    </div>
    <br/>

<div class="nav-row">
    <div>
        <c:choose>
            <c:when test="${lesson.id gt pageDTO.firstLessonId}">
                <a class="btn btn-prev" href="openLesson?lessonId=${lesson.id - 1}">&laquo; Previous</a>
            </c:when>
            <c:otherwise>
                <span class="btn-disabled">&laquo; Previous</span>
            </c:otherwise>
        </c:choose>
    </div>

    <div>
        <c:choose>
            <c:when test="${lesson.id lt pageDTO.lastLessonId}">
                <a class="btn btn-next" href="openLesson?lessonId=${lesson.id + 1}">Next &raquo;</a>
            </c:when>
            <c:otherwise>
                <span class="btn-disabled">Next &raquo;</span>
            </c:otherwise>
        </c:choose>
    </div>
</div>


</div>

</body>
</html>