/* create table */

USE exdb;

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

SELECT * FROM persons;

CREATE TABLE testtable AS
SELECT customername, contactname
FROM customers;

SELECT * FROM testtable;

CREATE TABLE testtable2 AS
SELECT customername, contactname
FROM customers;

SELECT * FROM testtable2;

/* drop table */
-- 테이블 삭제
DROP TABLE testtable;
-- 테이블 초기화(레코드 삭제)
TRUNCATE TABLE testtable2;

-- ------------------
SELECT * FROM persons;
DESC persons;
SELECT * FROM customers;
DESC customers;

ALTER TABLE customers
ADD email VARCHAR(255);
DESC cutomers;

ALTER TABLE customers
DROP COLUMN email;
DESC customers;

-- ------------------
SELECT * FROM persons;
DESC persons;

ALTER TABLE persons
ADD DateOfBirth DATE;
DESC persons;

ALTER TABLE persons
MODIFY COLUMN DateOfBirth YEAR;
DESC persons;

ALTER TABLE persons
DROP COLUMN DateOfBirth;
DESC persons;

 