-- iot_db 테이블 연습 

create user 'iot'@'%' identified by '1200';

grant all privileges on sqlDB.* to 'iot'@'%';
grant all privileges on iot_db.* to 'iot'@'%';
grant all PRIVILEGES on tableDB.* to 'iot'@'%';

use iot_DB;

-- 회원 정보 테이블, 패스워드는 암호화해서 저장해야함
DROP TABLE IF EXISTS members;

CREATE TABLE members(
    userid      VARCHAR(25) NOT NULL, -- 아이디, PK
    password    VARCHAR(50) NOT NULL, -- 비밀번호
    name        VARCHAR(20) NOT NULL, -- 이름
    email       VARCHAR(30) NULL, -- 이메일, 유니크
    phone       VARCHAR(20) NULL, -- 전화번호
    birth       date NULL, -- 생년월일
    gender      char(1) NULL CHECK(gender IN ('M', 'F')), -- 성별 M, F
    address     varchar(50) NULL, -- 주소
    create_date DATETIME NULL, -- 생성일
    update_date DATETIME NULL, -- 수정일
    
    CONSTRAINT PRIMARY KEY(userid),
    CONSTRAINT UNIQUE(email)
);

-- 패스워드 넣을땐 반드시 암호화
INSERT INTO members(userid, password, name, email, create_date, update_date)
VALUES('hinana', password('1234'), '히나나', 'hinana@naver.com', SYSDATE(), SYSDATE());
INSERT INTO members(userid, password, name, email, create_date, update_date)
VALUES('rinje', password('1234'), '린제', 'rinje@naver.com', SYSDATE(), SYSDATE());
INSERT INTO members(userid, password, name, email, create_date, update_date)
VALUES('sakura', password('1234'), '미야와키 사쿠라', 'izonesakura@line.com', SYSDATE(), SYSDATE());

-- 블로그 테이블
DROP TABLE IF EXISTS posts;

CREATE TABLE posts(
    num     int AUTO_INCREMENT PRIMARY KEY,-- 순번 PK
    writer  VARCHAR(20) NOT NULL, -- 작성자 FK: users(userid)
    title   VARCHAR(100) NOT NULL, -- 제목
    content longtext NULL, -- 내용
    create_date DATETIME NULL, -- 생성일
    update_date DATETIME NULL, -- 수정일

    CONSTRAINT FOREIGN KEY(writer) REFERENCES members(userid)
);

INSERT INTO posts(writer, title, content, create_date, update_date)
VALUES('hinana', '첫 번째 글', '테스트 글입니다.', SYSDATE(), SYSDATE());

INSERT INTO posts(writer, title, content, create_date, update_date)
VALUES('rinje', 'rinje의 첫 번째 글', '린제의 테스트 글입니다.', SYSDATE(), SYSDATE());

-- num, writer, email(writer의 이메일), content, create_date, update_date 출력

CREATE OR REPLACE VIEW v_posts
AS
SELECT P.num, P.writer, M.email, P.content, P.create_date, P.update_date 
FROM posts P
    inner join members M
        on P.writer = M.userid;

SELECT * FROm v_posts;