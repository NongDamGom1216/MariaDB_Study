-- SELECT 컬럼 목록 FROM 테이블명--
-- 여기서 작성하면 자동 완성이 안됨 ㅠ
use sqlDB;

SELECT * FROM userTbl;

SELECT * FROM buyTbl;

SELECT *
FROM userTbl
WHERE name = '김경호';

SELECT userID, name
FROM userTbl
WHERE birthYear >= 1970 AND height >= 182;

SELECT userID, name
FROM userTbl
WHERE height BETWEEN 180 AND 183;

SELECT Name, addr
FROM userTbl
WHERE addr IN('경남', '전남', '경북');

SELECT Name, height
FROM userTbl
WHERE name LIKE '김%'; --김으로 시작--

SELECT Name, height
FROM userTbl
WHERE name LIKE '_범수'; --포함--

use employees;

SELECT first_name AS 이름, gender 성별 --as로 나타내는 이름 바꾸기, as는 생략가능--
FROM employees;

select *
from employees
where birth_date BETWEEN '1960-01-01' and '1960-12-31';