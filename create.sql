--테이블을 복사하는 create table
--use sqlDB;
use iot_DB;

CREATE TABLE buyTbl2 (SELECT * FROM buytbl);
SELECT * FROM buyTbl2;

--특정 컬럼을 복사
CREATE TABLE buyTbl3 (SELECT userID, prodName FROM buytbl);
SELECT * FROM buyTbl3;



-- 테스트 데이터 생성
CREATE TABLE stdTBL(
    stdName    VARCHAR(10) NOT NULL PRIMARY KEY,
    addr CHAR(4) NOT NULL
);
CREATE TABLE clubTBL(
  clubName    VARCHAR(10) NOT NULL PRIMARY KEY,
  roomNo    CHAR(4) NOT NULL
);
CREATE TABLE stdclubTBL(
    num int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    stdName VARCHAR(10) NOT NULL,
    clubName VARCHAR(10) NOT NULL,
    FOREIGN KEY(stdName) REFERENCES stdTBL(stdName),
    FOREIGN KEY(clubName) REFERENCES clubTBL(clubName)
);

INSERT INTO stdTBL VALUES
('김범수', '경남'), ('성시경', '서울'), ('조용필', '경기'),
('은지원', '경북'), ('바비킴', '서울');
INSERT INTO clubTBL VALUES
('수영', '101호'), ('바둑', '102호'), ('축구', '103호'),
('봉사', '104호');
INSERT INTO stdclubTBL VALUES
(NULL, '김범수', '바둑'), (NULL, '김범수', '축구'),
(NULL, '조용필', '축구'), (NULL, '은지원', '축구'),
(NULL, '은지원', '봉사'), (NULL, '바비킴', '봉사');