SHOW DATABASES;
USE shopdb;
SELECT * FROM membertbl;
SELECT * FROM producttbl;

INSERT INTO membertbl VALUES ('figure', '연아', '경기도 군포시 당동');

UPDATE membertbl SET memberAddress = '서울 강남구 역삼동' WHERE membername = '연아';

DELETE FROM membertbl WHERE membername = '연아';

CREATE TABLE deletedMembertbl(
memberId CHAR(8),
membername CHAR(5),
memberaddress CHAR(20),
deletedDate DATE );


DELIMITER //
CREATE TRIGGER trg_deletedMemberTBL
AFTER DELETE ON memberTbl
FOR EACH ROW

BEGIN
INSERT INTO deletedMemberTBL
VALUES(OLD.memberid, OLD.membername, OLD.memberaddress, CURDATE());

END//
DELIMITER;


