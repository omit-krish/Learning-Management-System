<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Instructor Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <style>
        body {
            background-color: #f4f7fb; /* softer than pure white */
            padding: 40px;
            color: #1f2937; /* subtle dark gray */
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial;
        }

        .search-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 6px 20px rgba(31,41,55,0.06);
            margin-bottom: 30px;
        }

        label {
            font-weight: 600;
            color: #334155;
        }

        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #e6edf3;
            background: #fbfdff;
        }

        input[type="submit"] {
            background-color: #0d6efd; /* bootstrap primary */
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
        }

        input[type="submit"]:hover {
            background-color: #0b5ed7;
        }

        .page-header {
            margin-bottom: 24px;
        }

        /* Table styling */
        .instructor-table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 8px;
        }

        .instructor-table thead th {
            background: linear-gradient(90deg, #0d6efd 0%, #0b5ed7 100%);
            color: white;
            border: 0;
            font-weight: 700;
            vertical-align: middle;
        }

        .instructor-table tbody tr {
            background: white;
            transition: background .12s ease, transform .12s ease;
        }

        .instructor-table tbody tr:hover {
            background: #f8fafc;
            transform: translateY(-1px);
        }

        .instructor-table td, .instructor-table th {
            padding: 10px 12px;
            vertical-align: middle;
            border-top: 1px solid #eef2f7;
        }

        /* Nested course table */
        .course-table {
            margin: 0;
            width: 100%;
            border: 0;
            background: transparent;
        }

        .course-table thead th {
            background: #f1f5f9;
            color: #334155;
            font-weight: 600;
            font-size: 0.9rem;
            border-bottom: 1px solid #e6edf3;
        }

        .course-table td {
            border: 0;
            padding: 6px 8px;
        }

        /* Buttons / action links */
        .btn-view {
            display: inline-block;
            padding: 6px 10px;
            background: #0d6efd;
            color: #fff;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            box-shadow: 0 3px 8px rgba(13,110,253,0.14);
        }

        .btn-view:hover { background: #0b5ed7; }

        .btn-delete {
            display: inline-block;
            padding: 6px 10px;
            background: #dc3545;
            color: #fff;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            box-shadow: 0 3px 8px rgba(220,53,69,0.12);
        }

        .btn-delete:hover { background: #bb2d3b; }

        .badge-course {
            display:inline-block;
            background:#17a2b8;
            color:#fff;
            padding:4px 8px;
            border-radius:999px;
            font-size:0.8rem;
            font-weight:700;
        }

        /* Responsive tweaks */
        @media (max-width: 768px) {
            .search-container { padding: 16px; }
            .instructor-table td, .instructor-table th { padding: 8px; }
        }
    </style>
</head>
<body>

<%@ include file="main.jsp" %>

<div class="container">
    <div class="page-header text-center">
        <h1>Instructor Details</h1>
        <hr/>
    </div>

    <div class="row justify-content-end">
        <div class="col-md-5">
            <div class="search-container">
                <h4 class="mb-3">Search Instructor By ID</h4>
                <form action="instructor/search" method="get">
                    <label for="id">Instructor ID:</label>
                    <input type="number" name="id" id="id" required />
                    <input type="submit" value="Search" />
                </form>
            </div>
        </div>
    </div>

    <div class="table-responsive mt-5">
        <table class="table table-striped table-bordered instructor-table">
            <thead class="table-warning">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Experience</th>
                    <th>Email</th>
                    <th>COURSES</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="instructor" items="${instructors}" varStatus="loop">
                    <tr>
                        <td>${instructor.id}</td>
                        <td>${instructor.name}</td>
                        <td>${instructor.experience}</td>
                        <td>${instructor.mailId}</td>
                        <td>
                        <table class="table table-striped table-bordered course-table">

                        <thead>

                        <tr>
                        <th>Name
                        </th>
                         <th>Duration </th>
                         <th>Course-Details</th>

                        </tr>

                        </thead>


                        <tbody>
                        <c:forEach var="course" items="${instructor.courses}">

                        <tr>
                        <td>${course.name}</td>
                        <td>${course.duration}</td>
                        <td><a href="viewCourse?courseID=${course.id}" class="btn-view">View-Details </a></td>
                        </tr>
</c:forEach>
                        </tbody>

                        </table>


                        </td>



                      <td>  <a href="deleteByID/${instructor.id}" class="btn-delete">DELETE</a>
</td>


                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>


</body>
</html>