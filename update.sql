use sqlDB;

select * from testTBL2;

UPDATE testTBL2
SET id = 30
WHERE userName = '후유코';

UPDATE testTBL2
SET age = age + 1;