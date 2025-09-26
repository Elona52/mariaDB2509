/* Null functions */

USE exdb;
SELECT * from products;
desc products;

SELECT * from customers;

-- IFNULL
SELECT customerid, IFNULL(contactname, 'NULL') 'contactName'
FROM customers;

-- COALESCE
SELECT customerid, COALESCE(address, '주소: NULL') 'address'
from customers; 

/*
테이블 생성:  create table
테이블 삭제:  drop table
테이블 변경:  alter table

레코드 추가:  insert into
레코드 삭제:  delete
레코드(필드): update
*/
