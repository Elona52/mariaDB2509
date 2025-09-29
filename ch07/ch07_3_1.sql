/* 7장 3-1 */

-- inner join
/* 
SELECT <열목록> 
FROM <첫번째 테이블>
INNER JOIN <두번쨰 테이블>
ON 조인될 조건
WHERE 검색조건;
*/

USE sqlDB;

SELECT * 
FROM buytbl
INNER JOIN usertbl
ON buytbl.userID = usertbl.userID
WHERE buytbl.userID = 'JYP';


SELECT buyTBL.userID, NAME, prodName, addr, CONCAT(mobile1, mobile2) AS '연락처'
FROM buytbl 
	INNER JOIN usertbl
		ON buytbl.userID = userTBL.userID;
		


SELECT buyTBL.userID, userTBL.name, buyTBL.prodName, userTBL.addr,
	CONCAT(userTBL.mobile1, userTBL.mobile2) AS '연락처'
FROM buyTBL
	INNER JOIN userTBL
		ON buyTBL.userID = userTBL.userID;


SELECT B.userID, U.name , B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM buyTBL B
	INNER JOIN userTBL U
		ON B.userID = U.userID;
		
SELECT B.userID, U.name , B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM buyTBL B
 INNER JOIN userTBL U
  ON B.userID = U.userID
  WHERE B.userID = 'JYP';

SELECT U.userID, U.name , B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM userTBL U
 INNER JOIN buyTBL B
  ON B.userID = B.userID
  WHERE B.userID = 'JYP';
  
  
  -- -------------------------------
  
  SELECT distinct U.userID, U.name, U.addr
  FROM UserTBl U
  	 INNER JOIN buytbl B
  		ON U.userID = B.userID
  	ORDER BY U.userID ;
  	
  	
  	SELECT u.userID, u.name, u.addr
  	FROM userTBL U
  	WHERE EXISTS(
  	SELECT * 
  	FROM buyTbl B
  	WHERE U.userID = B.userID);
  	
  	-- ------------------------------
  	
DROP TABLE IF EXISTS stdclubTBL;
DROP TABLE IF EXISTS stdTBL;
DROP TABLE IF EXISTS clubTBL;
  	
  	-- 세개 테이블 조인
  	USE sqldb;
  	
  	CREATE TABLE stdTBL
  	(stdName VARCHAR(10) NOT NULL PRIMARY KEY,
  	addr CHAR(4) NOT null
  	);
  
  
	CREATE TABLE clubTBL
	(clubName VARCHAR(10) NOT NULL PRIMARY KEY,
	roomNo CHAR(4) NOT null
	);
	
	
	CREATE TABLE stdclubTBL
	(num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	stdName VARCHAR(10) NOT NULL,
	clubName VARCHAR(10) NOT NULL,
	FOREIGN KEY(stdName) REFERENCES stdTBL(stdName),
	FOREIGN KEY(clubName) REFERENCES clubTBL(clubName)
 	);
	
	INSERT INTO stdTBL (stdName, addr) VALUES 
	(N'김범수', N'경남'), 
	(N'성시경', N'서울'),
	(N'조용필', N'경기'), 
	(N'은지원', N'경북'), 
	(N'바비킴', N'서울');

	INSERT INTO clubTBL VALUES 
	(N'수영',N'101호'), (N'바둑',N'102호'),(N'축구',N'103호'), 
	(N'봉사',N'104호');
	
	INSERT INTO stdclubTBL VALUES 
	(null,N'김범수',N'바둑'), (null,N'김범수',N'축구'),(null,N'조용필',N'축구'), 
	(null,N'은지원',N'축구'), (null,N'은지원',N'봉사'),(null,N'바비킴',N'봉사');   
  

SELECT * FROM stdTBL;
SELECT * FROM clubTBL;
SELECT * FROM stdclubTBL;

   -- 학생 테이블,동아리 테이블, 학생동아리 테이블 사용해서 학생 기준으로 이름/지역/가입한 동아리/동아리방 출력
	SELECT s.stdName, s.addr, c.clubname, c.roomno
	FROM stdtbl s
		INNER JOIN stdclubtbl sc
		 ON s.stdname = sc.stdname
		INNER JOIN clubtbl c
		 ON sc.clubname = c.clubname
	ORDER BY s.stdname;
	
	-- 동아리 기준 가입한 학생목록 출력
	SELECT c.clubname, c.roomno, s.stdname, s.addr
	 FROM stdtbl s
	INNER JOIN stdclubtbl sc
		ON sc.stdname = s.stdname
	INNER JOIN clubtbl c
	ON sc.clubname = c.clubname
	ORDER BY c.clubname;
	
	
	
	
	