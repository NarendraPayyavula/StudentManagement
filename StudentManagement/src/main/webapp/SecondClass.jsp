 <%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display First Table</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        .navbar {
            margin-bottom: 20px;
        }
        /* Navbar link style */
        .navbar-nav .nav-link {
            color: #fff;
        }
        .navbar-nav .nav-link:hover {
            color: #fff;
            background-color: #007bff;
        }
        .navbar-nav .active > .nav-link {
            color: #fff;
            background-color: #007bff;
        }
    </style>
</head>
<body>

<!-- Bootstrap Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Student Details</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <form action="AddStudent2.jsp" method="post" class="nav-link">
                    <button class="btn btn-link" type="submit">Add Student</button>
                </form>
            </li>
            <li class="nav-item">
                <form action="DeleteStudent2.jsp" method="post" class="nav-link">
                    <button class="btn btn-link" type="submit">Remove Student</button>
                </form>
            </li>
            <li class="nav-item">
                <form action="EditDetails2.jsp" method="post" class="nav-link">
                    <button class="btn btn-link" type="submit">Edit Details</button>
                </form>
            </li>
        </ul>
        <!-- Search Form -->
        <form class="form-inline my-2 my-lg-0" action="#" method="get">
            <input class="form-control mr-sm-2" type="search" placeholder="Enter ID" aria-label="Search" name="idNo">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<div class="container">
    <h2>All Student Of First Class</h2>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Gender</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Phone Number</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    try {
                        // Load the JDBC driver
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        // Establish connection to the database
                        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");
                        // Create a statement
                        Statement stmt = conn.createStatement();
                        // Retrieve the ID from the request
                        String idNo = request.getParameter("idNo");
                        // If ID is provided, search for that student
                        if (idNo != null && !idNo.isEmpty()) {
                            // Execute a query with ID condition
                            ResultSet rs = stmt.executeQuery("SELECT * FROM Second WHERE IdNo = '" + idNo + "'");
                            // Iterate over the result set and display data
                            while (rs.next()) {
                %>
                                <tr>
                                    <td><%= rs.getString("IdNo") %></td>
                                    <td><%= rs.getString("FirstName") %></td>
                                    <td><%= rs.getString("LastName") %></td>
                                    <td><%= rs.getString("Gender") %></td>
                                    <td><%= rs.getString("City") %></td>
                                    <td><%= rs.getString("State") %></td>
                                    <td><%= rs.getString("PhoneNumber") %></td>
                                    <td><%= rs.getString("Email") %></td>
                                </tr>
                <% }
                        } else {
                            // If no ID provided, display all students
                            ResultSet rs = stmt.executeQuery("SELECT * FROM Second");
                            // Iterate over the result set and display data
                            while (rs.next()) {
                %>
                                <tr>
                                    <td><%= rs.getString("IdNo") %></td>
                                    <td><%= rs.getString("FirstName") %></td>
                                    <td><%= rs.getString("LastName") %></td>
                                    <td><%= rs.getString("Gender") %></td>
                                    <td><%= rs.getString("City") %></td>
                                    <td><%= rs.getString("State") %></td>
                                    <td><%= rs.getString("PhoneNumber") %></td>
                                    <td><%= rs.getString("Email") %></td>
                                </tr>
                <% }
                        }
                        // Close resources
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        out.println("Error: " + e.getMessage());
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
 