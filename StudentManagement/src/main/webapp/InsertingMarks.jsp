 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Marks</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">Enter Marks</h2>
    <form action="AddingMarksIntoDb.jsp" method="post">
        <div class="form-group row">
            <label for="IdNo" class="col-sm-2 col-form-label">Enter Student Hall Ticket Number</label>
            <div class="col-sm-10">
                <input type="number" name="IdNo" class="form-control" id="IdNo">
            </div>
        </div>
        <div class="form-group row">
            <label for="telugu" class="col-sm-2 col-form-label">Telugu:</label>
            <div class="col-sm-10">
                <input type="number" name="Telugu" class="form-control" id="telugu">
            </div>
        </div>
        <div class="form-group row">
            <label for="english" class="col-sm-2 col-form-label">English:</label>
            <div class="col-sm-10">
                <input type="number" name="English" class="form-control" id="english">
            </div>
        </div>
        <div class="form-group row">
            <label for="hindi" class="col-sm-2 col-form-label">Hindi:</label>
            <div class="col-sm-10">
                <input type="number" name="Hindi" class="form-control" id="hindi">
            </div>
        </div>
        <div class="form-group row">
            <label for="science" class="col-sm-2 col-form-label">Science:</label>
            <div class="col-sm-10">
                <input type="number" name="Science" class="form-control" id="science">
            </div>
        </div>
        <div class="form-group row">
            <label for="maths" class="col-sm-2 col-form-label">Maths:</label>
            <div class="col-sm-10">
                <input type="number" name="Maths" class="form-control" id="maths">
            </div>
        </div>
        <div class="form-group row">
            <label for="social" class="col-sm-2 col-form-label">Social:</label>
            <div class="col-sm-10">
                <input type="number" name="Social" class="form-control" id="social">
            </div>
        </div>
        <div class="form-group row">
            <label for="gk" class="col-sm-2 col-form-label">GK:</label>
            <div class="col-sm-10">
                <input type="number" name="GK" class="form-control" id="gk">
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
 