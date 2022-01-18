--테이블을 복사하는 create table

use sqlDB;

CREATE TABLE buyTbl2 (SELECT * FROM buytbl);
SELECT * FROM buyTbl2;

--특정 컬럼을 복사
CREATE TABLE buyTbl3 (SELECT userID, prodName FROM buytbl);
SELECT * FROM buyTbl3