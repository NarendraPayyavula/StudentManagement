This is a simple web application built using JSP (JavaServer Pages) and JDBC (Java Database Connectivity) for managing student information, faculty details, and marks retrieval.

Features:

Student Management:
Store details of different students of different classes.
Retrieve student details by entering their college ID.

Faculty Management:
Add, update, and delete faculty details.

Marks Management:
Store marks of students in different subjects.
Retrieve marks by entering student's college ID.


Database Schema for alll tables :

-- Table to store student details for each class
CREATE TABLE ClassNo (
    IdNo VARCHAR(20) UNIQUE NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender VARCHAR(50) NOT NULL,
    City VARCHAR(100),
    State VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100)
);

-- Table to store admin details
CREATE TABLE Admin (
    USERNAME VARCHAR(20) UNIQUE NOT NULL,
    EMAIL VARCHAR(20) NOT NULL,
    PASSWORD VARCHAR(20)
);

-- Table to store marks of students
CREATE TABLE Marks (
    IdNo NUMBER NOT NULL,
    Telugu NUMBER,
    English NUMBER,
    Hindi NUMBER,
    Science NUMBER,
    Maths NUMBER,
    Social NUMBER,
    GK NUMBER,
    FOREIGN KEY (IdNo) REFERENCES ClassNo(IdNo)
);


Technologies Used:

JSP (JavaServer Pages) for dynamic web pages.
JDBC (Java Database Connectivity) for interacting with the database.
Servlets for handling HTTP requests and responses.
HTML and CSS for front-end design.
Oracle  database for storing student, faculty, and marks data.
How to Run:

Set up a Oracle database and execute the provided SQL script to create the necessary tables.
Configure your database connection details in the JDBC code.
Deploy the application on a servlet container like Apache Tomcat.
Access the application through a web browser.
Note:

Make sure to handle security aspects such as input validation, authentication.
This is a basic implementation. Additional features and enhancements can be added based on requirements.
