-- ���� ���� ���� � ���̺��� �ִ���?

select * from tab;

-- ���̺� ���� Ȯ�� DESC

desc employees;

-- ��� �÷� Ȯ��
-- ���̺� ���ǵ� �÷��� �������
select * from employees;

desc departments;

select * from departments;

-- first_name, ��ȭ��ȣ, �Ի���, �޿�
select first_name, phone_number, hire_date, salary
from employees;

-- first_name, last_name, salary, ��ȭ��ȣ, �Ի���
select first_name, last_name, salary, phone_number, hire_date
from employees;

-- ������� : �⺻���� ��� ���� ��� ����
select 3.14159 * 3 * 3
from employees; -- ��� ���ڵ带 �ҷ��� ������� ����

select 3.14159 * 3 * 3
from dual;  -- �ܼ� ������ dual(���� ���̺�) ���

select first_name, salary, salary*12
from employees;

--
select job_id * 12
from employees;

desc employees;

-- ����� �̸�, slalary, commission_pct ���
select first_name, salary, commission_pct
from employees;

-- ���Ŀ� null�� ���ԵǾ� ������ ����� null
select first_name, salary, salary + (salary * commission_pct)
from employees;

-- nvl �Լ� : null -> �ٸ� �⺻ ������ ġȯ
select first_name, salary + (salary * nvl(commission_pct, 0))
from employees;

-- ���ڿ��� ����(||)
-- ��Ī(Alies)
-- as ���� ����
-- ����, Ư�����ڰ� ���ԵǾ� ������ ��Ī�� ""�� ����
select first_name || ' ' || last_name as " FULL NAME"
from employees;

/*
�̸�
�Ի���
��ȭ��ȣ
�޿�
����
*/

select first_name || ' ' || last_name as "�̸�", 
    hire_date �Ի���,
    phone_number ��ȭ��ȣ,
    salary �޿�,
    salary * 12 ����
from employees;

------------
-- where : ���ǿ� �´� ���ڵ� ������ ���� ���� ��
/*
�޿��� 15000 �̻��� ������� �̸��� ����
07/01/01�� ���� �Ի���� �̸��� �Ի���
�̸��� 'Lex'�� ����� ������ �Ի���, �μ� ID
�μ� ID�� 10�� ����� ���
*/

-- �޿��� 15000�̻��� ������� �̸��� ����
select first_name || ' ' || last_name �̸�, salary * 12 ����
from employees
where salary >= 15000;

-- �޿��� 15000 �̻��� ������� �̸��� ����
select first_name || ' ' || last_name �̸�, hire_date �Ի���
from employees
where hire_date >= '07/01/01';

-- �̸��� 'Lex'�� ����� ������ �Ի���, �μ� ID
select first_name || ' ' || last_name �̸�, salary*12 ����, hire_date �Ի���, department_id �μ���
from employees
where first_name = 'Lex';

-- �μ� ID�� 10�� ����� ���
select first_name || ' ' || last_name �̸�
from employees
where department_id = 10;

-- Like ����
-- % ������ ���� ���ڿ�
-- _ 1���� ���� ����
-- �̸��� am�� ������ ��� ����� %
select first_name �̸�, salary ����
from employees
where first_name like '%am%';

-- �̸��� �� ��° ���ڰ� a�� ����� ���
select first_name �̸�, salary ����
from employees
where first_name like '_a%';

/*
�޿��� 14000 �����̰ų� 17000 �̻��� ����� �̸��� �޿�
�μ� ID�� 90�� ��� �� �޿��� 20000 �̻��� ���
*/

-- �޿��� 14000 �����̰ų� 17000 �̻��� ����� �̸��� �޿�
select first_name �̸�, salary ����
from employees
where salary <= 14000 or salary >= 17000;

-- �μ� ID�� 90�� ��� �� �޿��� 20000 �̻��� ���
select first_name �̸�, salary ����
from employees
where department_id = 90 and salary >= 20000;

-- �޿��� 14000 �̻� 17000������ ����� �̸��� �޿�
select first_name �̸�, salary ����
from employees
where salary >= 14000 and salary <= 17000;

select first_name �̸�, salary ����
from employees
where salary between 14000 and 17000;

-- �Ի����� 07/01/01 ~ 07/12/31 ������ �ִ� ����� ���
select first_name �̸�
from employees
where hire_date >= '07/01/01' and hire_date <= '07/12/31';

select first_name �̸�
from employees
where hire_date between '07/01/01' and '07/12/31';

/*
�μ� ID �� 10, 20, 40�� ����� ���
MANAGER ID�� 100, 200, 147�� ����� ���
IN ������ �̿�
�� ������ ���� ���� IN �������� ������ ��?
*/

-- �μ� ID �� 10, 20, 40�� ����� ���
select *
from employees
where department_id=10 or department_id=20 or department_id=40;

select *
from employees
where department_id in (10, 20, 40);

-- MANAGER ID�� 100, 200, 147�� ����� ���
select *
from employees
where manager_id=100 or manager_id=200 or manager_id=147;

select *
from employees
where manager_id in (100, 200, 147);

-- Ŀ�̼��� ���� �ʴ� ����� ���
select first_name, commission_pct
from employees
where commission_pct is null;

-- Ŀ�̼��� �޴� ����� ���
select first_name, commission_pct
from employees
where commission_pct is not null;

/*
�μ���ȣ�� ������������ �����ϰ� �μ���ȣ, �޿�, �̸��� ���
�޿��� 10000 �̻��� ������ �̸��� �޿� ������������ ���
�μ���ȣ, �޿�, �̸� ������ ����ϵ� �μ���ȣ ��������, �޿� ������������ ���
*/

-- �μ���ȣ�� ������������ �����ϰ� �μ���ȣ, �޿�, �̸��� ���

select first_name �̸�, salary �޿�, department_id �μ���ȣ
from employees
order by department_id;

-- �޿��� 10000 �̻��� ������ �̸��� �޿� ������������ ���

select first_name �̸�, salary �޿�
from employees
where salary >= 10000
order by salary desc;

-- �μ���ȣ, �޿�, �̸� ������ ����ϵ� �μ���ȣ ��������, �޿� ������������ ���
select department_id �μ���ȣ, salary �޿�, first_name �̸�
from employees
order by department_id, salary desc;

-----------------
-- ������ �Լ�
-- ���� ���ڵ忡 ����Ǵ� �Լ�
-----------------

-- ���ڿ� ���� �� �Լ�
select first_name, last_name, concat(first_name, concat(' ', last_name)) name,
    first_name || ' ' || last_name name2,
    initcap(first_name || ' ' || last_name) name3,  -- �� �ܾ��� ù���ڸ� �빮�ڷ�
    lower(first_name), -- ���� �ҹ���
    upper(first_name), -- ���� �빮��
    lpad(first_name, 10, '*'), -- 10���� ��� ũ�� ����, ���� ���ڸ��� *�� ä��
    rpad(first_name, 10, '*')  -- 10���� ��� ũ�� ����, ������ ���ڸ��� *�� ä��
from employees;

-- first_name�� am�� ���Ե� ����� �̸�
select first_name
from employees
where first_name like '%am%';

select first_name
from employees;

-- upper, lower�� ��ҹ��� ���� ���� �˻��� �� ����
select first_name
from employees
where lower(first_name) like '%am%';

-- ����
select ltrim('   Oracle   ', '*****Database*****'),     -- ���ʿ� �ִ� �� ������ ������
    rtrim('   Oracle   '),      -- �����ʿ� �ִ� ������ ������
    trim('*' from '*****Database*****'),      -- ���ڿ� ������ Ư�����ڸ� ����
    substr('Oracle Database', 8, 8),      -- ���ڿ� 8��° ���ں��� 8���� ����
    substr('Oracle Database', -8, 8)      -- �ڿ��� 8��° ���ں��� 8���ڸ� ����
from dual;

-- ��ġ�� ������ �Լ�
select abs(-3.14),  -- ����
    ceil(3.14),  -- �ø�(õ��)
    floor(3.14),    -- ����(�ٴ�)
    mod(7, 3),  -- �������� ��
    power(2, 4), -- 2�� 4����
    round(3.5), -- �Ҽ��� ù°�ڸ� �ݿø�
    round(3.5678, 2),   -- �Ҽ��� ��°�ڸ� �ݿø�
    trunc(3.56),    -- �Ҽ��� ����
    trunc(3.5678, 2),   -- �Ҽ��� ��°�ڸ� ����
    sign(-10)   -- ��ȣ �Լ�(����: -1, 0, ���: 1)
from dual;

-- ��¥�� ������ �Լ�

select sysdate from dual;   -- �ý������κ��� ��¥�� �ҷ��� ���, �ý��� ���� ���̺� 1��

select sysdate from employees;   -- ���̺� ���� ���ڵ� ������ŭ ���

select sysdate, -- �ý��� ��¥
    add_months(sysdate, 2), -- ���ú��� 2���� ��
    months_between(to_date('1999-12-31', 'yyyy-mm-dd'), sysdate),   -- '1999-12-31'���� ���ñ��� �� ������ ��������
    next_day(sysdate, 6),    -- ���� ���� ù��° �ݿ���
    round(sysdate, 'month'),    -- ��¥ �ݿø�
    trunc(sysdate, 'month')
from dual;

-- employees ������� �ټ� ��
select first_name �̸�, hire_date �Ի���, round(months_between(sysdate, hire_date)) months
from employees;

-------------
-- ��ȯ�Լ�
-------------

/*
to_char(o, fmt) : number or date -> varchar
to_number(s, fmt) : varchar -> number
to_date(s, fmt) : varchar -> date
*/

-- to_char
select first_name �̸�, hire_date �Ի���,
    to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss') �Ի���
from employees;

-- ���� �ð��� ��-��-�� ����/���� ��:��:�� ����

select sysdate,
    to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
from dual;

select first_name �̸�, to_char(salary * 12, '$999,999.99') ����
from employees;

-- to_number : ���ڿ� -> ���� ����
select to_number('$1,500,500.90', '$999,999,999.99')
from dual;

-- to_date : ��¥ ���¸� ���� ���ڿ� -> date
select '2021-03-16 15:07', to_date('2021-03-16 15:07', 'yyyy-mm-dd hh24:mi')
from dual;

/*
��¥ ����
-- Date +- number : ��¥�� �� ���� ���ϰų� ���� -> date
-- Date - Date : �� ��¥ ������ �� ��
-- Date + number / 24 : ��¥�� �ð��� ���ϰų� �� �� number/24�� +-
*/

select to_char(sysdate, 'yyyy-mm-dd hh24:mi'),
    to_char(sysdate - 8, 'yyyy-mm-dd hh24:mi'), -- 8�� ��
    to_char(sysdate + 8, 'yyyy-mm-dd hh24:mi'), -- 8�� ��
    sysdate - to_date('1999-12-31', 'yyyy-mm-dd'),  -- 1999-12-31 ���ķ� ��ĥ�� ��������?
    to_char(sysdate + 12/24, 'yyyy-mm-dd hh24:mi') -- ���� �ð����κ��� 12�ð� ��
from dual;

-- null ����
-- null�� �����꿡 ���ԵǸ� null
-- null ó���� �ʿ��� ���
select first_name �̸�, salary �޿�,
    nvl(salary * commission_pct, 0) commision   -- nvl : ù��° ���ڰ� null�� ��� �ι�° ���ڰ��� ���
from employees;

select first_name �̸�, salary �޿�,
    nvl2(commission_pct, salary * commission_pct, 0) commision
    -- nvl2 : ù��° ���ڰ� not null�� ��� �ι�° ���ڸ�, null�� ��� ����° ���ڸ� ���
from employees;

-- case function
-- ���ʽ� ����
-- ad���� ���� -> 20%, sa���� ���� 10%, it���� ���� 8%, �������� 3% ����

select first_name �̸�, job_id ����,
    substr(job_id, 1, 2)
from employees;

select first_name �̸�, substr(job_id, 1, 2) ����,
    case substr(job_id, 1, 2)
        when 'AD' then salary * 0.2
        when 'SA' then salary * 0.1
        when 'IT' then salary * 0.08
        else salary * 0.03
    end ���ʽ�
from employees;

-- decode
select first_name job_id, substr(job_id, 1, 2) ����, salary,
    decode(substr(job_id, 1, 2),    -- ���� ��
        'AD', salary * 0.2,
        'SA', salary * 0.1,
        'IT', salary * 0.08,
        salary * 0.08) ���ʽ�
from employees;

-----------
-- ��������
-----------
/*
���� �̸�, �μ�, �� ���
���� �ڵ�� ����, ������ ���� �׷� �̸� ���
�μ��ڵ� 10~30 : 'A-GROUP'
�μ��ڵ� 40~50 : 'B-GROUP'
�μ��ڵ� 60~100 : 'C-GROUP'
������ : 'REMAINDER'
*/

select first_name �̸�, department_id �μ��ڵ�,
    case
        when department_id >= 10 and department_id <= 30 then 'A-GROUP'
        when department_id <= 50 then 'B-GROUP'
        when department_id <= 100 then 'C-GROUP'
        else 'REMAINDER'
    end team
from employees
order by team;

-------------------------------------------------------------------------------
-- Practice01.SQL_�ǽ�����_�⺻
-------------------------------------------------------------------------------
-- P.01
SELECT first_name||' '||last_name �̸�, salary ����, phone_number ��ȭ��ȣ, hire_date �Ի���
FROM employees
ORDER BY hire_date;

-- P.02
SELECT job_title �����̸�, max_salary �ְ����
FROM jobs
ORDER BY max_salary desc;

-- P.03
SELECT first_name||' '||last_name �̸�, manager_id "�Ŵ��� ���̵�",
    commission_pct "Ŀ�̼� ����", salary ����
FROM employees
WHERE manager_id IS NOT NULL AND
    commission_pct IS NULL AND salary > 3000;
    
-- P.04
SELECT job_title �����̸�, max_salary �ְ����
FROM jobs
WHERE max_salary >= 10000
ORDER BY max_salary DESC;

-- P.05
SELECT first_name �̸�, salary ����,  nvl(commission_pct, 0) Ŀ�̼��ۼ�Ʈ
FROM employees
WHERE salary >= 10000 AND salary < 14000
ORDER BY salary DESC;

-- P.06
SELECT first_name �̸�, salary ����, TO_CHAR(hire_date, 'YYYY-MM') �Ի���, department_id �μ���ȣ
FROM employees
WHERE department_id IN (10, 90, 100);

-- P.07
SELECT first_name �̸�, salary ����
FROM employees
WHERE LOWER(first_name) LIKE '%s%';

-- P.08
SELECT department_name �μ���
FROM departments
ORDER BY LENGTH(department_name) DESC;

-- P.09
SELECT UPPER(country_name) �����
FROM countries
ORDER BY country_name;

-- P.10
SELECT first_name �̸�, REPLACE(phone_number, '.', '-') ��ȭ��ȣ, hire_date �Ի���
FROM employees
WHERE hire_date < '03/12/31';

