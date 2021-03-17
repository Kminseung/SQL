-- P.01
SELECT COUNT(*) havaMngCnt
FROM employees
WHERE manager_id IS NOT NULL;

-- P.02
SELECT max_salary 최고임금, min_salary 최저임금,
    max_salary - min_salary "최고임금 - 최저임금"
FROM jobs;

-- P.03
SELECT TO_CHAR(MAX(hire_date), 'YYYY"년"MM"월"DD"일"')
FROM employees;

-- P.04
SELECT ROUND(AVG(salary),2) 평균임금, MIN(salary), MAX(salary),
    department_id 부서아이디
FROM employees
GROUP BY department_id
ORDER BY department_id DESC;

-- P.05
SELECT AVG(salary) 평균임금, MAX(salary) 최고임금,
    MIN(salary) 최저임금, job_id 업무아이디
FROM employees
GROUP BY job_id
ORDER BY 최저임금 DESC, 평균임금;

-- P.06
SELECT TO_CHAR(MIN(hire_date), 'YYYY"년"MM"월"DD"일" DAY')
FROM employees;

-- P.07
SELECT department_id 부서, ROUND(AVG(salary)) 평균임금,
    MIN(salary) 최저임금,
    ROUND(AVG(salary)-MIN(salary)) "평균임금 - 최저임금"
FROM employees
GROUP BY department_id
    HAVING AVG(salary)-MIN(salary) < 2000
ORDER BY 평균임금 - 최저임금 DESC;

-- P.08
SELECT MAX(max_salary) - MIN(min_salary) AAA
FROM jobs
GROUP BY job_title
ORDER BY AAA DESC;

-- P.09
SELECT manager_id "매니저 아이디", ROUND(AVG(salary),1) 평균급여,
    MIN(salary) 최소급여, MAX(salary) 최대급여
FROM employees
WHERE hire_date > '05/12/31'
GROUP BY manager_id
    HAVING AVG(salary) >= 5000
ORDER BY 평균급여 DESC;

-- P.10
SELECT first_name "사원명", hire_date "입사일",
    case when hire_date < '02/12/31' then '창립멤버'
         when hire_date > '02/12/31' and hire_date < '04/01/01' then '03년입사'
         when hire_date > '03/12/31' then '상장이후입사'
    end optDate,
    hire_date
FROM employees
ORDER BY hire_date;