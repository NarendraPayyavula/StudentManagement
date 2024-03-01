   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Marks</title>
</head>

<body>

<div class="container mt-5">
    <form method="post" action="FetchingAndUpdatingMarks.jsp">
        <div class="form-group row">
            <label for="IdNo" class="col-sm-2 col-form-label">Enter Student Hall Ticket Number</label>
            <div class="col-sm-10">
                <input type="text" name="IdNo" class="form-control" id="IdNo">
            </div>
        </div>
       
        <div class="form-group row">
            <div class="col-sm-10 offset-sm-2">
                <button type="submit" class="btn btn-primary" value="submit">Submit</button>
            </div>
        </div>
    </form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
 