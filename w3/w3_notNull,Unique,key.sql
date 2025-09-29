/* Not Null, Unique */

SHOW DATABASES;
USE exdb;

SHOW TABLES;
SELECT * FROM persons;
DROP TABLE persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LASTName VARCHAR(255) NOT NULL,
	age INT
);
DESCRIBE persons;

-- 테이블 필드 구조 수정
ALTER TABLE persons
	MODIFY age INT NOT NULL;
	DESC persons;

DROP TABLE persons;

CREATE TABLE persons(
	id INT NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	Firstname VARCHAR(255),
	age INT,
	UNIQUE(id)
);

DESCRIBE persons;

-- UNIQUE(ID): 1,2,3 ...ID값이 중복되면 안됨
-- UNIQUE(ID, LastName)
-- ID + LastName :  두개의 필드값을 핪친값이 중복 안됨
-- 1길동, 2길동, 1지매, 2지매 ...중복가능
-- 4대황, 4대황 .. 두개의 필드값이 중복되면 안됨

CREATE TABLE persons(
	id INT NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	firstname VARCHAR(255),
	age INT,
	CONSTRAINT UC_person UNIQUE(ID, LastName)
);


CREATE TABLE persons(
	ID INT NOT NULL,
	LASTName VARCHAR(255) NOT NULL,
	firstname VARCHAR(255),
	age INT
);
DESCRIBE persons;

CREATE TABLE persons(
	id INT NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	firstname VARCHAR(255),
	age INT,
	CONSTRAINT UC_person UNIQUE(ID, LastName)
);
DESCRIBE persons;

-- ----------------------------------
USE exdb;

ALTER TABLE Persons
ADD CONSTRAINT UC_person UNIQUE(ID,LastName);

ALTER TABLE persons
DROP INDEX UC_person;


-- -----------------------------------
SHOW INDEX FROM persons;

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Persons';

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Persons';

SELECT CONSTRAINT_NAME, COLUMN_NAME, ORDINAL_POSITION
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'Persons';
 AND CONSTRAINT_NAME = 'UC_person';


-- ----------------------
DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	age INT,
	PRIMARY KEY(ID)
);
DESC persons;
-- ----------------------
DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	age INT,
	CONSTRAINT PK_Person PRIMARY KEY(ID, LastName)
);
DESC persons;

-- ----------------------
DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	age INT
);
DESC persons;

ALTER TABLE persons
ADD PRIMARY KEY(ID);

-- ----------------------
DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	age INT
);
DESC persons;

ALTER TABLE persons
ADD CONSTRAINT PK_Person PRIMARY KEY(ID,LastName);
DESC persons;

ALTER TABLE persons
ADD CONSTRAINT PK_Person PRIMARY KEY(ID, LastName);
DESC persons;

ALTER TABLE persons
DROP PRIMARY KEY;


/* Foreign Key */
SELECT * FROM persons_f;
SELECT * FROM orders_f;

-- 인원표
CREATE TABLE Persons_f(
	PersonID INT PRIMARY KEY,
	LastName VARCHAR(255),
	FirstName VARCHAR(255),
	age INT 
);

-- 주문표
CREATE TABLE orders_f(
	OrderID INT NOT NULL,
	OrderNumber INT NOT NULL,
	PersonID INT,
	PRIMARY KEY(OrderID),
	FOREIGN KEY(PersonID) REFERENCES persons_f(PersonID)		
);
SELECT * FROM orders_f;
DESC persons_f;
DESC orders_f;

-- constraint 등록 
DROP TABLE orders_f;


CREATE TABLE orders_f(
	OrderID INT NOT NULL,
	OrderNumber INT NOT NULL,
	PersonID INT,
	PRIMARY KEY(OrderID),
	CONSTRAINT FK_PersonOrder FOREIGN KEY(PersonID) REFERENCES persons_f(PersonID)		
);

SHOW INDEX FROM orders_f;

-- -----------------------------------
DROP TABLE orders_f;
CREATE TABLE orders_f(
	OrderID INT NOT NULL,
	OrderNumber INT NOT NULL,
	PersonID INT	
);

DESC orders_f;

ALTER TABLE orders_f
ADD CONTAINS FK_PersonOrder
FOREIGN KEY(PersonID) REFERENCES Persons_f(PersonID);

SHOW INDEX FROM orders_f;

ALTER TABLE orders_f 
DROP FOREIGN KEY FK_PeronOrder;

-- --------------------------------------
DROP TABLE persons;

CREATE TABLE persons(
ID INT NOT NULL,
LastName VARCHAR(255) NOT NULL,
FIRSTname VARCHAR(255),
age INT,
CHECK(age >= 18)
);
DESC persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FIRSTname VARCHAR(255),
	age INT,
	city VARCHAR(255),
	CONSTRAINT chk_person CHECK(age >= 18 AND city = 'Sandnes')
);

SHOW INDEX from persons;

-- --------------------------------------
SHOW CREATE TABLE persons;

DROP TABLE persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FIRSTname VARCHAR(255),
	age INT,
	city VARCHAR(255)
);
DESC persons;


ALTER TABLE persons
ADD CHECK(age >= 18);

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'persons';

DROP TABLE persons;
ALTER TABLE persons
ADD CONSTRAINT CHK_PersonAge CHECK(Age > 18 AND city = 'sandnes');

ALTER TABLE persons
DROP CONSTRAINT CHK_PersonAge;












