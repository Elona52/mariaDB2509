SHOW TABLES;
USE exdb;

DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE persons(
id INT NOT NULL,
Lastname VARCHAR(255) NOT NULL,
FIRSTname VARCHAR(255),
age INT,
city VARCHAR(255) DEFAULT 'sandness'
);
DESC persons;

INSERT INTO person() VALUES();


INSERT INTO persons(ID, LastName) VALUES(1, '길동');
INSERT INTO persons(LastName,ID) VALUES('지매',2);
INSERT INTO persons VALUES(3,'세종','대왕',500,'수원');
INSERT INTO persons VALUES(4,'춘향','성',9999,'수원9');


SELECT * FROM persons;

SELECT Lastname, IFNULL(age, 8888) as LastName
FROM persons
WHERE Lastname = '길동';

-- --------------------------------------
ALTER TABLE persons
ALTER city SET DEFAULT '수원';
INSERT INTO persons VALUES(4,'춘향','성',9999,'용인');
INSERT INTO persons(ID, LastName) VALUES(5,'길동');

ALTER TABLE persons
ALTER city DROP DEFAULT;
DESC persons;
INSERT INTO persons(ID,LastName) VALUES(6, '길동6');
-- ---------------------------------------
DROP TABLE orders;
SELECT * FROM orders;

CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT CURRENT_DATE()
);

DESC orders;

INSERT INTO orders(ID,OrderNumber) VALUES(1,100);
INSERT INTO orders VALUES(2,200,'2020-09-09');
INSERT INTO orders VALUES(3,300,'2020-08-08');

SELECT * FROM orders;

-- -------------------------------------------
-- index

CREATE INDEX idx_lastName
ON persons(LastName);
SELECT * FROM persons;
DESC persons;

SHOW INDEX FROM persons;

CREATE INDEX idx_pname
ON persons(LastName, FirstName);

ALTER TABLE persons
DROP INDEX idx_lastName;
SHOW index FROM persons;

ALTER TABLE persons
DROP INDEX idx_pname;
SHOW INDEX FROM persons;

-- ---------------------------------------------
-- auto increment

DROP TABLE persons;

CREATE TABLE persons(
personid INT NOT NULL AUTO_INCREMENT,
LastName VARCHAR(255) NOT NULL,
FirstName VARCHAR(255),
age INT,
PRIMARY KEY(personid)
);

SELECT * FROM persons;
INSERT INTO persons(LastName, FirstName,Age) VALUES('홍', '길동', 22);
INSERT INTO persons(LastName, FirstName,Age) VALUES('일', '지매', 25);

ALTER TABLE persons AUTO_INCREMENT=100;
INSERT INTO persons(LastName, FirstName,Age) VALUES('대왕', '세종', 30);

DESC persons;
ALTER TABLE persons AUTO_INCREMENT=1;
INSERT INTO persons(LastName, FirstName,Age) VALUES('성', '춘향', 16);

DESC persons;
ALTER TABLE persons AUTO_INCREMENT=50;
INSERT INTO persons(LastName, FirstName,Age) VALUES('장', '영실', 35);


-- -----------------------------------------------
-- date
SELECT * FROM orders;
DROP TABLE orders;
CREATE TABLE orders(
	oerderId INT,
	ProducrName VARCHAR(200),
	OrderDate date
);

INSERT INTO orders VALUES(1, 'Geitost', '2008-11-11');
INSERT INTO orders VALUES(2, 'Camembert Pierrot', '2008-11-09');
INSERT INTO orders VALUES(3, 'Mozzarella di Giovanni', '2008-11-11');
INSERT INTO orders VALUES(4, 'Mascarpone Fabioli', '2008-10-29');


SELECT *
FROM orders
WHERE date(orderDate) = '2008-11-11';

SELECT * FROM orders;


-- datetime

SELECT * FROM orders;
DROP TABLE orders;
CREATE TABLE orders(
	oerderId INT,
	ProducrName VARCHAR(200),
	OrderDate date
);

INSERT INTO orders VALUES(1, 'Geitost', '	2008-11-11 13:23:44');
INSERT INTO orders VALUES(2, 'Camembert Pierrot', '2008-11-09 15:45:21');
INSERT INTO orders VALUES(3, 'Mozzarella di Giovanni', '2008-11-11 11:12:01');
INSERT INTO orders VALUES(4, 'Mascarpone Fabioli', '2008-10-29 14:56:59');

SELECT *
FROM orders
WHERE orderDate between '2008-11-11 00:00:00' AND '2008-11-23:59:00';

SELECT *
FROM orders
WHERE DATE_FORMAT(orderDate, '%Y-%m-%d') = '2008-11-11';

-- ----------------------------------------------------
-- view
SELECT * FROM customers;

CREATE VIEW `Brazil Customers` AS
SELECT CustomerName, ContactName
FROM customers
WHERE Country = 'Brazil'; 

SELECT * FROM `Brazil Customers`;

-- 서브쿼리
SELECT AVG(Price) FROM products;

CREATE VIEW `Products Above Average Price` AS
SELECT ProductName, Price
FROM products
WHERE Price > (SELECT AVG(Price) FROM Products);

SELECT * FROM `Products Above Average Price`;


-- 뷰 생성(create) 하거나 수정(replace)

CREATE OR REPLACE VIEW `Brazil Customers` AS
SELECT CustomerName, ContactName, City, Country
FROM Customers
WHERE Country = 'Brazil';

SELECT * FROM `Brazil Customers`;

DROP VIEW `Brazil Customers`;
DROP VIEW `Products Above Average Price`;

































