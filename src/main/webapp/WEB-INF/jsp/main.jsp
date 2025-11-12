<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main nav bar</title>
</head>
<body  style="text-align: center;">
<!-- main.jsp -->
<style>
    .navbar {
        background-color: #007bff;
        padding: 12px 24px;
        display: flex;
        justify-content: center;
        gap: 30px;
        border-radius: 6px;
        margin-bottom: 30px;
    }

    .navbar a {
        color: white;
        text-decoration: none;
        font-weight: bold;
        font-size: 16px;
        transition: color 0.3s ease;
    }

    .navbar a:hover {
        color: #ffdd57;
    }
</style>

<div class="navbar">
    <a href="http://localhost:8080/Learning-Management-System/instructors">
Home</a>
    <a href="http://localhost:8080/Learning-Management-System/addInstructor">Add-Instructor</a>

    <a href="addCourse">Add-Course</a>
    <a href="logout.jsp">Logout</a>
</div>

</body>
</html>