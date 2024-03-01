  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Add Student</h2>
        <%-- Display success or error message if provided in the URL --%>
        <% String status = request.getParameter("status");
           if (status != null && !status.isEmpty()) { %>
            <div class="alert alert-<%= status.equals("success") ? "success" : "danger" %>" role="alert">
                <% if (status.equals("success")) { %>
                    Successfully added student.
                <% }  
                 %>
            </div>
        <% } %>
        <%-- Process form submission --%>
        <% if ("POST".equalsIgnoreCase(request.getMethod())) {
            try {
                String idNo = request.getParameter("IdNo");
                String firstName = request.getParameter("FirstName");
                String lastName = request.getParameter("LastName");
                String gender = request.getParameter("Gender");
                String city = request.getParameter("City");
                String state = request.getParameter("State");
                String phoneNumber = request.getParameter("PhoneNumber");
                String email = request.getParameter("Email");
                
                // Database connection parameters
                String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
                String DB_USER = "system";
                String DB_PASSWORD = "12345";
                
                // Load Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");
                
                // Establish database connection
                Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                
                // Prepare SQL statement for insertion
                String sql = "INSERT INTO third(IdNo, FirstName, LastName, Gender, City, State, PhoneNumber, Email) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, idNo);
                stmt.setString(2, firstName);
                stmt.setString(3, lastName);
                stmt.setString(4, gender);
                stmt.setString(5, city);
                stmt.setString(6, state);
                stmt.setString(7, phoneNumber);
                stmt.setString(8, email);
                
                // Execute insertion statement
                int rowsAffected = stmt.executeUpdate();
                
                // Close resources
                stmt.close();
                conn.close();
                
                // Redirect to the add student form with success message
                response.sendRedirect("AddStudent3.jsp?status=success");
                
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Redirect to the add student form with error message
                response.sendRedirect("AddStudent3.jsp?status=error&message=" + e.getMessage());
            }
        } %>
        <form method="post" action="AddStudent3.jsp">
            <div class="form-group">
                <label for="idNo">ID</label>
                <input   required type="text" class="form-control" id="idNo" name="IdNo" required>
            </div>
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input   required type="text" class="form-control" id="firstName" name="FirstName" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input   required type="text" class="form-control" id="lastName" name="LastName" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select   required class="form-control" id="gender" name="Gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="city">City</label>
                <input   required  type="text" class="form-control" id="city" name="City">
            </div>
            <div class="form-group">
                <label for="state">State</label>
                <input type="text" class="form-control" id="state" name="State">
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <input   required type="tel" class="form-control" id="phoneNumber" name="PhoneNumber">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input   required type="email" class="form-control" id="email" name="Email">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
 