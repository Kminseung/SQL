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