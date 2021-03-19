
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

-- COMPLEX VIEW
-- 복수개의 Table or View를 기반
-- 함수, 표현식을 포함할 수 있음
-- 기본적으로 INSERT, UPDATE, DELETE 불가
-- book 테이블 JOIN author -> VIEW
SELECT * FROM author;
SELECT * FROM book;

INSERT INTO book
VALUES(1, '토지', sysdate, 1);

INSERT INTO book(book_id, title, author_id)
VALUES(2, '살인자의 기억법', 2);

SELECT * FROM book;
COMMIT;

CREATE OR REPLACE VIEW book_detail
    (book_id, title, author, pub_date)
    AS SELECT book_id, title, author_name, pub_date
        FROM book b, author a
        WHERE b. author_id = a.author_id;
        
DESC book_detail;

SELECT * FROM book_detail;

UPDATE book_detail SET author_name = '미상';      -- 기본적으로 복합 VIEW는 수정이 불가

----------------------------------------
-- VIEW를 위한 딕셔너리
----------------------------------------
SELECT * FROM user_views;
-- 특정 view의 정보를 확인하려면 view_name 조건으로 조회
SELECT * FROM user_views
WHERE view_name = 'BOOK_DETAIL';

SELECT * FROM user_objects
WHERE object_type = 'VIEW';

-- VIEW 삭제
DROP VIEW book_detail;
SELECT * FROM user_views ;