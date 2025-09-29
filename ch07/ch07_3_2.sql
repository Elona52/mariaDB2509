/* 7장 3-2 */

-- 외부 조인
/*
SELECT <열 목록>
FROM <첫번째 테이블(left 테이블)>
	LEFT OUTER JOIN <두번째 테이블>
		ON <조인될 조건>
*/

USE sqlDb;
SELECT u.userID, u.name, b.prodname, u.addr, CONCAT(u.mobile1,u.mobile2) AS '연락처'
FROM userTBL U

-- 왼쪽 테이블 것은 모두 출력되어야 함 
	LEFT OUTER JOIN buytbl b
		ON u.userid = b.userID
		ORDER BY u.userID;
		
-- 왼쪽과 오른쪽 테이블 위치만 바뀜		
SELECT u.userID, u.name, b.prodname, u.addr, CONCAT(u.mobile1, u.mobile2) AS '연락처'
 FROM buytbl b
 	RIGHT OUTER JOIN usertbl u
 	 ON u.userID = b.userID
 	ORDER BY u.userID;
 	
-- 한번도 구매한적 없는 회원 목록 
SELECT u.userID, u.name, b.prodname, u.addr, CONCAT(u.mobile1, u.mobile2) AS '연락처'
FROM usertbl u
   LEFT OUTER JOIN buytbl b
   ON u.userID = b.userID
WHERE b.prodName IS NULL
ORDER BY u.userID;

-- 동아리에 가입하지 않은 학생도 출력되도록 수정 
USE sqldb;
SELECT s.stdname, s.addr, c.clubname, c.roomno
 FROM stdtbl s
  LEFT OUTER JOIN stdclubtbl sc
   ON s.stdname = sc.stdname
  LEFT OUTER JOIN clubtbl c
   ON sc.clubname=c.clubname
ORDER BY s.stdname;

-- 가입학생이 없는 동아리도 출력되도록 수정
SELECT c.clubName, c.roomno, s.stdname, s.addr
	FROM stdtbl s
	 LEFT OUTER JOIN stdclubtbl sc
	 	ON sc.stdname = s.stdname
	RIGHT OUTER JOIN clubtbl c
		ON sc.clubname = c.clubname
	ORDER BY c.clubname;
	
-- 합치기

SELECT s.stdname, s.addr, c.clubname, c.roomno
		 FROM stdtbl s
		  LEFT OUTER JOIN stdclubtbl sc
		   ON s.stdname = sc.stdname
		  LEFT OUTER JOIN clubtbl c
		   ON sc.clubname=c.clubname
		
	UNION 
		SELECT c.clubName, c.roomno, s.stdname, s.addr
		FROM stdtbl s
		 LEFT OUTER JOIN stdclubtbl sc
		 	ON sc.stdname = s.stdname
		RIGHT OUTER JOIN clubtbl c
			ON sc.clubname = c.clubname
			
