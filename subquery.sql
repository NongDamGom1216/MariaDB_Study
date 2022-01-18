use sqlDB;

-- 김경호의 키보다 큰 사람 출력, 이 때 서브쿼리의 결과는 하나의 행이어야 함
select name, height
FROM userTbl
WHERE height > (select height from userTbl where Name = '김경호');

-- 서브쿼리의 행이 2개 이상, ANY
--170 또는 180이상
select name, height
from userTbl
where height >= ANY (select height from userTbl where addr = '경남');

-- SOME은 = 연산자랑 같이 사용
-- SOME = --> IN과 같다. 
select Name, height from userTbl
where height = some (SELECT height FROM userTbl where addr = '경남')

select Name, height from userTbl
where height IN (SELECT height FROM userTbl where addr = '경남')