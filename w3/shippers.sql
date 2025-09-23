SHOW DATABASES;
USE exdb;
SHOW TABLES;

DROP TABLE shippers;

CREATE TABLE shippers(
shipperID INT,
shipperName VARCHAR(50),
phone VARCHAR(20)
);

-- 레코드 삭제
DELETE FROM shippers;
-- 필드 선택 
SELECT * FROM shippers;
