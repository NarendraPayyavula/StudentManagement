<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
  <%
            String empId = request.getParameter("empId");
            String designation = request.getParameter("designation");
            double salary = Double.parseDouble(request.getParameter("salary"));
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            
            // Database connection parameters
            String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
            String DB_USER = "system";
            String DB_PASSWORD = "12345";
            
            Connection conn = null;
            PreparedStatement stmt = null;
            
            try {
                // Load Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish database connection
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                // SQL query to insert faculty details
                String sql = "INSERT INTO staff (empId, designation, salary, firstName, lastName) VALUES (?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, empId);
                stmt.setString(2, designation);
                stmt.setDouble(3, salary);
                stmt.setString(4, firstName);
                stmt.setString(5, lastName);
                
                // Execute the insert statement
                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
        %>
                    <div class="alert alert-success" role="alert">
                        Faculty details inserted successfully.
                    </div>
        <%
                } else {
        %>
                    <div class="alert alert-danger" role="alert">
                        Failed to insert faculty details.
                    </div>
        <%
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace(); // Handle Class.forName() exception
        %>
                <div class="alert alert-danger" role="alert">
                    Error: <%= e.getMessage() %>
                </div>
        <%
            } catch (SQLException e) {
                e.printStackTrace(); // Handle SQL exceptions
        %>
                <div class="alert alert-danger" role="alert">
                    Error: <%= e.getMessage() %>
                </div>
        <%
            } finally {
                // Close resources
                try {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
<body>

</body>
</html>