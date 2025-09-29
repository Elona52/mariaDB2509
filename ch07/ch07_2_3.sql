/* 7장 2-3 */

-- 피벗의 구현

USE sqlDB;
CREATE TABLE pivotTest
(uName CHAR(3),
season CHAR(2),
amount INT);

INSERT INTO pivotTest VALUES
('김범수', '겨울', 10),('윤종신', '여름', 15),('김범수', '가을', 25),('김범수', '봄', 3),
('김범수', '봄', 37),('윤종신', '겨울', 40),('김범수', '여름', 14),('김범수', '겨울', 22),
('윤종신', '여름', 64);
SELECT * FROM pivotTest;


SELECT uName,
SUM(IF(season='봄', amount, 0)) AS '봄',
SUM(IF(season='여름', amount, 0)) AS '여름',
SUM(IF(season='가을', amount, 0)) AS '가을',
SUM(IF(season='겨울', amount, 0)) AS '겨울',
SUM(amount) AS '합계' FROM pivotTest GROUP BY uName;

-- JSON 데이터 
USE sqlDB;
SELECT JSON_OBJECT('name',NAME,'height',height) AS 'JSON 값'
FROM usertbl
WHERE height >= 180;

SET @JSON='{ "userTBL" :
[
{"name": "임재범", "height":182},
{"name": "이승기", "height":182},
{"name": "성시경", "height":186}
]
}';

SELECT JSON_VALID(@JSON);
SELECT JSON_search(@JSON, 'one', '성시경');
SELECT JSON_extract(@JSON, '$.userTBL[2].name');
SELECT JSON_insert(@JSON, '$.userTBL[0].mdate', '2009-09-09');
SELECT JSON_replace(@JSON, '$.userTBL[0].name', '홍길동');
SELECT JSON_remove(@JSON, '$.userTBL[0]');


















