-- P.01
SELECT employee_id ���, first_name �̸�, 
    last_name ��, department_name �μ���
FROM employees e, departments d
WHERE e.department_id = d.department_id
ORDER BY �μ���, ��� DESC;

-- P.02
SELECT employee_id ���, first_name �̸�, 
    salary �޿�, department_name �μ���,
    job_title �������
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND 
    e.job_id = j.job_id AND
    e.department_id IS NOT NULL
ORDER BY e.employee_id;

-- P.03
SELECT employee_id ���, first_name �̸�, 
    salary �޿�, department_name �μ���,
    job_title �������
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND 
    e.job_id = j.job_id
ORDER BY e.employee_id;