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
                    
----------------------------------------------
-- Aggregation (����)
----------------------------------------------
-- ���� ���� ���� �����Ͽ� �ϳ��� ��� ���� ����

-- count : ���� ���� �Լ�
-- employees ���̺��� �� ���� ���ڵ带 ������ �ִ°�?
SELECT COUNT(*)
FROM employees;

-- Ư�� �÷��� ����Գ� NULL�� ���� ����
SELECT COUNT(commission_pct)
FROM employees;
-- ���� ����
SELECT COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL;

-- �հ� �Լ� : SUM
-- �޿��� �� ��?
SELECT SUM(salary)
FROM employees;

-- ��� �Լ� : AVG
-- ��� �޿� ����
SELECT AVG(salary)
FROM employees;

-- ������� �޴� ��� Ŀ�̼� ����
SELECT AVG(commission_pct)
FROM employees;
-- NULL �����ʹ� ���迡�� ����
SELECT AVG(nvl(commission_pct, 0))
FROM employees;

-- NULL�� ���յ� ����� NULL ���� ������ ������ �ƴ����� �����ϰ� ����

-- salary�� �ּڰ�, �ִ�, ��հ�, �߾Ӱ�
SELECT MIN(salary) �ּҰ�, MAX(salary) �ִ밪,
    AVG(salary) ��հ�, MEDIAN(salary) �߾Ӱ�
FROM employees;

-- ���� ���ϴ� ����
-- �μ��� ���̵�, �޿� ����� ����ϰ��� �� ��
/*
SELECT department_id, AVG(salary)
FROM employees; -- ERROR
*/


-- ���࿡ �μ��� ��� ������ ���Ϸ���?
-- �μ��� GROUP�� ������ �����͸� ����� �����Լ� ����
SELECT department_id, ROUND(AVG(salary), 2)
FROM employees                                                                                      
GROUP BY department_id                                                                                                                                              
ORDER BY department_id;                                 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
-- �����Լ��� ����� SELECT �÷� ��Ͽ���
-- ���迡 ������ �ʵ�, �����Լ��� �� �� �ִ�
SELECT department_id, ROUND(AVG(salary), 2) sal_avg -- ��Ī���
FROM employees
GROUP BY department_id
ORDER BY sal_avg DESC;

-- �μ��� ��� �޿��� ���� ��� �޿��� 7000�̻��� �μ��� ���
/*
SELECT department_id, AVG(salary)
FROM employees
WHERE AVG(salary) >= 7000 -- �� ���������� ACG(salary) �� ������� ���� ����
GROUP BY department_id;
*/
-- ERROR : ���� �۾��� �Ͼ�� ���� WHERE �� ����

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
    HAVING AVG(salary) >= 7000      -- GROUP BY�� ������ �ο��� ��
ORDER BY department_id;

------------------------------------------------------------------



-- �������� ����
-- �� �μ��� �ְ� �޿��� �޴� ��� ���
SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id;

-- 1. ���������� ��
SELECT department_id, employee_id, first_name, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MAX(salary)
                                    FROM employees
                                    GROUP BY department_id)
ORDER BY department_id;

-- SUBQUERY : �ӽ����̺� ����
-- 2. �μ��� �ְ� �޿� ���̺��� �ӽ÷� �����ؼ� ���̺�� �����ϴ� ���
SELECT emp.department_id, employee_id, first_name, emp.salary
FROM employees emp, (SELECT department_id, MAX(salary) salary
                    FROM employees
                    GROUP BY department_id) sal
WHERE emp.department_id = sal.department_id AND
    emp.salary = sal.salary
ORDER BY emp.department_id;

-- 3.Correlated Query Ȱ��
SELECT emp.department_id, employee_id, first_name, emp.salary
FROM employees emp
WHERE emp.salary = (SELECT MAX(salary)
                    FROM employees
                    WHERE department_id = emp.department_id)
ORDER BY department_id;


-------------------------------
-- TOP K Query
-------------------------------
-- ORACLE�� ���� ���� ����� ���ȣ�� Ȯ���� �� �ִ� ���� �÷� rownum�� ����

-- 2007�� �Ի��� �߿��� �޿� ���� 5������ ���
SELECT rownum, first_name, salary
FROM employees;

SELECT rownum, first_name, salary
FROM employees
WHERE hire_date LIKE '07%' AND rownum <= 10;

SELECT rownum, first_name, salary
FROM employees
WHERE hire_date LIKE '07%' AND rownum <= 5
ORDER BY salary DESC;       --rownum�� ������ ���� ������ ����

-- TOP K ����
SELECT rownum, first_name, salary
FROM (SELECT * FROM employees
        WHERE hire_date LIKE '07%'
        ORDER BY salary DESC)
WHERE rownum <= 5;

-- SET ����
-- UNION ������ : �ߺ�����, UNION ALL ������ : �ߺ����� ����
-- INTERSECT ������, MINUS ������
SELECT first_name, salary, hire_date FROM employees WHERE hire_date < '05/01/01';
SELECT first_name, salary, hire_date FROM employees WHERE salary > 12000;

-- ������
SELECT first_name, salary, hire_date FROM employees WHERE hire_date < '05/01/01'
INTERSECT
SELECT first_name, salary, hire_date FROM employees WHERE salary > 12000;
-- ���� ����
SELECT first_name, salary, hire_date FROM employees
WHERE hire_date < '05/01/01' AND salary > 12000;

-- ������
SELECT first_name, salary, hire_date FROM employees WHERE hire_date < '05/01/01'
UNION
SELECT first_name, salary, hire_date FROM employees WHERE salary > 12000;
-- ���� ����
SELECT first_name, salary, hire_date FROM employees
WHERE hire_date < '05/01/01' OR salary > 12000;

-- ������
SELECT first_name, salary, hire_date FROM employees WHERE hire_date < '05/01/01'
MINUS
SELECT first_name, salary, hire_date FROM employees WHERE salary > 12000;

-- �Ի��� 05/01/01 ������ ����� �� �޿��� 12000 ������ ����
SELECT first_name, salary, hire_date FROM employees
WHERE hire_date < '05/01/01' AND NOT(salary > 12000);