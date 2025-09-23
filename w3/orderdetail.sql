SHOW DATABASES;
USE exdb;
SHOW TABLES;

CREATE TABLE OrderDetail(
	OrderDetailID INT,
   OrderID VARCHAR(10),
   ProductID INT,
   Quantity INT
);

SELECT * FROM OrderDetail;