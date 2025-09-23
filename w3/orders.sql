SHOW DATABASES;
USE exdb;
SHOW TABLES;

DROP TABLE orders;
CREATE TABLE orders(
    OrderID VARCHAR(20),
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    ShipperID INT
);

SELECT * FROM orders;