-- P.01
SELECT COUNT(*) havaMngCnt
FROM employees
WHERE manager_id IS NOT NULL;

-- P.02
SELECT max_salary �ְ��ӱ�, min_salary �����ӱ�,
    max_salary - min_salary "�ְ��ӱ� - �����ӱ�"
FROM jobs;

-- P.03
SELECT TO_CHAR(MAX(hire_date), 'YYYY"��"MM"��"DD"��"')
FROM employees;

-- P.04
SELECT ROUND(AVG(salary),2) ����ӱ�, MIN(salary), MAX(salary),
    department_id �μ����̵�
FROM employees
GROUP BY department_id
ORDER BY department_id DESC;

-- P.05
SELECT AVG(salary) ����ӱ�, MAX(salary) �ְ��ӱ�,
    MIN(salary) �����ӱ�, job_id �������̵�
FROM employees
GROUP BY job_id
ORDER BY �����ӱ� DESC, ����ӱ�;

-- P.06
SELECT TO_CHAR(MIN(hire_date), 'YYYY"��"MM"��"DD"��" DAY')
FROM employees;

-- P.07
SELECT department_id �μ�, ROUND(AVG(salary)) ����ӱ�,
    MIN(salary) �����ӱ�,
    ROUND(AVG(salary)-MIN(salary)) "����ӱ� - �����ӱ�"
FROM employees
GROUP BY department_id
    HAVING AVG(salary)-MIN(salary) < 2000
ORDER BY ����ӱ� - �����ӱ� DESC;

-- P.08
SELECT MAX(max_salary) - MIN(min_salary) AAA
FROM jobs
GROUP BY job_title
ORDER BY AAA DESC;

-- P.09
SELECT manager_id "�Ŵ��� ���̵�", ROUND(AVG(salary),1) ��ձ޿�,
    MIN(salary) �ּұ޿�, MAX(salary) �ִ�޿�
FROM employees
WHERE hire_date > '05/12/31'
GROUP BY manager_id
    HAVING AVG(salary) >= 5000
ORDER BY ��ձ޿� DESC;

-- P.10
SELECT first_name "�����", hire_date "�Ի���",
    case when hire_date < '02/12/31' then 'â�����'
         when hire_date > '02/12/31' and hire_date < '04/01/01' then '03���Ի�'
         when hire_date > '03/12/31' then '���������Ի�'
    end optDate,
    hire_date
FROM employees
ORDER BY hire_date;