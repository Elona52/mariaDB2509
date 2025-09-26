/* w3 any,all/ insert select */

SHOW DATABASES;
USE exdb;

SHOW TABLES;

SELECT * FROM products;
SELECT * FROM orderdetail;

SELECT productname
	FROM products
	WHERE productID = 3;

SELECT productID
	FROM orderDetail
	WHERE quantity = ANY   -- ANY는 "quantity 값이 서브쿼리에서 반환된 productID들 중 어느 하나와 같다면 참"
	(SELECT productID
	FROM orderDetail
	WHERE quantity = 10);   --  quantity가 10인 주문 상세 행들의 productID 목록을 반환
	

SELECT productID, quantity
	FROM orderDetail
	WHERE quantity = 10;
	

SELECT ProductID
  FROM OrderDetail
  WHERE Quantity > 99;
  
  
  

SELECT productname
	FROM products
	WHERE productID = 35;
	
	
SELECT productname
	FROM products
	WHERE productID = any
	(SELECT ProductID
  FROM OrderDetail
  WHERE Quantity > 99);
  
  
SELECT productname
	FROM products
	WHERE productID = any
	(SELECT ProductID
  FROM OrderDetail
  WHERE Quantity > 1000);
    

SELECT all productname
FROM products
WHERE TRUE;


SELECT productname
	FROM products
	WHERE productID = ALL
(SELECT ProductID
  FROM OrderDetail
  WHERE Quantity = 10);
  
  
  -- 고객 91명
  SELECT * FROM customers;
  -- 공급업체 29개 
  SELECT * from suppliers;

INSERT INTO customers(customername, city, country)  --  suppliers에서 suppliername, city, country 값을 행별
SELECT suppliername, city, country FROM suppliers;  -- customers 테이블의 (customername, city, country) 컬럼 순서에 맞춰 삽입

/*문법 잘못됨 
SELECT * FROM customers
WHERE customerID = 'NULL';
*/

SELECT * FROM customers
WHERE customerID IS NULL;

INSERT INTO customers
(CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT SupplierName, ContactName, Address, City, PostalCode, Country FROM suppliers;

  -- 고객 91명 + 29 = 120 + 29 = 149
  SELECT * FROM customers;
  -- 공급업체 29개 
  SELECT * from suppliers;
  
INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country='Germany';

  -- 고객 91명 + 29 = 120 + 29 = 149 + 3 = 152
  SELECT * FROM customers;
  -- 공급업체 29개 
  SELECT * from suppliers;
