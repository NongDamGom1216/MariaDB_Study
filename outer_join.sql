USE sqlDB;
SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM userTBL U
   LEFT OUTER JOIN buyTBL B
   ON U.userID = B.userID
ORDER BY U.userID;

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM buyTBL B
   RIGHT OUTER JOIN userTBL U
   ON U.userID = B.userID
ORDER BY U.userID;

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM userTBL U
   LEFT OUTER JOIN buyTBL B
    ON U.userID = B.userID
WHERE B.prodName IS NULL
ORDER BY U.userID;