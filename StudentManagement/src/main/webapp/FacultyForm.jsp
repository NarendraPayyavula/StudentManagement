 <%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Faculty</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="mt-4 mb-4">Add Faculty</h1>
      
        <!-- Form to input faculty details -->
        <form action="AddingFaculty.jsp" method="post">
            <div class="form-group">
                <label for="empId">Employee ID:</label>
                <input type="text" class="form-control" id="empId" name="empId">
            </div>
            <div class="form-group">
                <label for="designation">Designation:</label>
                <input type="text" class="form-control" id="designation" name="designation">
            </div>
            <div class="form-group">
                <label for="salary">Salary:</label>
                <input type="text" class="form-control" id="salary" name="salary">
            </div>
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" class="form-control" id="firstName" name="firstName">
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" class="form-control" id="lastName" name="lastName">
            </div>
            <button type="submit" class="btn btn-primary">Add Faculty</button>
        </form>
    </div>
    <!-- Bootstrap JS (optional) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
 