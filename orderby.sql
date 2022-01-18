--오름차순 ASC (디폴트값)
--내림차순 DESC

use sqlDB;

SELECT Name, mDate
FROM userTbl
ORDER BY mDate DESC;

--height로 내림차순 정렬하고, height가 같을 때는 name으로 오름차순
SELECT name, height
from userTbl
ORDER BY height DESC, name ASC; --height이 1차 기준, name이 2차 기준(asc는 생략 가능)