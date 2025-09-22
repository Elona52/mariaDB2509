USE exdb;
SHOW TABLES;

DROP TABLE customers;

CREATE TABLE customers(
    CustomerID INT,
	CustomerName VARCHAR(50),
	ContactName VARCHAR(50),
	Address VARCHAR(50),
	City VARCHAR(50),
	PostalCode VARCHAR(50),
	Country VARCHAR(50)
);

SELECT * FROM customers;
SELECT COUNT(*) FROM customers;

SELECT *
FROM customers
WHERE country = 'germany' AND city = 'berlin';

SELECT *
FROM customers
WHERE country = 'germany' Or city = 'Stuttgart';

SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'Spain';

SELECT * FROM Customers
WHERE NOT Country = 'Germany';

SELECT * FROM Customers
WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Stuttgart');

SELECT * FROM Customers
WHERE NOT Country = 'Germany' AND NOT Country = 'USA';

SELECT * FROM customers
ORDER BY country;

SELECT * FROM customers
ORDER BY country asc;
SELECT * FROM customers
ORDER BY country DESC;

SELECT * FROM customers
ORDER BY country, customerName;

SELECT * FROM customers
ORDER BY country asc, customerName desc;
