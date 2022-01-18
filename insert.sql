--insert, key 설정

use sqlDB;

CREATE TABLE testTBL1 (
    id int, -- 사용자 ID
    username char(3), -- 사용자 이름
    age int --사용자 나이
    );


INSERT INTO testTBL1 VALUES (1, '히나나', 25);

--넣고자 하는 테이블의 열을 지정하지 않고 values를 생략하면 오류
--열을 지정하면 순서도 바꿔서 대입 가능
INSERT INTO testTBL1(id, userName) VALUES (2, '하지메');
INSERT INTO testTBL1(userName, age, id) VALUES ('린제', '22', 3);

SELECT * FROM testTBL1;



--PRIMARY KEY : 행을 구분짓기 위한 정보(중복되면 안됨)
CREATE TABLE testTBL2 (
    id int AUTO_INCREMENT PRIMARY KEY, --값을 제시하지 않은 경우 자동으로 증가
    userName char(3),
    age int
);

INSERT INTO testTBL2 VALUES (NULL, '히나나', 28);
INSERT INTO testTBL2 VALUES (NULL, '하지메', 27);
INSERT INTO testTBL2 VALUES (NULL, '린제', 26);
INSERT INTO testTBL2 VALUES (10, '아사히', 22);
INSERT INTO testTBL2 VALUES (NULL, '텐카', 26);

--자동 증가하는 값 변경
ALTER TABLE testTBL2 AUTO_INCREMENT=100;
INSERT INTO testTBL2 VALUES(NULL, '키리코', 27);

--다중 INSERT
INSERT INTO testTBL2 VALUES
(NULL, '아마나', 26),
(NULL, '히오리', 26),
(NULL, '후유코', 28);

SELECT * FROM testTBL2;

--다른 DB에 있는 대량 데이터를 INSERT
CREATE TABLE testTBL3 (
    id int,
    Fname varchar(50),
    Lname varchar(50)
    );

INSERT INTO testTBL3
SELECT emp_no, first_name, last_name
FROM employees.employees; --해당 데이터베이스명을 앞에 적어줘야한다.

select * from testTBL3