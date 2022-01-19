-- 시험 문제 무조건 나옴
use sqlDB;

-- 배송을 위한 질의
SELECT *
FROM buyTbl
    INNER JOIN userTbl
    ON buyTbl.userID = userTbl.userID;


SELECT buyTBL.userID, name, prodName, addr, CONCAT(mobile1,mobile2) AS '연락처' FROM buyTBL
    INNER JOIN userTBL
    ON buyTBL.userID = userTBL.userID ;

SELECT B.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM buyTBL B
    INNER JOIN userTBL U
    ON B.userID = U.userID
WHERE B.userID = 'JYP';

SELECT B.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM buyTBL B
    INNER JOIN userTBL U
    ON B.userID = U.userID
WHERE B.userID = 'JYP'
ORDER BY U.userID;

--구매한 적이 있는 회원
SELECT DISTINCT U.userID, U.name, U.addr FROM userTBL U
  INNER JOIN buyTBL B
  ON U.userID = B.userID
ORDER BY U.userID;

SELECT S.stdName, S.addr, C.clubName, C.roomNo
FROM stdTBL S
    INNER JOIN stdclubTBL SC
    ON S.stdName = SC.stdName
    INNER JOIN clubTBL C
    ON SC.clubName = C.clubName
ORDER BY S.stdName;