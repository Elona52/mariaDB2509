/* 6장 4과 */

-- insert
USE sqldb;
CREATE TABLE testtbl1 (id INT, username CHAR(3), age INT);
INSERT INTO testtbl1 VALUES(1,'홍길동',25);

INSERT INTO testtbl1(id,username) VALUES(2,'설현');

INSERT INTO testtbl1(username,age,id) VALUES('초아',26,3);

-- auto_increment
USE sqldb;
CREATE TABLE testtbl2
(id INT AUTO_INCREMENT PRIMARY KEY,
username CHAR(3),
age INT);

INSERT INTO testtbl2 VALUES(NULL, '지민', 25);
INSERT INTO testtbl2 VALUES(NULL, '유나', 22);
INSERT INTO testtbl2 VALUES(NULL, '유경', 21);
SELECT * FROM testtbl2;

ALTER TABLE testtbl2 AUTO_INCREMENT=100;
INSERT INTO testtbl2 VALUES(NULL, '찬미', 23);
SELECT * FROM testtbl2;

USE sqldb;
DROP TABLE testtbl3;

CREATE TABLE testtbl3
(id INT AUTO_INCREMENT PRIMARY KEY,
username CHAR(3),
age INT);

ALTER TABLE testtbl3 AUTO_INCREMENT=1000;
SET @@auto_increment_increment =3;
INSERT INTO testtbl3 VALUES(NULL, '나연', 20);
INSERT INTO testtbl3 VALUES(NULL, '정연', 18);
INSERT INTO testtbl3 VALUES(NULL, '모모', 19);
SELECT * FROM testtbl3;

-- 대량샘플 생성 
DROP TABLE testtbl4;

USE sqldb;
CREATE TABLE testtbl4(id INT, fname VARCHAR(50), lname VARCHAR(50));
INSTR INTO testtbl4
SELECT emp_no, first_name, last_name
FROM employees.employees;

USE sqldb;
CREATE TABLE testtbl5(select emp_no, first_name, last_name FROM employees.employees);
SELECT * FROM testtbl5;