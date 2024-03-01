<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <% 
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");
        PreparedStatement ps = conn.prepareStatement("insert into details values(?, ?)");

        // Retrieve values from request attributes
        String email =  request.getParameter("email");
        String password =request.getParameter("password");

        ps.setString(1, email);
        ps.setString(2, password);

        ps.executeUpdate();
        ps.close();
    } catch(Exception e) {
        // Handle exceptions (e.g., log the error)
    	e.printStackTrace();
    }
    %>
</body>
</html>


