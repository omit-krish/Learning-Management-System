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
        /* Pagination styles */
        .pagination { display: flex; justify-content: center; align-items: center; gap: 10px; margin-top: 20px; }
        .pagination a, .pagination span { text-decoration: none; padding: 8px 12px; border: 1px solid #ddd; color: #0b5ed7; border-radius: 4px; }
        .pagination a:hover { background-color: #f0f0f0; }
        .pagination .current { font-weight: bold; background-color: #0b5ed7; color: white; border-color: #0b5ed7; }
        .pagination .disabled { color: #aaa; pointer-events: none; background-color: #f8f9fa; }

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
                <c:forEach var="lesson" items="${pagedListHolder.pageList}">
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

    <!-- Pagination Controls -->
    <c:if test="${pagedListHolder.pageCount > 1}">
        <div class="pagination">
            <!-- Previous Page Link -->
            <c:choose>
                <c:when test="${pagedListHolder.isFirstPage()}">
                    <span class="disabled">&laquo; Prev</span>
                </c:when>
                <c:otherwise>
                    <a href="viewCourse?courseID=${course.id}&pageNum=${pagedListHolder.page - 1}">&laquo; Prev</a>
                </c:otherwise>
            </c:choose>

            <!-- Page Number Links -->
            <c:forEach begin="0" end="${pagedListHolder.pageCount - 1}" var="i">
                <c:choose>
                    <c:when test="${pagedListHolder.page eq i}">
                        <span class="current">${i + 1}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="viewCourse?courseID=${course.id}&pageNum=${i}">${i + 1}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <!-- Next Page Link -->
            <c:if test="${!pagedListHolder.isLastPage()}">
                <a href="viewCourse?courseID=${course.id}&pageNum=${pagedListHolder.page + 1}">Next &raquo;</a>
            </c:if>
        </div>
    </c:if>

<br/>
<br/>

</body>
</html>