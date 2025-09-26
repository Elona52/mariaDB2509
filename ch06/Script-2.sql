
/* 06장 1과 */

USE mysql;
USE employees;
SHOW TABLES;
SELECT * FROM employees;

SELECT * FROM titles ;

SELECT * FROM employees.titles;

SELECT * FROM employees.titles;
SELECT * FROM titles;

SELECT first_name FROM employees;

SELECT first_name, last_name, gender FROM employees;

-- 한줄 주석 연습
SELECT first_name, last_name, gender -- 이름과 성별 열을 가져옴
FROM employees;

/* 블록 주석 연습
SELECT first_name, last_name, gender
FROM employees;
*/


-- <실습 1> --

SHOW DATABASES;

USE employees;

SHOW TABLE STATUS;

DESCRIBE employees; -- 또는 DESC employees;

SELECT first_name, gender FROM employees;

SELECT first_name AS 이름 , gender 성별, hire_date '회사 입사일'
FROM employees;

-- <실습 2> --

DROP DATABASE IF EXISTS sqlDB; -- 만약 sqlDB가 존재하면 우선 삭제한다. (경고창은 무시한다)
CREATE DATABASE sqlDB;

USE sqlDB;

DROP TABLE buytbl;
DROP TABLE usertbl;
CREATE TABLE userTbl -- 회원 테이블
( userID  	CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
  name    	VARCHAR(10) NOT NULL, -- 이름
  birthYear   	INT NOT NULL,  -- 출생년도
  addr	  	CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  mobile1	CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
  mobile2	CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
  height    	SMALLINT,  -- 키
  mDate    	DATE  -- 회원 가입일
);
CREATE TABLE buyTbl -- 회원 구매 테이블
(  num 		INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
   userID  	CHAR(8) NOT NULL, -- 아이디(FK)
   prodName 	CHAR(6) NOT NULL, --  물품명
   groupName 	CHAR(4)  , -- 분류
   price     	INT  NOT NULL, -- 단가
   amount    	SMALLINT  NOT NULL, -- 수량
   FOREIGN KEY (userID) REFERENCES userTbl(userID) -- 외래키 지정
);

INSERT INTO userTbl VALUES('LSG', N'이승기', 1987, N'서울', '011', '11111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', N'김범수', 1979, N'경남', '011', '22222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', N'김경호', 1971, N'전남', '019', '33333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', N'조용필', 1950, N'경기', '011', '44444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', N'성시경', 1979, N'서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', N'임재범', 1963, N'서울', '016', '66666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', N'윤종신', 1969, N'경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', N'은지원', 1972, N'경북', '011', '88888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', N'조관우', 1965, N'경기', '018', '99999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', N'바비킴', 1973, N'서울', '010', '00000000', 176, '2013-5-5');
INSERT INTO buyTbl VALUES(NULL, 'KBS', N'운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES(NULL, 'KBS', N'노트북', N'전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL, 'JYP', N'모니터', N'전자', 200,  1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', N'모니터', N'전자', 200,  5);
INSERT INTO buyTbl VALUES(NULL, 'KBS', N'청바지', N'의류', 50,   3);
INSERT INTO buyTbl VALUES(NULL, 'BBK', N'메모리', N'전자', 80,  10);
INSERT INTO buyTbl VALUES(NULL, 'SSK', N'책'    , N'서적', 15,   5);
INSERT INTO buyTbl VALUES(NULL, 'EJW', N'책'    , N'서적', 15,   2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', N'청바지', N'의류', 50,   1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', N'운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', N'책'    , N'서적', 15,   1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', N'운동화', NULL   , 30,   2);

SELECT * FROM userTbl;
SELECT * FROM buyTbl;









/* 06장 2과*/


SHOW DATABASES;

USE sqlDB;
SELECT * FROM usertbl;

-- 관계 연산자 사용
SELECT userID, NAME FROM usertbl WHERE birthYear >= 1970 AND height >= 182;
SELECT userID, NAME FROM usertbl WHERE birthyear >= 1970 OR height >= 182;

SELECT NAME, height FROM usertbl WHERE height >= 180 AND height <= 183;


SELECT NAME, height FROM usertbl WHERE height BETWEEN 180 AND 183;

SELECT NAME, addr FROM usertbl WHERE addr = '경남' OR addr = '전남' OR addr = '경북';

SELECT NAME, addr FROM usertbl WHERE addr IN ('경남', '전남', '경북');

SELECT NAME, height FROM usertbl WHERE NAME LIKE '김%';

SELECT NAME, height FROM usertbl WHERE NAME LIKE '_종신';


-- any/all/subQuery

SELECT NAME, height FROM usertbl WHERE height > 177;

-- 김경호의 키 값 출력 
SELECT height FROM usertbl WHERE NAME = '김경호'; 

SELECT NAME, height FROM usertbl
WHERE height > (SELECT height FROM usertbl WHERE NAME = '김경호');

/*서브쿼리가 둘 이상의 값을 반환하기 때문에 오류 발생 
SELECT NAME, height FROM usertbl
WHERE height >= (SELECT height FROM usertbl WHERE addr = '경남');
*/

-- 키가 170,173
SELECT height FROM usertbl WHERE addr = '경남';

-- 키가 170보다 크거나 같은 사람 또는 173보다 크거나 같은 사람 모두 출력(170보다 크거나 같은 사람) --
SELECT NAME, height FROM usertbl 
WHERE height >= ANY (SELECT height FROM usertbl WHERE addr = '경남');

-- 키가 173보다 크거나 같은 사람 
SELECT NAME, height FROM usertbl 
WHERE height >= All (SELECT height FROM usertbl WHERE addr = '경남');

-- =ANY 는 IN(서브쿼리)와 동일한 의미 
SELECT NAME, height FROM usertbl 
WHERE height = ANY(SELECT height FROM usertbl WHERE addr = '경남');

-- order by
SELECT NAME, mDate FROM usertbl ORDER BY mdate;
SELECT NAME, mDate FROM usertbl ORDER BY mdate DESC; -- 내림차순 
SELECT NAME, mDate FROM usertbl ORDER BY mdate ASC; -- 오름차순 

-- distinct 중복값을 하나만 남김 
SELECT addr FROM usertbl;
SELECT addr FROM usertbl ORDER BY addr;
SELECT distinct addr FROM usertbl;

-- limit 출력 개수 제한
USE employees;
SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC;

USE employees;
SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC
LIMIT 5;

-- 테이블 복사
USE sqlDB;
CREATE TABLE buytbl2(SELECT * FROM buytbl);
SELECT *FROM buytbl2;

CREATE TABLE buytbl3 (SELECT userID, prodname FROM buytbl);
SELECT * FROM buytbl3;






/*6장 3과*/

-- group by
SELECT userID, amount FROM buytbl ORDER BY userID;

SELECT userID, SUM(amount) FROM buytbl GROUP BY userID;

SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수'
FROM buytbl GROUP BY userID;

SELECT userID AS '사용자 아이디', SUM(price * amount) AS '총 구매액'
FROM buytbl GROUP BY userID;

-- 집계함수

USE sqlDB;
SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl;

SELECT userID, AVG(amount) AS '평균 구매 개수' FROM buytbl GROUP BY userID;

-- 큰키와 작은키 회원이름,키 
SELECT NAME, MAX(height), MIN(height) FROM usertbl;

SELECT NAME, MAX(height), MIN(height) FROM usertbl GROUP BY NAME;


SELECT name, height
FROM usertbl
WHERE height = (SELECT MAX(height) FROM usertbl)
OR height = (SELECT MIN(height) FROM usertbl);

-- 핸드폰 사용자 수 
SELECT COUNT(*) FROM usertbl;
SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM usertbl;

-- Having
USE sqlDB;
SELECT userID AS '사용자', SUM(price*amount) AS '총 구매액'
	FROM buytbl
	GROUP BY userID
	HAVING SUM(price * amount) > 1000
	ORDER BY SUM(price*amount);
	
	
-- rollup: num열의 null행이 각 그룹의 소합계를 의미함 
SELECT num, groupName, SUM(price * amount) AS '비용'
FROM buytbl
GROUP BY groupName, num
WITH ROLLUP;


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
