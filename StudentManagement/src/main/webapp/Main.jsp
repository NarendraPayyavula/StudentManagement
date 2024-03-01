 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Student Marks Management</title>
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
        <a class="navbar-brand" href="#">Student Marks Management</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <form action="IdNoForUpdatingMarks.jsp" method="post" class="nav-link">
                        <button class="btn btn-link" type="submit">Update Marks</button>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="InsertingMarks.jsp" method="post" class="nav-link">
                        <button class="btn btn-link" type="submit">Add  Marks</button>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="AllClasses.jsp" method="post" class="nav-link">
                        <button class="btn btn-link" type="submit">Students Info</button>
                    </form>
                </li>
                
                <li class="nav-item">
                    <form action="FacultyDetails.jsp" method="post" class="nav-link">
                        <button class="btn btn-link" type="submit">Staff Info</button>
                    </form>
                </li>
                 
                <li class="nav-item">
                    <form action="SearchingMarks.jsp" method="get" class="nav-link">
                        <button class="btn btn-link" type="submit">View Marks</button>
                    </form>
                </li>
                  <li class="nav-item">
                    <form action="FacultyForm.jsp" method="get" class="nav-link">
                        <button class="btn btn-link" type="submit">Add Faculty</button>
                    </form>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Bootstrap JS (optional) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
 