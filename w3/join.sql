USE exdb;
SHOW TABLES;

SELECT * FROM orders;
SELECT * FROM customers;

-- inner join 테이블 2개
SELECT o.OrderID, c.CustomerID, c.CustomerName 고객이름, o.OrderDate
FROM orders AS o
INNER JOIN customers AS c
ON o.CustomerID = c.CustomerID;

SELECT * FROM orders;
SELECT * FROM customers;
SELECT * FROM shippers;

-- inner join 테이블 3개
SELECT 
	o.OrderID, c.CustomerID, c.CustomerName, s.shipperID, s.shipperName
FROM orders AS o
INNER JOIN customers AS c
	ON o.CustomerID = c.CustomerID
inner join shippers AS s
	ON o.ShipperID = s.shipperID
OPEN BY c.CustomerID;

SELECT * FROM orders;
SELECT * FROM employees;

-- right join 테이블 2개
SELECT o.OrderID, e.EmployeeID , e.FirstName
FROM orders o
RIGHT JOIN employees e
 ON o.EmployeeID = e.EmployeeID
 ORDER BY o.EmployeeID;
 
 SELECT * FROM customers;
 SELECT * FROM orders;
 
 -- cross join 테이블 2개
 
SELECT c.customerID, c.CustomerName , o.orderID
FROM customers c 
CROSS JOIN orders o
WHERE c.customerID = o.customerID;

 -- self join 테이블 2개
/*
SELECT c1.CustomerID, c1.CustomerName AS c1고객이름, c1.city c1도시,
		c2.CustomerID, c2.CustomerName AS c2고객이름, c2.city c2도시
FROM customers c1, customer c2
WHERE c1.CustomerID <> c2.CustomerID AND c1.city = c2.city
ORDER BY c1.city;
*/
 
 -- union 
 USE exdb;
 SELECT * FROM customers;
 SELECT *  FROM suppliers;
 
 SELECT city FROM customers
 UNION 
 SELECT city FROM suppliers
 ORDER BY city;
 
SELECT city, country FROM customers
WHERE country = 'Germany'
UNION 
SELECT city, country FROM suppliers
WHERE country = 'Germany'
ORDER BY city;

SELECT 'Customer' AS Type, ContactName, City, Country
FROM Customers
UNION 
SELECT 'supplier',contactName, city, country
FROM suppliers;


 
 
 
 
 	
	


