/* 7장 1-2 */

-- 변수의 사용

USE sqldb;

SET @myVar1 = 5;
SET @myVar2 = 3;
SET @myVar3 = 4.25;
SET @myVar4 = '가수이름==>';

SELECT @myVar1;
SELECT @myVar2 + @myVar3;

SELECT @myVar4 , NAME FROM userTBL WHERE height > 180;

-- ------------------------

SET @myVar1 = 3;
PREPARE myQuery
FROM 'select name, height from usertbl order by height limit ?';
EXECUTE myQuery USING @myVar1;

