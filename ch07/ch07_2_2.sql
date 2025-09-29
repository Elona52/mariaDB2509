/* 7장 2-2 */

USE sqldb;
-- 키큰 순위
SELECT ROW_NUMBER() OVER(ORDER BY height DESC) "키큰순위",NAME,addr,height 
FROM usertbl;

-- 동일 키의 경우 이름 가나다순으로 정렬 
SELECT ROW_NUMBER() OVER(ORDER BY height DESC, NAME ASC)"키큰순위",NAME,addr,height
FROM usertbl;

-- 각 지역별 순위 
SELECT addr, ROW_NUMBER() OVER(PARTITION BY addr ORDER BY height DESC, NAME ASC)
"지역별키큰순위",NAME,height
FROM usertbl;

-- 전체 순위 
SELECT DENSE_RANK() OVER(ORDER BY height DESC) "키큰순위",NAME,addr,height
FROM usertbl;

SELECT RANK() OVER(ORDER BY height DESC) "키큰순위" , NAME, addr, height
FROM usertbl;

SELECT NTILE(2) OVER(ORDER BY height DESC) "반번호", NAME, addr, height
FROM usertbl;

-- 분석함수
USE sqldb;
SELECT NAME, addr, height AS "키",
height - (LEAD(height,1) OVER (ORDER BY height DESC)) AS "다음 사람과 키 차이"
FROM usertbl;

SELECT addr, NAME, height AS "키",
	height - ( FIRST_VALUE(height) OVER (PARTITION BY addr ORDER BY height DESC))
	AS "지역별 최대키와 차이"
	FROM userTbL;
	
SELECT addr, NAME, height AS '키',
	CAST( (CUME_DIST() OVER (PARTITION BY addr ORDER BY height DESC)) * 100 AS INTEGER) AS "누적인원 백분율%"
FROM usertbl;
