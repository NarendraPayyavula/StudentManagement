 <%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Additional custom styles */
        .form-container {
            max-width: 400px;
            margin: auto;
            margin-top: 50px;
        }
    </style>
    
    <%
    // Check if the form has been submitted
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String email = request.getParameter("EmailId");
        String password = request.getParameter("password");
        boolean isValidUser = false;
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");

            // Prepare SQL statement to check if the user with provided email and password exists
            String sql = "SELECT * FROM admin WHERE email = ? AND password = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            
            // Execute query
            ResultSet resultSet = statement.executeQuery();
            
            // Check if result set has any rows
            if(resultSet.next()) {
                // User with provided email and password exists.
                isValidUser = true;
                response.sendRedirect("Main.jsp");
            } else {
                // Invalid email or password
            	 response.sendRedirect("AdminRegistration.jsp");
            }
            
            // Close resources
            resultSet.close();
            statement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        if(isValidUser) {
            // Redirect to main.jsp
           
        }
    }
%>
</head>
<body>

<div class="container form-container">
    <form action="AdminLogin.jsp" method="post" class="bg-light p-4 rounded shadow-lg">
        <div class="form-group">
            <label for="EmailId">Email Id:</label>
            <input type="text" class="form-control" id="EmailId" name="EmailId" placeholder="Enter Email Id" autocomplete="off">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" autocomplete="off">
            <% 
                String error = request.getParameter("error");
                if ("invalid".equals(error)) { %>
                <span style="color: red;">Invalid email or password</span>
            <% } %>
        </div>
        <button type="submit" class="btn btn-primary btn-block mt-3">Submit</button>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
 