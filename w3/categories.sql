SHOW DATABASES;
USE exdb;
SHOW TABLES;

DROP TABLE Categories;
CREATE TABLE Categories(
CategoryID int,
CategoryName VARCHAR(50),
description text
);

SELECT * FROM Categories;