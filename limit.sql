--출력하는 개수를 제한하는 LIMIT

use employees;

--사원 입사일을 오름차순으로 정렬
SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC;

--30만개의 데이터에서 5개만 나온다.(최고참 5명)
SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC
LIMIT 0, 10; --시작(offset), 추출갯수 (0 ~ 9)