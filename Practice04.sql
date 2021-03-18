-- P.01
SELECT COUNT(salary) "COUNT(SALARY)"
FROM employees
WHERE salary < (SELECT AVG(salary)
                FROM employees);
                
-- P.02
SELECT employee_id 직원번호, first_name 이름,
    salary 급여, ROUND(tmp.avg) 평균급여, max_salary 최대급여
FROM employees e, jobs j, (SELECT AVG(salary) avg, MAX(salary) max
                           FROM employees) tmp
WHERE e.job_id = j.job_id AND
    salary >= tmp.avg AND salary <= tmp.max;

-- P.03
SELECT location_id 도시아이디, street_address 거리명,
       postal_code 우편번호, city 도시명,
       state_province 주, country_id 나라아이디
FROM locations
WHERE location_id = (SELECT location_id
                     FROM departments
                     WHERE department_id = (SELECT department_id
                                            FROM employees
                                            WHERE LOWER(first_name) = 'steven'
                                                AND LOWER(last_name) = 'king'));

-- P.04
SELECT employee_id 사번, first_name 이름, salary 급여
FROM employees
WHERE salary < ANY (SELECT salary
                FROM employees
                WHERE job_id = 'ST_MAN')
ORDER BY salary DESC;

-- P.05
-- 조건절 비교
SELECT employee_id 직원번호, first_name 이름,
       salary 급여, department_id 부서번호
FROM employees
WHERE (salary, department_id) IN (SELECT MAX(salary), department_id
                        FROM employees
                        GROUP BY department_id);

-- 테이블 조인
SELECT e.employee_id 직원번호, e.first_name 이름,
       e.salary 급여, e.department_id 부서번호
FROM employees e, (SELECT MAX(salary) ms, department_id did
                 FROM employees
                 GROUP BY department_id) tmp
WHERE e.salary = tmp.ms AND e.department_id = tmp.did;

-- P.06
SELECT job_title 업무명, SUM(salary) "연봉 총합"
FROM employees e, jobs j
WHERE e.job_id = j.job_id
GROUP BY job_title
ORDER BY SUM(salary);

-- P.07
SELECT employee_id 직원번호, first_name 이름, salary 급여
FROM employees e, (SELECT department_id did, ROUND(AVG(salary)) avg
                   FROM employees
                   GROUP BY department_id) tmp
WHERE e.department_id = tmp.did AND e.salary > tmp.avg;

-- P.08
SELECT tmp.rn RN, employee_id 사번,
        first_name 이름, salary 급여, hire_date 입사일
FROM employees e, (SELECT employee_id eid, ROW_NUMBER() OVER (ORDER BY hire_date) rn
                 FROM employees) tmp
WHERE tmp.rn > 10 AND tmp.rn < 16 AND e.employee_id = tmp.eid
ORDER BY hire_date;