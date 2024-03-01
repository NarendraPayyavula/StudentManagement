 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Marks</title>
</head>
<body>
<%
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");

    // Retrieve parameters from the request
    String IdNo = request.getParameter("IdNo");
    int telugu = Integer.parseInt(request.getParameter("Telugu"));
    int english = Integer.parseInt(request.getParameter("English"));
    int hindi = Integer.parseInt(request.getParameter("Hindi"));
    int science = Integer.parseInt(request.getParameter("Science"));
    int maths = Integer.parseInt(request.getParameter("Maths"));
    int social = Integer.parseInt(request.getParameter("Social"));
    int gk = Integer.parseInt(request.getParameter("GK"));

    // Update marks in the database
    String updateQuery = "UPDATE marks SET Telugu=?, English=?, Hindi=?, Science=?, Maths=?, Social=?, GK=? WHERE IdNo=?";
    PreparedStatement updatePs = conn.prepareStatement(updateQuery);
    updatePs.setInt(1, telugu);
    updatePs.setInt(2, english);
    updatePs.setInt(3, hindi);
    updatePs.setInt(4, science);
    updatePs.setInt(5, maths);
    updatePs.setInt(6, social);
    updatePs.setInt(7, gk);
    updatePs.setString(8, IdNo);
    int rowsAffected = updatePs.executeUpdate();

    if (rowsAffected > 0) {
        out.println("Marks updated successfully.");
    } else {
        out.println("Failed to update marks.");
    }

    updatePs.close();
    conn.close();
} catch(Exception e) {
    out.println("An error occurred: " + e.getMessage());
}
%>
</body>
</html>
 