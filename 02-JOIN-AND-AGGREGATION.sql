DESC employees;
DESC departments;

select employees.employee_id, employees.department_id,
    departments.department_id, departments.department_name
from employees, departments
order by employees.employee_id;

select employees.employee_id, employees.first_name, employees.department_id,
    departments.department_id, departments.department_name
from employees, departments
where employees.department_id = departments.department_id;


-- 컬럼명의 모호성을 피하기 위해 테이블명.컬럼명
select emp.employee_id, first_name, emp.department_id,
    dept.department_id, department_name
from employees emp, departments dept
where emp.department_id = dept.department_id;

----------------------------------------------------------
-- INNER JOIN : simple Join
----------------------------------------------------------
SELECT * FROM employees;

SELECT first_name, emp.department_id, dept.department_id,
    department_name
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id;

-- JOIN 되지 않은 사원은 누구인가?
SELECT first_name. department_id
FROM employees
WHERE department_id IS NULL;

SELECT first_name, department_id, department_name
FROM employees JOIN departments
                    USING (department_id);

-- JOIN ON
SELECT first_name, emp.department_id,
    department_name
FROM employees emp JOIN departments dept
                ON (emp.department_id = dept.department_id);

-- Natural JOIN
-- 두 테이블에 조인을 할 수 있는 공통 필드가 있을 경우 공통 필드가 명확할 때
SELECT first_name, department_id, department_name
FROM employees NATURAL JOIN departments;

----------------------------------------------------------
-- Theta JOIN
----------------------------------------------------------
-- 임의의 조건을 사용하되 JOIN 조건이 = 조건이 아닌 경우의 조인
SELECT *
FROM jobs
WHERE job_id = 'AD_ASST';

SELECT first_name, salary
FROM employees emp, jobs j
WHERE j.job_id = 'AD_ASST' AND
    salary BETWEEN j.min_salary AND j.max_salary;

----------------------------------------------------------
-- OUTER JOIN
----------------------------------------------------------

/*
조건을 만족하는 짝이 없는 튜플도 NULL을 포함하여 출력에 참여시키는 JOIN
모든 레코드를 출력할 테이블의 위치에 따라서 LEFT, RIGHT, FULL OUTER JOIN 으로 구분
ORACLE의 경우 NULL이 출력되는 조건쪽에 (+)를 함
*/

-- INNER JOIN 참고
-- LEFT OUTER JOIN : ORACLE Ver
SELECT first_name, emp.department_id,
    dept.department_id, department_name
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id (+); -- LEFT OUTER JOIN

-- LEFT OUTER JOIN : ANSI Ver
SELECT first_name, emp.department_id,
    dept.department_id, department_name
FROM employees emp LEFT OUTER JOIN departments dept
                    ON emp.department_id = dept.department_id;

-- RIGHT OUTER JOIN : ORACLE Ver
SELECT first_name, emp.department_id,
    dept.department_id, department_name
FROM employees emp, departments dept
WHERE emp.department_id (+) = dept.department_id;

-- RIGHT OUTER JOIN : ANSI Ver
SELECT first_name, emp.department_id,
    dept.department_id, department_name
FROM employees emp RIGHT OUTER JOIN departments dept
                    ON emp.department_id = dept.department_id;

-- FULL OUTER JOIN : 양쪽 모두 테이블 출력에 참여
/*
SELECT first_name, emp.department_id,
    dept.department_id, department_name
FROM employees emp, departments dept
WHERE emp.department_id (+) = dept.department_id (+);
*/

SELECT first_name, emp.department_id,
    dept.department_id, department_name
FROM employees emp FULL OUTER JOIN departments dept
                    ON emp.department_id = dept.department_id;
                    
-- SELF JOIN : 자신의 FK가 자신의 PK를 참조하는 방식의 JOIN
-- 자신을 두 번 호출하므로 alies 사용할 수 밖에 없는 JOIN
SELECT emp.employee_id, emp.first_name,
    emp.manager_id,
    man.first_name
FROM employees emp, employees man
WHERE emp.manager_id = man.manager_id;

-- ANSI SQL
SELECT emp.employee_id, emp.first_name,
    emp.manager_id,
    man.first_name
FROM employees emp JOIN employees man
                    ON emp.manager_id = man.manger_id;
                    
----------------------------------------------
-- Aggregation (집계)
----------------------------------------------
-- 여러 개의 값을 집계하여 하나의 결과 값을 산출

-- count : 갯수 세기 함수
-- employees 테이블은 몇 개의 레코드를 가지고 있는가?
SELECT COUNT(*)
FROM employees;

-- 특정 컬럼을 명시함녀 NULL인 것은 무시
SELECT COUNT(commission_pct)
FROM employees;
-- 위와 동일
SELECT COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL;

-- 합계 함수 : SUM
-- 급여의 총 합?
SELECT SUM(salary)
FROM employees;

-- 평균 함수 : AVG
-- 평균 급여 선정
SELECT AVG(salary)
FROM employees;

-- 사원들이 받는 평균 커미션 비율
SELECT AVG(commission_pct)
FROM employees;
-- NULL 데이터는 집계에서 배제
SELECT AVG(nvl(commission_pct, 0))
FROM employees;

-- NULL이 포합된 집계는 NULL 값을 포함할 것인지 아닌지를 결정하고 집계

-- salary의 최솟값, 최댓값, 평균값, 중앙값
SELECT MIN(salary) 최소값, MAX(salary) 최대값,
    AVG(salary) 평균값, MEDIAN(salary) 중앙값
FROM employees;

-- 흔히 범하는 오류
-- 부서의 아이디, 급여 평균을 출력하고자 할 때
/*
SELECT department_id, AVG(salary)
FROM employees; -- ERROR
*/


-- 만약에 부서별 평균 연봉을 구하려면?
-- 부서별 GROUP을 지어준 데이터를 대상을 집계함수 수행
SELECT department_id, ROUND(AVG(salary), 2)
FROM employees                                                                                      
GROUP BY department_id                                                                                                                                              
ORDER BY department_id;                                 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
-- 집계함수를 사용한 SELECT 컬럼 목록에는
-- 집계에 참여한 필드, 집계함수만 올 수 있다
SELECT department_id, ROUND(AVG(salary), 2) sal_avg -- 별칭사용
FROM employees
GROUP BY department_id
ORDER BY sal_avg DESC;

-- 부서별 평균 급여를 산출 평균 급여가 7000이상인 부서를 출력
/*
SELECT department_id, AVG(salary)
FROM employees
WHERE AVG(salary) >= 7000 -- 이 시점에서는 ACG(salary) 가 수행되지 않은 상태
GROUP BY department_id;
*/
-- ERROR : 집계 작업이 일어나기 전에 WHERE 절 수행

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
    HAVING AVG(salary) >= 7000      -- GROUP BY에 조건을 부여할 때
ORDER BY department_id;

------------------------------------------------------------------



-- 서브쿼리 연습
-- 각 부서별 최고 급여를 받는 사원 출력
SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id;

-- 1. 조건절에서 비교
SELECT department_id, employee_id, first_name, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MAX(salary)
                                    FROM employees
                                    GROUP BY department_id)
ORDER BY department_id;

-- SUBQUERY : 임시테이블 생성
-- 2. 부서별 최고 급여 테이블을 임시로 생성해서 테이블과 조인하는 방법
SELECT emp.department_id, employee_id, first_name, emp.salary
FROM employees emp, (SELECT department_id, MAX(salary) salary
                    FROM employees
                    GROUP BY department_id) sal
WHERE emp.department_id = sal.department_id AND
    emp.salary = sal.salary
ORDER BY emp.department_id;

-- 3.Correlated Query 활용
SELECT emp.department_id, employee_id, first_name, emp.salary
FROM employees emp
WHERE emp.salary = (SELECT MAX(salary)
                    FROM employees
                    WHERE department_id = emp.department_id)
ORDER BY department_id;


-------------------------------
-- TOP K Query
-------------------------------
-- ORACLE은 질의 수행 결과의 행번호를 확인할 수 있는 가상 컬럼 rownum을 지원

-- 2007년 입사자 중에서 급여 순위 5위까지 출력
SELECT rownum, first_name, salary
FROM employees;

SELECT rownum, first_name, salary
FROM employees
WHERE hire_date LIKE '07%' AND rownum <= 10;

SELECT rownum, first_name, salary
FROM employees
WHERE hire_date LIKE '07%' AND rownum <= 5
ORDER BY salary DESC;       --rownum이 정해진 이후 정렬을 수행

-- TOP K 쿼리
SELECT rownum, first_name, salary
FROM (SELECT * FROM employees
        WHERE hire_date LIKE '07%'
        ORDER BY salary DESC)
WHERE rownum <= 5;

-- SET 집합
-- UNION 합집합 : 중복제거, UNION ALL 합집합 : 중복제거 안함
-- INTERSECT 교집합, MINUS 차집합
SELECT first_name, salary, hire_date FROM employees WHERE hire_date < '05/01/01';
SELECT first_name, salary, hire_date FROM employees WHERE salary > 12000;

-- 교집합
SELECT first_name, salary, hire_date FROM employees WHERE hire_date < '05/01/01'
INTERSECT
SELECT first_name, salary, hire_date FROM employees WHERE salary > 12000;
-- 위와 동일
SELECT first_name, salary, hire_date FROM employees
WHERE hire_date < '05/01/01' AND salary > 12000;

-- 합집합
SELECT first_name, salary, hire_date FROM employees WHERE hire_date < '05/01/01'
UNION
SELECT first_name, salary, hire_date FROM employees WHERE salary > 12000;
-- 위와 동일
SELECT first_name, salary, hire_date FROM employees
WHERE hire_date < '05/01/01' OR salary > 12000;

-- 차집합
SELECT first_name, salary, hire_date FROM employees WHERE hire_date < '05/01/01'
MINUS
SELECT first_name, salary, hire_date FROM employees WHERE salary > 12000;

-- 입사일 05/01/01 이전인 사람들 중 급여가 12000 이하인 직원
SELECT first_name, salary, hire_date FROM employees
WHERE hire_date < '05/01/01' AND NOT(salary > 12000);