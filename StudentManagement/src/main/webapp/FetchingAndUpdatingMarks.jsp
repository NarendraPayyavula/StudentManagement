 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Marks</title>
</head>
<body>
<%
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");

    // Retrieve hall ticket number from request parameter
    String IdNo = request.getParameter("IdNo");
  

    // Retrieve existing marks for the given hall ticket number
    String query = "SELECT * FROM marks WHERE IdNo=?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, IdNo);
    ResultSet rs = ps.executeQuery();

    // Display form with existing marks
    if (rs.next()) {
%>
    <form method="post" action="UpdatingMark.jsp">
        Id No: <input type="text" name="IdNo" value="<%= rs.getInt("IdNo") %>" ><br>
        Telugu: <input type="text" name="Telugu" value="<%= rs.getInt("Telugu") %>"><br>
        English: <input type="text" name="English" value="<%= rs.getInt("English") %>"><br>
        Hindi: <input type="text" name="Hindi" value="<%= rs.getInt("Hindi") %>"><br>
        Science: <input type="text" name="Science" value="<%= rs.getInt("Science") %>"><br>
        Maths: <input type="text" name="Maths" value="<%= rs.getInt("Maths") %>"><br>
        Social: <input type="text" name="Social" value="<%= rs.getInt("Social") %>"><br>
        GK: <input type="text" name="GK" value="<%= rs.getInt("GK") %>"><br>
        <input type="submit" value="submit">
    </form>
<%
    } else {
        out.println("No marks found for the given hall ticket number.");
    }

    rs.close();
    ps.close();
    conn.close();
} catch(Exception e) {
     
}
%>
</body>
</html>
 