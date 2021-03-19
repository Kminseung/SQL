
-----------------------------
-- DB 객체
-----------------------------

-- VIEW : 한개 혹은 복수 개의 테이블을 기반으로 함, 실제 데이터는 갖고 있지 않음
-- VIEW 생성을 위해서는 CREATE VIEW 권한이 필요
-- system으로 로그인
GRANT CREATE VIEW TO C##KMS;

-- SIMPLE VIEW
-- 단일 테이블 혹은 뷰를 기반으로 생성
-- 제약조건 위반이 없다면 INSERT, UPDATE, DELETE 가능
-- employees 테이블로부터 department_id가 10인 사람들만 VIEW로 생성
CREATE TABLE emp_10
    AS SELECT employee_id, first_name, last_name, salary
        FROM hr.employees;

SELECT * FROM emp_10;

CREATE OR REPLACE VIEW view_emp_10
    AS SELECT * FROM emp_10;
    
DESC view_emp_10;
-- VIEW는 테이블처럼 조회 가능
-- 실제 데이터는 기반 테이블에서 가져옴
SELECT * FROM view_emp_10;

-- SIMPLE VIEW는 제약 사항에 위배되지 않으면 내용 갱신 가능
-- view_emp_10의 급여를 두배로
UPDATE view_emp_10 SET salary = salary * 2;

-- 가급적이면 VIEW는 조회용으로 활용
-- VIEW 생성 시 변경 불가 객체로 만들 필요
-- READ ONLY 옵션을 부여
CREATE OR REPLACE VIEW view_emp_10
    AS SELECT * FROM emp_10 WITH READ ONLY;
    
UPDATE view_emp_10 SET salary = salary * 2;
-- 읽기 전용 뷰에서는 DML 작업 수행 불가