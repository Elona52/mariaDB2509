/* 7장 2-1 */

-- 제어 흐름 함수

SELECT if(100>200, '참이다', '거짓이다');

SELECT IFNULL(NULL, '널이군요'), IFNULL(100,'널이군요');

SELECT NULLIF(100,100), NULLIF(200,100);

SELECT case 10
		 when 1 then '일'
		 when 5 then '오'
		 when 10 then '십'
		 ELSE '모름'
	END;
	
	
-- 문자열 함수
SELECT ASCII('A'), CHAR(65);

SELECT BIT_LENGTH('abc'), CHAR_LENGTH('abc'), LENGTH('abc');
SELECT BIT_LENGTH('가나다'), CHAR_LENGTH('가나다'), LENGTH('가나다');

SELECT CONCAT_WS('/', '2022','01','01');


/* 
ElT(위치,문자열1,,)
FIFLD(찾을 문자열, 문자열1,,)
FIND_IN_SET(찾을 문자열, 문자열 리스트)
INSTR(기준 문자열, 부분문자열)
LOCATE(부분문자열, 기준문자열)
FORMAT(숫자, 소수점 자릿수)
*/
SELECT ELT(2, '하나', '둘', '셋'), FIELD('둘', '하나', '둘', '셋'), FIND_IN_SET('둘','하나,둘,셋'), INSTR('하나둘셋','둘'), LOCATE('둘','하나둘셋');


SELECT FORMAT(123456.123456, 4);

-- 2,16,8진수
SELECT BIN(31), HEX(31), OCT(31);

-- insert(기준문자열, 위치, 길이, 삽입문자열): 기존 문자열 위치부터 길이만큼 지우고 삽일할 문자열 끼어넣음 
SELECT INSERT('abcdefghi', 3, 4, '@@@@'), INSERT('abcdefghi',3,2,'@@@@');

-- left(문자열, 길이), right(문자열,길이): 왼쪽 또는 오른쪽에서 문자열 길이만큼 반환
SELECT LEFT('abcdefghi',3), RIGHT('abcdefghi',3);

-- upper(문자열), lower(문자열): 소문자를 대문자로, 대문자를 소문자로
SELECT LOWER('abcdEFGH'), UPPER('abcdEFGH');

-- LPAD(문자열, 길이, 채울 문자열), RPAD(문자열, 길이, 채울 문자열) : 문자열 길이만큼 늘린후, 빈곳을 문자열로 채움
SELECT LPAD('이것이', 5, '##'), RPAD('이것이', 5,'##');


-- TRIM(문자열), TRIM(방향 자를 문자열 from 문자열) : 문자열의 공백 제거
SELECT TRIM('   이것이   '), TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋㅋ재밌어요.ㅋㅋㅋ');

-- REPEAT(문자열, 횟수): 문자열 횟수만큼 반복
SELECT repeat('이것이', 3);

-- REPLACE(문자열, 원래 문자열, 바꿀 문자열)
SELECT REPLACE('이것이 MariaDB다','이것이','This is');

-- REVERSE(문자열) : 순서 거꾸로
SELECT REVERSE ('MariaDB');

-- SPACE(길이) :길이 만큼 공백 반환
SELECT CONCAT('이것이', SPACE(10), 'MariaDB다');

-- SUBSTRING(문자열, 시작위치, 길이): 시작위치부터 길이 만큼 문자 반환
SELECT SUBSTRING('대한민국 만세',3,2);


-- SUBSTRING_INDEX(문자열, 구분자, 횟수)
SELECT SUBSTRING_INDEX('cafe.naver.com', '.', 2), SUBSTRING_INDEX('cafe.naver.com', '.', -2);

-- 수학함수

-- ABS 절대값
SELECT ABS(-100);

-- 올림,내림,반올림
SELECT CEILING(4.7), FLOOR(4.7), ROUND(4.7);








