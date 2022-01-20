use tableDB;

DROP TABLE IF EXISTS userTBL;

--NULL은 디폴트값이라서 생략가능
CREATE TABLE userTBL -- 회원 테이블
( userID    char(8) PRIMARY KEY, -- 사용자 아이디
  name      VARCHAR(10) NOT NULL, -- 이름
  birthYear int NOT NULL,     -- 출생연도
  addr      char(2) NOT NULL, -- 지역
  mobile1   char(3) NULL, -- 국번
  mobile2   char(8) NULL, -- 전화번호
  height    smallint NULL, -- 키
  mDate     date NULL     -- 가입일
);

DROP TABLE IF EXISTS buyTBL;

CREATE TABLE buyTBL  -- 구매 테이블
( num       int AUTO_INCREMENT PRIMARY KEY,     -- 순번(pk)
  userid    char(8) NOT NULL, -- 아이디(FK)
  prodName  char(6) NOT NULL, -- 물품명
  groupName char(4) NULL, -- 분류
  price     int NOT NULL,     -- 단가
  amount    smallint NOT NULL, -- 수량
  FOREIGN KEY(userid) REFERENCES userTBL(userID) ON DELETE CASCADE ON UPDATE CASCADE
);
--foreign key 참조되는 필드는 반드시 그 테이블에서 KEY여야 함(유일해야 함)

INSERT INTO userTBL VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTBL VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTBL VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');

INSERT INTO buyTBL VALUES(NULL, 'KBS', '운동화', NULL , 30, 2);
INSERT INTO buyTBL VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
-- INSERT INTO buyTBL VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);
-- userid가 외래키라서 insert되지 않음 --> 데이터의 일관성이 유지(consistency)

DELETE FROM userTBL WHERE userID = 'KBS';
-- on delete cascade 확인

UPDATE userTBL
SET
    userid = 'TBS'
WHERE userid = 'KBS';

--기본 키의 제약 조건 위반
DROP TABLE IF EXISTS CONSTRAINTTBL;
CREATE TABLE CONSTRAINTTBL
(
userID CHAR(8) NOT NULL, --PRIMARY KEY
name VARCHAR(10) NOT NULL,
birthYear INT NOT NULL,
CONSTRAINT PRIMARY KEY PK_CONSTRAINTTBL_userID (userID)
);

insert into CONSTRAINTTBL
VALUES('kbs', '김범수', 2000);

insert into CONSTRAINTTBL
VALUES('kbs', '김범수2', 2010); -- 기본키 제약조건 위반

insert into CONSTRAINTTBL
VALUES('kbs2', '김범수2'); -- NOT NULL 제약조건 위반

-- 컬럼 여러개를 써서 PRIMARY KEY 지정(복합키)
DROP TABLE IF EXISTS prodTbl;
CREATE TABLE prodTbl
(
    prodCode CHAR(3) NOT NULL,
    prodID CHAR(4) NOT NULL,
    prodDate DATETIME NOT NULL,
    prodCur CHAR(10) NULL,
    CONSTRAINT PRIMARY KEY (prodCode, prodID)-- 복합키 선언은 테이블 레벨에서만 가능
);

-- 테이블 생성 이후 제약조건 추가
ALTER TABLE prodTbl
ADD CONSTRAINT PRIMARY KEY (prodCode, prodID, prodDate);

-- PRIMARY KEY 확인할 때 유용함
SHOW INDEX FROM prodTbl;





-- UNIQUE 제약 조건 : 중복을 허용하지 않으나 NULL은 허용한다!(기본키와의 차이점) - 유일성만 허용
-- UNIQUE는 한 테이블에서 여러 개의 key를 지정할 수 있다(복합키 아님)

-- UNIQUE & 컬럼레벨, 테이블레벨 예시
DROP TABLE IF EXISTS buyTBL, userTBL;
CREATE TABLE userTBL
(
    userID  CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    email CHAR(30) NULL UNIQUE --컬럼 레벨에서 선언
);

DROP TABLE IF EXISTS buyTBL, userTBL;
CREATE TABLE userTBL
(
    userID  CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    email CHAR(30) NULL,
    CONSTRAINT AK_email UNIQUE (email) --테이블 레벨에서 선언
);

-- CHECK 제약 조건
DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL
(
    userID CHAR(8) PRIMARY KEY,
    name VARCHAR(10) ,
    birthYear INT CHECK (birthYear >= 1900 AND birthYear <= 2020), --컬럼 레벨
    mobile1 CHAR(3) NULL,
    CONSTRAINT CK_name CHECK ( name IS NOT NULL) -- 테이블 레벨
);

-- DEFAULT 정의, 값을 입력하지 않았을 때 자동으로 입력
DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL
( userID     char(8) NOT NULL PRIMARY KEY,
  name       varchar(10) NOT NULL,
  birthYear  int NOT NULL DEFAULT -1,
  addr       char(2) NOT NULL DEFAULT '서울',
  mobile1    char(3) NULL,
  mobile2    char(8) NULL,
  height     smallint NULL DEFAULT 170,
  mDate      date NULL
);


-- 뷰 생성
DROP VIEW IF EXISTS v_userTBL;
CREATE VIEW v_userTBL
AS
    SELECT userid, name, addr FROM userTBL;
SELECT * FROM v_userTBL;




-- 복잡한 join 형태에서의 뷰 활용
-- 기존 문장
SELECT U.userid, U.name, B.prodName, U.addr,
       CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM userTBL U
  INNER JOIN buyTBL B
     ON U.userid = B.userid ;

-- 뷰 생성
--DROP VIEW IF EXISTS v_userbuyTBL;
CREATE OR REPLACE VIEW v_userbuyTBL
AS
SELECT U.userid, U.name, B.prodName, U.addr,
       CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM userTBL U
    INNER JOIN buyTBL B
        ON U.userid = B.userid;

SELECT * FROM v_userbuyTBL;