use sqlDB;

--사용자가 총 구매한 이력을 userID로 나타내기, 합계를 내림차순으로
SELECT userID, sum(amount) as '합계'
FROM buyTbl
GROUP BY userID
ORDER BY sum(amount) DESC;

--모든 행의 갯수를 검색할 때 사용한다.
SELECT COUNT(*) FROM buyTbl;

--mobile1에 데이터가 없으면 카운트가 되지 않는다.
SELECT COUNT(mobile1) FROM userTbl;

--총 구매액
SELECT userID as '사용자', SUM(price*amount) as '총구매액'
from buyTbl
GROUP BY userID
ORDER BY SUM(price*amount) DESC;

--HAVING 활용 : GROUP BY 이후의 결과에서 필터링할 때 사용한다.
--where 절은 groupby 하기전에 실행이 되기 때문에 group 후에 검색할 수 없다.
SELECT userID as '사용자', SUM(price*amount) as '총구매액'
from buyTbl
GROUP BY userID
HAVING SUM(price*amount) > 1000
ORDER BY SUM(price*amount) DESC;