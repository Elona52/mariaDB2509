
/* 06장 1-2*/


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





