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


-- �÷����� ��ȣ���� ���ϱ� ���� ���̺��.�÷���
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

-- JOIN ���� ���� ����� �����ΰ�?
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
-- �� ���̺� ������ �� �� �ִ� ���� �ʵ尡 ���� ��� ���� �ʵ尡 ��Ȯ�� ��
SELECT first_name, department_id, department_name
FROM employees NATURAL JOIN departments;

----------------------------------------------------------
-- Theta JOIN
----------------------------------------------------------
-- ������ ������ ����ϵ� JOIN ������ = ������ �ƴ� ����� ����
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
������ �����ϴ� ¦�� ���� Ʃ�õ� NULL�� �����Ͽ� ��¿� ������Ű�� JOIN
��� ���ڵ带 ����� ���̺��� ��ġ�� ���� LEFT, RIGHT, FULL OUTER JOIN ���� ����
ORACLE�� ��� NULL�� ��µǴ� �����ʿ� (+)�� ��
*/

-- INNER JOIN ����
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

-- FULL OUTER JOIN : ���� ��� ���̺� ��¿� ����
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
                    
-- SELF JOIN : �ڽ��� FK�� �ڽ��� PK�� �����ϴ� ����� JOIN
-- �ڽ��� �� �� ȣ���ϹǷ� alies ����� �� �ۿ� ���� JOIN
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