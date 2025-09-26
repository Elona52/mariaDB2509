/* 6장 3-2 */

-- 비재귀적 CTE
USE sqlDB;
SELECT userid AS '사용자',SUM(price*amount) AS '총구매액'
FROM buytbl GROUP BY userid;

WITH abc(userid, total)
AS
(SELECT userid, SUM(price*amount)
FROM buytbl GROUP BY userid)

SELECT * FROM abc ORDER BY total DESC;

WITH abc(userid, total)
AS
(SELECT userid, SUM(price*amount)
FROM buytbl GROUP BY userid)
SELECT * FROM abc ORDER BY total DESC;

/* 지역별로 큰 키 선정
SELECT addr, MAX(height) FROM usertbl GROUP BY addr */

SELECT * FROM usertbl;

WITH cte_userTBL (addr, Height) AS
 (SELECT addr,MAX(height)
 FROM userTBL GROUP BY addr)
SELECT MAX(height) AS '각 지역별 최고키' FROM cte_usertbl;
 
 
WITH cte_userTBL (addr, maxHeight) 
AS
 (SELECT addr,MAX(height)
 FROM userTBL GROUP BY addr)
 SELECT AVG(maxHeight*1.0) AS '각 지역별 최고키의 평균' FROM cte_usertbl;
 
 
