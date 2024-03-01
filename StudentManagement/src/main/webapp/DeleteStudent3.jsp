  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Student</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Delete Student</h2>
        
        <%-- Process deletion if ID is provided --%>
        <% String idToDelete = request.getParameter("deleteId");
           if (idToDelete != null && !idToDelete.isEmpty()) {
               try {
                   // Database connection parameters
                   String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
                   String DB_USER = "system";
                   String DB_PASSWORD = "12345";
                   
                   // Load Oracle JDBC driver
                   Class.forName("oracle.jdbc.driver.OracleDriver");
                   
                   // Establish database connection
                   Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                   
                   // Prepare SQL statement for deletion
                   String sql = "DELETE FROM Third WHERE IdNo = ?";
                   PreparedStatement stmt = conn.prepareStatement(sql);
                   stmt.setString(1, idToDelete);
                   
                   // Execute deletion statement
                   int rowsAffected = stmt.executeUpdate();
                   
                   // Close resources
                   stmt.close();
                   conn.close();
                     if(rowsAffected>0)
                     {
                   			response.sendRedirect("DeleteStudent3.jsp?status=success");
                   			
                     }
                     else
                     {
                    	 response.sendRedirect("DeleteStudent3.jsp?status=error");
                     }
                   
               } catch (ClassNotFoundException | SQLException e) {
                   e.printStackTrace();
                   // Redirect to the same page with error message
                   response.sendRedirect("DeleteStudent3.jsp?status=error&message=" + e.getMessage());
               }
           }
        %>
        
        <%-- Display success or error message if provided in the URL --%>
        <% String status = request.getParameter("status");
           if (status != null && !status.isEmpty()) { %>
            <div class="alert alert-<%= status.equals("success") ? "success" : "danger" %>" role="alert">
                <% if (status.equals("success")) { %>
                    Successfully deleted student.
                <% } else { %>
                    Failed to delete student. <%= request.getParameter("message") %>. Please try again.
                <% } %>
            </div>
        <% } %>
        
        <form method="post" action="DeleteStudent3.jsp">
            <div class="form-group">
                <label for="deleteId">ID of Student to Delete</label>
                <input   required type="text" class="form-control" id="deleteId" name="deleteId" required>
            </div>
            <button type="submit" class="btn btn-danger">Delete Student</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
 