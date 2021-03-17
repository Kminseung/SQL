-- 현재 계정 내에 어떤 테이블이 있는지?

select * from tab;

-- 테이블 구조 확인 DESC

desc employees;

-- 모든 컬럼 확인
-- 테이블에 정의된 컬럼의 순서대로
select * from employees;

desc departments;

select * from departments;

-- first_name, 전화번호, 입사일, 급여
select first_name, phone_number, hire_date, salary
from employees;

-- first_name, last_name, salary, 전화번호, 입사일
select first_name, last_name, salary, phone_number, hire_date
from employees;

-- 산술연산 : 기본적인 산술 연산 사용 가능
select 3.14159 * 3 * 3
from employees; -- 모든 레코드를 불러와 산술연산 수행

select 3.14159 * 3 * 3
from dual;  -- 단순 계산식은 dual(가상 테이블) 사용

select first_name, salary, salary*12
from employees;

--
select job_id * 12
from employees;

desc employees;

-- 사원의 이름, slalary, commission_pct 출력
select first_name, salary, commission_pct
from employees;

-- 계산식에 null이 포함되어 있으면 결과는 null
select first_name, salary, salary + (salary * commission_pct)
from employees;

-- nvl 함수 : null -> 다른 기본 값으로 치환
select first_name, salary + (salary * nvl(commission_pct, 0))
from employees;

-- 문자열의 연결(||)
-- 별칭(Alies)
-- as 생략 가능
-- 공백, 특수문자가 포함되어 있으면 별칭을 ""로 묶음
select first_name || ' ' || last_name as " FULL NAME"
from employees;

/*
이름
입사일
전화번호
급여
연봉
*/

select first_name || ' ' || last_name as "이름", 
    hire_date 입사일,
    phone_number 전화번호,
    salary 급여,
    salary * 12 연봉
from employees;

------------
-- where : 조건에 맞는 레코드 추출을 위한 조건 비교
/*
급여가 15000 이상인 사원들의 이름과 연봉
07/01/01일 이후 입사들의 이름과 입사일
이름이 'Lex'인 사원의 연봉과 입사일, 부서 ID
부서 ID가 10인 사원의 명단
*/

-- 급여가 15000이상인 사원들의 이름과 연봉
select first_name || ' ' || last_name 이름, salary * 12 연봉
from employees
where salary >= 15000;

-- 급여가 15000 이상인 사원들의 이름과 연봉
select first_name || ' ' || last_name 이름, hire_date 입사일
from employees
where hire_date >= '07/01/01';

-- 이름이 'Lex'인 사원의 연봉과 입사일, 부서 ID
select first_name || ' ' || last_name 이름, salary*12 연봉, hire_date 입사일, department_id 부서명
from employees
where first_name = 'Lex';

-- 부서 ID가 10인 사람의 명단
select first_name || ' ' || last_name 이름
from employees
where department_id = 10;

-- Like 연산
-- % 임의의 길이 문자열
-- _ 1개의 임의 문자
-- 이름에 am을 포함한 모든 사원들 %
select first_name 이름, salary 월급
from employees
where first_name like '%am%';

-- 이름의 두 번째 글자가 a인 사원의 목록
select first_name 이름, salary 월급
from employees
where first_name like '_a%';

/*
급여가 14000 이하이거나 17000 이상인 사원의 이름과 급여
부서 ID가 90인 사원 중 급여가 20000 이상인 사원
*/

-- 급여가 14000 이하이거나 17000 이상인 사원의 이름과 급여
select first_name 이름, salary 월급
from employees
where salary <= 14000 or salary >= 17000;

-- 부서 ID가 90인 사원 중 급여가 20000 이상인 사원
select first_name 이름, salary 월급
from employees
where department_id = 90 and salary >= 20000;

-- 급여가 14000 이상 17000이하인 사원의 이름과 급여
select first_name 이름, salary 월급
from employees
where salary >= 14000 and salary <= 17000;

select first_name 이름, salary 월급
from employees
where salary between 14000 and 17000;

-- 입사일이 07/01/01 ~ 07/12/31 구간에 있는 사원의 목록
select first_name 이름
from employees
where hire_date >= '07/01/01' and hire_date <= '07/12/31';

select first_name 이름
from employees
where hire_date between '07/01/01' and '07/12/31';

/*
부서 ID 가 10, 20, 40인 사원의 명단
MANAGER ID가 100, 200, 147인 사원의 명단
IN 연산자 이용
두 쿼리를 비교해 보고 IN 연산자의 유용한 점?
*/

-- 부서 ID 가 10, 20, 40인 사원의 명단
select *
from employees
where department_id=10 or department_id=20 or department_id=40;

select *
from employees
where department_id in (10, 20, 40);

-- MANAGER ID가 100, 200, 147인 사원의 명단
select *
from employees
where manager_id=100 or manager_id=200 or manager_id=147;

select *
from employees
where manager_id in (100, 200, 147);

-- 커미션을 받지 않는 사원의 목록
select first_name, commission_pct
from employees
where commission_pct is null;

-- 커미션을 받는 사원의 목록
select first_name, commission_pct
from employees
where commission_pct is not null;

/*
부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력
급여가 10000 이상인 직원의 이름을 급여 내립차순으로 출력
부서번호, 급여, 이름 순으로 출력하되 부서번호 오름차순, 급여 내림차순으로 출력
*/

-- 부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력

select first_name 이름, salary 급여, department_id 부서번호
from employees
order by department_id;

-- 급여가 10000 이상인 직원의 이름을 급여 내립차순으로 출력

select first_name 이름, salary 급여
from employees
where salary >= 10000
order by salary desc;

-- 부서번호, 급여, 이름 순으로 출력하되 부서번호 오름차순, 급여 내림차순으로 출력
select department_id 부서번호, salary 급여, first_name 이름
from employees
order by department_id, salary desc;

-----------------
-- 단일행 함수
-- 개별 레코드에 적용되는 함수
-----------------

-- 문자열 단일 행 함수
select first_name, last_name, concat(first_name, concat(' ', last_name)) name,
    first_name || ' ' || last_name name2,
    initcap(first_name || ' ' || last_name) name3,  -- 각 단어의 첫글자를 대문자로
    lower(first_name), -- 전부 소문자
    upper(first_name), -- 전부 대문자
    lpad(first_name, 10, '*'), -- 10글자 출력 크기 지정, 왼쪽 빈자리에 *를 채움
    rpad(first_name, 10, '*')  -- 10글자 출력 크기 지정, 오른쪽 빈자리에 *를 채움
from employees;

-- first_name에 am이 포함된 사원의 이름
select first_name
from employees
where first_name like '%am%';

select first_name
from employees;

-- upper, lower는 대소문자 구분 없이 검색할 때 유용
select first_name
from employees
where lower(first_name) like '%am%';

-- 정제
select ltrim('   Oracle   ', '*****Database*****'),     -- 왼쪽에 있는 빈 공간을 지워줌
    rtrim('   Oracle   '),      -- 오른쪽에 있는 공백을 지워줌
    trim('*' from '*****Database*****'),      -- 문자열 내에서 특정문자를 제거
    substr('Oracle Database', 8, 8),      -- 문자열 8번째 글자부터 8문자 추출
    substr('Oracle Database', -8, 8)      -- 뒤에서 8번째 글자부터 8문자를 추출
from dual;

-- 수치형 단일행 함수
select abs(-3.14),  -- 절댓값
    ceil(3.14),  -- 올림(천장)
    floor(3.14),    -- 내림(바닥)
    mod(7, 3),  -- 나눗셈의 몫
    power(2, 4), -- 2의 4제곱
    round(3.5), -- 소숫점 첫째자리 반올림
    round(3.5678, 2),   -- 소숫점 셋째자리 반올림
    trunc(3.56),    -- 소숫점 버림
    trunc(3.5678, 2),   -- 소숫점 셋째자리 버림
    sign(-10)   -- 부호 함수(음수: -1, 0, 양수: 1)
from dual;

-- 날짜형 단일행 함수

select sysdate from dual;   -- 시스템으로부터 날짜를 불러와 출력, 시스템 가상 테이블 1개

select sysdate from employees;   -- 테이블 내의 레코드 갯수만큼 출력

select sysdate, -- 시스템 날짜
    add_months(sysdate, 2), -- 오늘부터 2개월 후
    months_between(to_date('1999-12-31', 'yyyy-mm-dd'), sysdate),   -- '1999-12-31'부터 오늘까지 몇 개월이 지났는지
    next_day(sysdate, 6),    -- 오늘 이후 첫번째 금요일
    round(sysdate, 'month'),    -- 날짜 반올림
    trunc(sysdate, 'month')
from dual;

-- employees 사원들의 근속 수
select first_name 이름, hire_date 입사일, round(months_between(sysdate, hire_date)) months
from employees;

-------------
-- 변환함수
-------------

/*
to_char(o, fmt) : number or date -> varchar
to_number(s, fmt) : varchar -> number
to_date(s, fmt) : varchar -> date
*/

-- to_char
select first_name 이름, hire_date 입사일,
    to_char(hire_date, 'yyyy-mm-dd hh24:mi:ss') 입사일
from employees;

-- 현재 시간을 년-월-일 오전/오후 시:분:초 형식

select sysdate,
    to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
from dual;

select first_name 이름, to_char(salary * 12, '$999,999.99') 연봉
from employees;

-- to_number : 문자열 -> 숫자 정보
select to_number('$1,500,500.90', '$999,999,999.99')
from dual;

-- to_date : 날짜 형태를 지닌 문자열 -> date
select '2021-03-16 15:07', to_date('2021-03-16 15:07', 'yyyy-mm-dd hh24:mi')
from dual;

/*
날짜 연산
-- Date +- number : 날짜에 일 수를 더하거나 빼기 -> date
-- Date - Date : 두 날짜 사이의 일 수
-- Date + number / 24 : 날짜에 시간을 더하거나 뺄 때 number/24를 +-
*/

select to_char(sysdate, 'yyyy-mm-dd hh24:mi'),
    to_char(sysdate - 8, 'yyyy-mm-dd hh24:mi'), -- 8일 전
    to_char(sysdate + 8, 'yyyy-mm-dd hh24:mi'), -- 8일 후
    sysdate - to_date('1999-12-31', 'yyyy-mm-dd'),  -- 1999-12-31 이후로 며칠이 지났는지?
    to_char(sysdate + 12/24, 'yyyy-mm-dd hh24:mi') -- 현재 시간으로부터 12시간 후
from dual;

-- null 관련
-- null이 산술계산에 포함되면 null
-- null 처리가 필요한 경우
select first_name 이름, salary 급여,
    nvl(salary * commission_pct, 0) commision   -- nvl : 첫번째 인자가 null인 경우 두번째 인자값을 사용
from employees;

select first_name 이름, salary 급여,
    nvl2(commission_pct, salary * commission_pct, 0) commision
    -- nvl2 : 첫번째 인자가 not null인 경우 두번째 인자를, null인 경우 세번째 인자를 사용
from employees;

-- case function
-- 보너스 지급
-- ad관련 직원 -> 20%, sa관련 직원 10%, it관련 직원 8%, 나머지는 3% 지급

select first_name 이름, job_id 직군,
    substr(job_id, 1, 2)
from employees;

select first_name 이름, substr(job_id, 1, 2) 직군,
    case substr(job_id, 1, 2)
        when 'AD' then salary * 0.2
        when 'SA' then salary * 0.1
        when 'IT' then salary * 0.08
        else salary * 0.03
    end 보너스
from employees;

-- decode
select first_name job_id, substr(job_id, 1, 2) 직종, salary,
    decode(substr(job_id, 1, 2),    -- 비교할 값
        'AD', salary * 0.2,
        'SA', salary * 0.1,
        'IT', salary * 0.08,
        salary * 0.08) 보너스
from employees;

-----------
-- 연습문제
-----------
/*
직원 이름, 부서, 팀 출력
팀은 코드로 결정, 다음과 같은 그룹 이름 출력
부서코드 10~30 : 'A-GROUP'
부서코드 40~50 : 'B-GROUP'
부서코드 60~100 : 'C-GROUP'
나머지 : 'REMAINDER'
*/

select first_name 이름, department_id 부서코드,
    case
        when department_id >= 10 and department_id <= 30 then 'A-GROUP'
        when department_id <= 50 then 'B-GROUP'
        when department_id <= 100 then 'C-GROUP'
        else 'REMAINDER'
    end team
from employees
order by team;

-------------------------------------------------------------------------------
-- Practice01.SQL_실습문제_기본
-------------------------------------------------------------------------------
-- P.01
SELECT first_name||' '||last_name 이름, salary 월급, phone_number 전화번호, hire_date 입사일
FROM employees
ORDER BY hire_date;

-- P.02
SELECT job_title 업무이름, max_salary 최고월급
FROM jobs
ORDER BY max_salary desc;

-- P.03
SELECT first_name||' '||last_name 이름, manager_id "매니저 아이디",
    commission_pct "커미션 비율", salary 월급
FROM employees
WHERE manager_id IS NOT NULL AND
    commission_pct IS NULL AND salary > 3000;
    
-- P.04
SELECT job_title 업무이름, max_salary 최고월급
FROM jobs
WHERE max_salary >= 10000
ORDER BY max_salary DESC;

-- P.05
SELECT first_name 이름, salary 월급,  nvl(commission_pct, 0) 커미션퍼센트
FROM employees
WHERE salary >= 10000 AND salary < 14000
ORDER BY salary DESC;

-- P.06
SELECT first_name 이름, salary 월급, TO_CHAR(hire_date, 'YYYY-MM') 입사일, department_id 부서번호
FROM employees
WHERE department_id IN (10, 90, 100);

-- P.07
SELECT first_name 이름, salary 월급
FROM employees
WHERE LOWER(first_name) LIKE '%s%';

-- P.08
SELECT department_name 부서명
FROM departments
ORDER BY LENGTH(department_name) DESC;

-- P.09
SELECT UPPER(country_name) 나라명
FROM countries
ORDER BY country_name;

-- P.10
SELECT first_name 이름, REPLACE(phone_number, '.', '-') 전화번호, hire_date 입사일
FROM employees
WHERE hire_date < '03/12/31';

