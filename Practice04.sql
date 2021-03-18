-- P.01
SELECT COUNT(salary) "COUNT(SALARY)"
FROM employees
WHERE salary < (SELECT AVG(salary)
                FROM employees);
                
-- P.02
SELECT employee_id ������ȣ, first_name �̸�,
    salary �޿�, ROUND(tmp.avg) ��ձ޿�, max_salary �ִ�޿�
FROM employees e, jobs j, (SELECT AVG(salary) avg, MAX(salary) max
                           FROM employees) tmp
WHERE e.job_id = j.job_id AND
    salary >= tmp.avg AND salary <= tmp.max;

-- P.03
SELECT location_id ���þ��̵�, street_address �Ÿ���,
       postal_code �����ȣ, city ���ø�,
       state_province ��, country_id ������̵�
FROM locations
WHERE location_id = (SELECT location_id
                     FROM departments
                     WHERE department_id = (SELECT department_id
                                            FROM employees
                                            WHERE LOWER(first_name) = 'steven'
                                                AND LOWER(last_name) = 'king'));

-- P.04
SELECT employee_id ���, first_name �̸�, salary �޿�
FROM employees
WHERE salary < ANY (SELECT salary
                FROM employees
                WHERE job_id = 'ST_MAN')
ORDER BY salary DESC;

-- P.05
-- ������ ��
SELECT employee_id ������ȣ, first_name �̸�,
       salary �޿�, department_id �μ���ȣ
FROM employees
WHERE (salary, department_id) IN (SELECT MAX(salary), department_id
                        FROM employees
                        GROUP BY department_id);

-- ���̺� ����
SELECT e.employee_id ������ȣ, e.first_name �̸�,
       e.salary �޿�, e.department_id �μ���ȣ
FROM employees e, (SELECT MAX(salary) ms, department_id did
                 FROM employees
                 GROUP BY department_id) tmp
WHERE e.salary = tmp.ms AND e.department_id = tmp.did;

-- P.06
SELECT job_title ������, SUM(salary) "���� ����"
FROM employees e, jobs j
WHERE e.job_id = j.job_id
GROUP BY job_title
ORDER BY SUM(salary);

-- P.07
SELECT employee_id ������ȣ, first_name �̸�, salary �޿�
FROM employees e, (SELECT department_id did, ROUND(AVG(salary)) avg
                   FROM employees
                   GROUP BY department_id) tmp
WHERE e.department_id = tmp.did AND e.salary > tmp.avg;

-- P.08
SELECT tmp.rn RN, employee_id ���,
        first_name �̸�, salary �޿�, hire_date �Ի���
FROM employees e, (SELECT employee_id eid, ROW_NUMBER() OVER (ORDER BY hire_date) rn
                 FROM employees) tmp
WHERE tmp.rn > 10 AND tmp.rn < 16 AND e.employee_id = tmp.eid
ORDER BY hire_date;