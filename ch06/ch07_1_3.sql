/* 7장 1-3 */

--  데이터 형식과 형 반환

USE sqldb;
SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl;

-- 1.정수로 값 확인
SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl;

-- 2.
SELECT CONVERT(AVG(amount) , SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl;


SELECT Cast('2022$12$12' AS DATE);
SELECT Cast('2022/12/12' AS DATE);
SELECT Cast('2022%12%12' AS DATE);
SELECT Cast('2022@12@12' AS DATE);



SELECT num, CONCAT(CAST(price AS CHAR(10)), 'X', CAST(amount AS CHAR(4)), '=')  AS '단가X수량',
price*amount AS '구매액'
FROM buytbl;


-- 암시적 형 변환
SELECT '100' + '200' ; 
SELECT CONCAT('100','200');
SELECT CONCAT(100, 200);
SELECT 1>'2mega';
SELECT 3>'2MEGA';
SELECT 0='mega2';

SELECT * FROM buytbl;

