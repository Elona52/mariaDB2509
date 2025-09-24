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

