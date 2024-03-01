  <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title> Student Marks</title>
         <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
           
        }

        .search-form {
            margin-bottom: 20px; /* Add some space between the search form and the table */
        }

        .table-responsive {
            width: 300px;
            
            max-height: 500px; /* Adjust the max height as needed */
            overflow-y: auto;
        }

        .table-bordered th,
        .table-bordered td {
            border: 2px solid #dee2e6;
            vertical-align: middle;
        }

        .table-bordered thead th {
            border-width: 9px;
        }

        .table-bordered tbody + tbody {
            border-top-width: 8px;
        }

        .table-bordered .thead-dark th {
            color: #fff;
            background-color: #343a40;
            border-color: #454d55;
        }

        .table-bordered td:hover {
            background-color: rgba(0, 123, 255, 0.25);
        }
    </style>
</head>
<body> <div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
             
            <form action="" method="get" class="needs-validation" novalidate>
                <div class="form-group">
                    <input type="text" name="IdNo" class="form-control" id="IdNo" placeholder="Enter Hall Ticket Number" required>
          
                </div>
                <button type="submit" class="btn btn-primary btn-block">Search</button>
            </form>
        </div>
    </div>
</div>

    <div class="container">
        <% try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");
            String IdNoStr = request.getParameter("IdNo");
            int IdNo = Integer.parseInt(IdNoStr);
            String query = "SELECT * FROM marks WHERE IdNo=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, IdNo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
        %>
         <div class="table-responsive">
         <h1>Marks of Hall Ticket Number:-<%=IdNo  %> </h1>
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>Subject</th>
                <th>Marks</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Telugu</td>
                <td style="width: 200px;"><%= rs.getInt("Telugu") %></td>
            </tr>
            <tr>
                <td>English</td>
                <td style="width: 200px;"><%= rs.getInt("English") %></td>
            </tr>
            <tr>
                <td>Hindi</td>
                <td style="width: 200px;"><%= rs.getInt("Hindi") %></td>
            </tr>
            <tr>
                <td>Science</td>
                <td style="width: 200px;"><%= rs.getInt("Science") %></td>
            </tr>
            <tr>
                <td>Maths</td>
                <td style="width: 200px;"><%= rs.getInt("Maths") %></td>
            </tr>
            <tr>
                <td>Social</td>
                <td style="width: 200px;"><%= rs.getInt("Social") %></td>
            </tr>
            <tr>
                <td>GK</td>
                <td style="width: 200px;"><%= rs.getInt("GK") %></td>
            </tr>
        </tbody>
    </table>
</div>
        <%  } else {
                out.println("No marks found for the given hall ticket number.");
            }
            rs.close();
            ps.close();
            conn.close();
        } catch(Exception e) {
            e.printStackTrace();
            out.println("An error occurred: " + e.getMessage());
        }
        %>
    </div>

    <!-- Bootstrap JS (optional) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>