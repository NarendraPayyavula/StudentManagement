  <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert Marks</title>
</head>
<body>
<%
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");

    // Retrieve values from request parameters
    String IdNoStr = request.getParameter("IdNo");
    int IdNo = Integer.parseInt(IdNoStr);
    int telugu = Integer.parseInt(request.getParameter("Telugu"));
    int english = Integer.parseInt(request.getParameter("English"));
    int hindi = Integer.parseInt(request.getParameter("Hindi"));
    int science = Integer.parseInt(request.getParameter("Science"));
    int maths = Integer.parseInt(request.getParameter("Maths"));
    int social = Integer.parseInt(request.getParameter("Social"));
    int gk = Integer.parseInt(request.getParameter("GK"));

    // Insert statement
    String query = "INSERT INTO marks (IdNo, Telugu, English, Hindi, Science, Maths, Social, GK) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setInt(1, IdNo);
    ps.setInt(2, telugu);
    ps.setInt(3, english);
    ps.setInt(4, hindi);
    ps.setInt(5, science);
    ps.setInt(6, maths);
    ps.setInt(7, social);
    ps.setInt(8, gk);

    // Execute the insert statement
    int rowsAffected = ps.executeUpdate();
    
    if (rowsAffected > 0) {
        out.println(" successfully.");
    } else {
        out.println("Failed to insert data.");
    }

    ps.close();
    conn.close();
} catch(Exception e) {
    e.printStackTrace();
    out.println("An error occurred: " + e.getMessage());
}
%>
</body>
</html>
 

 