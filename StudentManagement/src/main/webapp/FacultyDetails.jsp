 <%@ page import="java.sql.*"  language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Faculty Details</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Additional custom styles */
        body {
            padding: 20px;
        }
    </style>
</head>
<body>
    <h1 class="mt-4 mb-4">Faculty Details</h1>
    <div class="container">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>Employee ID</th>
                    <th>Designation</th>
                    <th>Salary</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    try {
                        // Load Oracle JDBC driver
                        Class.forName("oracle.jdbc.driver.OracleDriver");

                        // Establish connection to the Oracle database
                        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");

                        // SQL query to fetch faculty details
                        String sql = "SELECT * FROM staff";
                        PreparedStatement stmt = conn.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();

                        // Iterate over the result set and display faculty details
                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getString("empId") %></td>
                                <td><%= rs.getString("designation") %></td>
                                <td><%= rs.getDouble("salary") %></td>
                                <td><%= rs.getString("firstName") %></td>
                                <td><%= rs.getString("lastName") %></td>
                            </tr>
                <% 
                        }
                        
                        // Close the resources
                        rs.close();
                        stmt.close();
                        conn.close();
                        
                    } catch (ClassNotFoundException e) {
                        out.println("Failed to load Oracle JDBC driver: " + e.getMessage());
                    } catch (Exception e) {
                        out.println("SQL Exception: " + e.getMessage());
                    }
                %>
            </tbody>
        </table>
    </div>
    <!-- Bootstrap JS (optional) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
 