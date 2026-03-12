<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${course.name} - Lessons</title>
    <style>
        :root {
            --bg: #f5f7fb;
            --card: #ffffff;
            --primary: #0d6efd;
            --primary-600: #0b5ed7;
            --text: #111827;
            --muted: #6b7280;
            --border: #e6eef6;
            --radius: 10px;
            --shadow-sm: 0 2px 6px rgba(16,24,40,0.04);
            --shadow-md: 0 8px 20px rgba(16,24,40,0.08);
        }

        html, body { height: 100%; }
        body {
            font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
            background-color: var(--bg);
            margin: 0;
            padding: 20px;
            color: var(--text);
            -webkit-font-smoothing: antialiased;
        }

        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 20px;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
            padding-bottom: 16px;
            border-bottom: 1px solid var(--border);
        }

        .page-header h1 {
            font-size: 1.75rem;
            color: var(--text);
            margin: 0;
        }

        .btn-primary {
            background-color: var(--primary);
            color: #fff;
            padding: 10px 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
            box-shadow: 0 6px 18px rgba(13,110,253,0.12);
            transition: transform .08s ease, box-shadow .12s ease, background .08s ease;
        }
        .btn-primary:hover {
            background-color: var(--primary-600);
            transform: translateY(-2px);
        }

        .lesson-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 20px;
        }

        .lesson-card {
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            box-shadow: var(--shadow-sm);
            transition: transform .15s ease, box-shadow .15s ease;
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }
        .lesson-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow-md);
        }

        .lesson-card-content {
            padding: 16px;
            flex-grow: 1;
        }

        .lesson-title {
            font-weight: 600;
            color: var(--text);
            margin-bottom: 6px;
            font-size: 1.1rem;
        }
        .lesson-meta {
            font-size: 0.85rem;
            color: var(--muted);
        }
        .lesson-link {
            text-decoration: none;
            color: inherit;
        }

        .lesson-card-actions {
            background-color: #f9fafb;
            padding: 12px 16px;
            border-top: 1px solid var(--border);
            text-align: right;
        }
        .edit-link {
            font-size: 0.9rem;
            font-weight: 600;
            color: var(--primary);
            text-decoration: none;
        }
        .edit-link:hover {
            text-decoration: underline;
        }

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
            margin-top: 32px;
        }
        .pagination a, .pagination span {
            text-decoration: none;
            padding: 8px 14px;
            border: 1px solid var(--border);
            color: var(--primary);
            border-radius: 8px;
            font-weight: 600;
            background: var(--card);
            transition: background-color .1s ease, color .1s ease;
        }
        .pagination a:hover {
            background-color: var(--primary-600);
            color: white;
            border-color: var(--primary-600);
        }
        .pagination .current {
            background-color: var(--primary);
            color: white;
            border-color: var(--primary);
        }
        .pagination .disabled {
            color: var(--muted);
            pointer-events: none;
            background-color: #f8f9fa;
        }

        .lesson-empty {
            text-align: center;
            color: var(--muted);
            padding: 40px 20px;
            background: var(--card);
            border-radius: var(--radius);
            border: 1px dashed var(--border);
        }
    </style>
</head>
<body>
    <%@ include file="main.jsp" %>

    <div class="container">
        <div class="page-header">
            <h1>${course.name}</h1>
            <a href="addLesson?courseId=${course.id}" class="btn-primary">Add Lesson</a>
        </div>

        <c:if test="${not empty course.lessons}">
            <div class="lesson-list">
                <c:forEach var="lesson" items="${pagedListHolder.pageList}">
                    <div class="lesson-card">
                        <a class="lesson-link" href="${pageContext.request.contextPath}/openLesson?lessonId=${lesson.id}">
                            <div class="lesson-card-content">
                                <div class="lesson-title">${lesson.name}</div>
                                <div class="lesson-meta">Lesson ID: ${lesson.id}</div>
                            </div>
                        </a>
                        <div class="lesson-card-actions">
                            <a class="edit-link" href="${pageContext.request.contextPath}/addLesson?courseId=${course.id}&lessonId=${lesson.id}">
                                Edit Lesson
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty course.lessons}">
            <div class="lesson-empty">
                <h2>No lessons yet</h2>
                <p>There are no lessons available for this course. Get started by adding one!</p>
            </div>
        </c:if>

        <!-- Pagination Controls -->
        <c:if test="${pagedListHolder.pageCount > 1}">
            <div class="pagination">
                <c:choose>
                    <c:when test="${pagedListHolder.isFirstPage()}">
                        <span class="disabled">&laquo; Prev</span>
                    </c:when>
                    <c:otherwise>
                        <a href="viewCourse?courseID=${course.id}&pageNum=${pagedListHolder.page - 1}">&laquo; Prev</a>
                    </c:otherwise>
                </c:choose>

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

                <c:choose>
                    <c:when test="${pagedListHolder.isLastPage()}">
                        <span class="disabled">Next &raquo;</span>
                    </c:when>
                    <c:otherwise>
                        <a href="viewCourse?courseID=${course.id}&pageNum=${pagedListHolder.page + 1}">Next &raquo;</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>
    </div>

</body>
</html>
