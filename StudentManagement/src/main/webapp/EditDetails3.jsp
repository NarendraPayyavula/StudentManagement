 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>Edit Student Details</h2>
    <!-- Form for entering ID -->
    <form class="form-inline mb-4" action="EditDetails3.jsp" method="get">
        <input required class="form-control mr-sm-2" type="search" placeholder="Enter ID" aria-label="Search" name="IdNo">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>

    <!-- Display form inputs for student details -->
    <form action="EditDetails3.jsp" method="post">
        <%
        try {
            // Load the JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Establish connection to the database
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");
            // Retrieve the ID from the request
            String idNo = request.getParameter("IdNo");
            // If ID is provided, search for that student
            if (idNo != null && !idNo.isEmpty()) {
                // Execute a query with ID condition
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM third WHERE IdNo = ?");
                pstmt.setString(1, idNo);
                ResultSet rs = pstmt.executeQuery();
                // Display form inputs with student details
                while (rs.next()) {
        %>
        <input required type="hidden" name="IdNo" value="<%= rs.getString("IdNo") %>">
        <div class="form-group">
            <label for="FirstName">First Name:</label>
            <input required type="text" class="form-control" id="FirstName" name="FirstName" value="<%= rs.getString("FirstName") %>">
        </div>
        <div class="form-group">
            <label for="LastName">Last Name:</label>
            <input required type="text" class="form-control" id="LastName" name="LastName" value="<%= rs.getString("LastName") %>">
        </div>
        <div class="form-group">
            <label for="Gender">Gender:</label>
            <input required type="text" class="form-control" id="Gender" name="Gender" value="<%= rs.getString("Gender") %>">
        </div>
        <div class="form-group">
            <label for="City">City:</label>
            <input required type="text" class="form-control" id="City" name="City" value="<%= rs.getString("City") %>">
        </div>
        <div class="form-group">
            <label for="State">State:</label>
            <input type="text" class="form-control" id="State" name="State" value="<%= rs.getString("State") %>">
        </div>
        <div class="form-group">
            <label for="PhoneNumber">Phone Number:</label>
            <input required type="text" class="form-control" id="PhoneNumber" name="PhoneNumber" value="<%= rs.getString("PhoneNumber") %>">
        </div>
        <div class="form-group">
            <label for="Email">Email:</label>
            <input required type="text" class="form-control" id="Email" name="Email" value="<%= rs.getString("Email") %>">
        </div>
        <button class="btn btn-primary mt-2" type="submit">Update</button>
        <%
                }
                pstmt.close();
            }
            // Close resources
            conn.close();
        } catch (Exception e) {
            out.println("<div class='alert alert-danger mt-3'>Error: " + e.getMessage() + "</div>");
        }
        %>
    </form>
</div>

<%
try {
    if (request.getMethod().equals("POST")) {
        // Load the JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");
        // Establish connection to the database
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");

        // Retrieve form data
        String idNo = request.getParameter("IdNo");
        String firstName = request.getParameter("FirstName");
        String lastName = request.getParameter("LastName");
        String gender = request.getParameter("Gender");
        String city = request.getParameter("City");
        String state = request.getParameter("State");
        String phoneNumber = request.getParameter("PhoneNumber");
        String email = request.getParameter("Email");

        // Update the database with the new values
        PreparedStatement pstmt = conn.prepareStatement("UPDATE third SET FirstName=?, LastName=?, Gender=?, City=?, State=?, PhoneNumber=?, Email=? WHERE IdNo=?");
        pstmt.setString(1, firstName);
        pstmt.setString(2, lastName);
        pstmt.setString(3, gender);
        pstmt.setString(4, city);
        pstmt.setString(5, state);
        pstmt.setString(6, phoneNumber);
        pstmt.setString(7, email);
        pstmt.setString(8, idNo);

        int rowsUpdated = pstmt.executeUpdate();
        pstmt.close();
        conn.close();

        if (rowsUpdated > 0) {
            out.println("<div class='alert alert-success mt-3'>Details updated successfully.</div>");
        }
    }
} catch (Exception e) {
    out.println("<div class='alert alert-danger mt-3'>Error: " + e.getMessage() + "</div>");
}
%>

<!-- Bootstrap JS and jQuery (for Bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
 