SHOW DATABASES;
USE exdb;
SHOW TABLES;

DROP TABLE Employees;
CREATE TABLE Employees(
EmployeeID INT,
   LastName VARCHAR(20),
   FirstName VARCHAR(20),
   BirthDate date,
  	Photo VARCHAR(20),
   Notes TEXT
);

SELECT * FROM Employees;