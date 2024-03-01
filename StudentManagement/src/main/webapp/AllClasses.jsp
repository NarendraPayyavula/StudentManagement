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
        <a class="navbar-brand" href="#">All Class Student Details</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <form action="FirstClass.jsp" method="post" class="nav-link">
                        <button class="btn btn-link" type="submit">First Class</button>
                    </form>
                </li>
                 
                  <li class="nav-item">
                    <form action="SecondClass.jsp" method="post" class="nav-link">
                        <button class="btn btn-link" type="submit">Second Class</button>
                    </form>
                </li>
                
                 <li class="nav-item">
                    <form action="ThirdClass.jsp" method="post" class="nav-link">
                        <button class="btn btn-link" type="submit">Third Class</button>
                    </form>
                </li>
                
                 <li class="nav-item">
                    <form action="FourthClass.jsp" method="post" class="nav-link">
                        <button class="btn btn-link" type="submit">Fourth Class</button>
                    </form>
                </li>
                
                 <li class="nav-item">
                    <form action="FifthClass.jsp" method="post" class="nav-link">
                        <button class="btn btn-link" type="submit">Fifth Class</button>
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
 