<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Instructor Form</title>

</head>
<body>
<%@ include file="main.jsp" %>

<div class="form-container">

<h1>Add-Course</h1>
    <form:form modelAttribute="course" method="post" action="saveCourse">
        <label>Name:</label>
        <form:input path="name" /><br>
<br>
        <label>Duration:</label>
        <form:input path="duration" /><br>
<br>

            <label>Select Instructor Name:</label>
            <form:select path="instructor.id">
                <form:options items="${instructors}" itemValue="id" itemLabel="name"/>
            </form:select><br>
<br>
        <input type="submit" value="Add" />
    </form:form>
</div>

</body>
</html>