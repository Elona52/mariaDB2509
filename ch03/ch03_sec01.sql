select * FROM membertbl;
select * FROM producttbl;

INSERT INTO membertbl VALUES('Dang', '당탕이', "경기 부천시 중동");
INSERT INTO membertbl VALUES('Jee', '지운이', "서울 은평구 증산동");
INSERT INTO membertbl VALUES('Han', '한주연', "인천 남구 주안동");
INSERT INTO membertbl VALUES('Sang', '상길이', "경기 성남구 분당구");

SELECT memberName, memberAddress FROM membertbl;

CREATE TABLE `my testTBL` (id INT);

DROP TABLE `my testtbl` ;

SELECT * FROM producttbl WHERE productName = '세탁기';

INSERT INTO producttbl VALUES('컴퓨터', 10, "2017-01-01", '삼성', 17);
INSERT INTO producttbl VALUES('세탁기', 20, "2018-09-01", 'LG', 3);
INSERT INTO producttbl VALUES('냉장고', 5, "2019-02-01", '대우', 22);

CREATE TABLE indexTBL(first_name varchar(14), last_name VARCHAR(16), hire_date DATE);
INSERT INTO indexTBL
SELECT FIRST_name, LAST_name, hire_date
FROM employees.employees
LIMIT 500;
SELECT * FROM indexTBL;

SELECT * FROM indexTBL WHERE FIRST_name = 'Mary';
explain SELECT * FROM indexTBL WHERE FIRST_name = 'Mary';

CREATE VIEW uv_memberTBL
AS
SELECT membername, memberAddress FROM membertbl;
SELECT * FROM uv_memberTBL;

SELECT * FROM membertbl WHERE memberName = '당탕이';
SELECT * FROM producttbl WHERE productName = '냉장고';

DELIMITER //
CREATE PROCEDURE myProc()
BEGIN 
	SELECT * FROM membertbl WHERE membername = '당탕이';
	SELECT * FROM producttbl WHERE productname = '냉장고';
END //
DELIMITER ;

CALL myProc();