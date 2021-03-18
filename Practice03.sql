-- P.01
SELECT employee_id 사번, first_name 이름, 
    last_name 성, department_name 부서명
FROM employees e, departments d
WHERE e.department_id = d.department_id
ORDER BY 부서명, 사번 DESC;

-- P.02
SELECT employee_id 사번, first_name 이름, 
    salary 급여, department_name 부서명,
    job_title 현재업무
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND 
    e.job_id = j.job_id AND
    e.department_id IS NOT NULL
ORDER BY e.employee_id;

-- P.03
SELECT employee_id 사번, first_name 이름, 
    salary 급여, department_name 부서명,
    job_title 현재업무
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND 
    e.job_id = j.job_id
ORDER BY e.employee_id;