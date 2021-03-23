
-----------------------------
-- DB 객체
-----------------------------

<<<<<<< HEAD
-- VIEW : 한개 혹은 복수 개의 테이블을 기반으로 함, 실제 데이터는 갖고 있지 않음
-- VIEW 생성을 위해서는 CREATE VIEW 권한이 필요
-- system으로 로그인
GRANT CREATE VIEW TO C##KMS;

-- SIMPLE VIEW
-- 단일 테이블 혹은 뷰를 기반으로 생성
-- 제약조건 위반이 없다면 INSERT, UPDATE, DELETE 가능
-- employees 테이블로부터 department_id가 10인 사람들만 VIEW로 생성
=======
-- VIEW : ?���? ?��?? 복수 개의 ?��?��블을 기반?���? ?��, ?��?�� ?��?��?��?�� 갖고 ?���? ?��?��
-- VIEW ?��?��?�� ?��?��?��?�� CREATE VIEW 권한?�� ?��?��
-- system?���? 로그?��
GRANT CREATE VIEW TO C##KMS;

-- SIMPLE VIEW
-- ?��?�� ?��?���? ?��?? 뷰�?? 기반?���? ?��?��
-- ?��?��조건 ?��반이 ?��?���? INSERT, UPDATE, DELETE �??��
-- employees ?��?��블로�??�� department_id�? 10?�� ?��?��?���? VIEW�? ?��?��
>>>>>>> 605c56beb1be9475787071c783d4758326ff41d7
CREATE TABLE emp_10
    AS SELECT employee_id, first_name, last_name, salary
        FROM hr.employees;

SELECT * FROM emp_10;

CREATE OR REPLACE VIEW view_emp_10
    AS SELECT * FROM emp_10;
    
DESC view_emp_10;
<<<<<<< HEAD
-- VIEW는 테이블처럼 조회 가능
-- 실제 데이터는 기반 테이블에서 가져옴
SELECT * FROM view_emp_10;

-- SIMPLE VIEW는 제약 사항에 위배되지 않으면 내용 갱신 가능
-- view_emp_10의 급여를 두배로
UPDATE view_emp_10 SET salary = salary * 2;

-- 가급적이면 VIEW는 조회용으로 활용
-- VIEW 생성 시 변경 불가 객체로 만들 필요
-- READ ONLY 옵션을 부여
=======
-- VIEW?�� ?��?��블처?�� 조회 �??��
-- ?��?�� ?��?��?��?�� 기반 ?��?��블에?�� �??��?��
SELECT * FROM view_emp_10;

-- SIMPLE VIEW?�� ?��?�� ?��?��?�� ?��배되�? ?��?���? ?��?�� 갱신 �??��
-- view_emp_10?�� 급여�? ?��배로
UPDATE view_emp_10 SET salary = salary * 2;

-- �?급적?���? VIEW?�� 조회?��?���? ?��?��
-- VIEW ?��?�� ?�� �?�? 불�? 객체�? 만들 ?��?��
-- READ ONLY ?��?��?�� �??��
>>>>>>> 605c56beb1be9475787071c783d4758326ff41d7
CREATE OR REPLACE VIEW view_emp_10
    AS SELECT * FROM emp_10 WITH READ ONLY;
    
UPDATE view_emp_10 SET salary = salary * 2;
<<<<<<< HEAD
-- 읽기 전용 뷰에서는 DML 작업 수행 불가

-- COMPLEX VIEW
-- 복수개의 Table or View를 기반
-- 함수, 표현식을 포함할 수 있음
-- 기본적으로 INSERT, UPDATE, DELETE 불가
-- book 테이블 JOIN author -> VIEW
=======
-- ?���? ?��?�� 뷰에?��?�� DML ?��?�� ?��?�� 불�?

-- COMPLEX VIEW
-- 복수개의 Table or View�? 기반
-- ?��?��, ?��?��?��?�� ?��?��?�� ?�� ?��?��
-- 기본?��?���? INSERT, UPDATE, DELETE 불�?
-- book ?��?���? JOIN author -> VIEW
>>>>>>> 605c56beb1be9475787071c783d4758326ff41d7
SELECT * FROM author;
SELECT * FROM book;

INSERT INTO book
<<<<<<< HEAD
VALUES(1, '토지', sysdate, 1);

INSERT INTO book(book_id, title, author_id)
VALUES(2, '살인자의 기억법', 2);
=======
VALUES(1, '?���?', sysdate, 1);

INSERT INTO book(book_id, title, author_id)
VALUES(2, '?��?��?��?�� 기억�?', 2);
>>>>>>> 605c56beb1be9475787071c783d4758326ff41d7

SELECT * FROM book;
COMMIT;

CREATE OR REPLACE VIEW book_detail
    (book_id, title, author, pub_date)
    AS SELECT book_id, title, author_name, pub_date
        FROM book b, author a
        WHERE b. author_id = a.author_id;
        
DESC book_detail;

SELECT * FROM book_detail;

<<<<<<< HEAD
UPDATE book_detail SET author_name = '미상';      -- 기본적으로 복합 VIEW는 수정이 불가

----------------------------------------
-- VIEW를 위한 딕셔너리
----------------------------------------
SELECT * FROM user_views;
-- 특정 view의 정보를 확인하려면 view_name 조건으로 조회
=======
UPDATE book_detail SET author_name = '미상';      -- 기본?��?���? 복합 VIEW?�� ?��?��?�� 불�?

----------------------------------------
-- VIEW�? ?��?�� ?��?��?���?
----------------------------------------
SELECT * FROM user_views;
-- ?��?�� view?�� ?��보�?? ?��?��?��?���? view_name 조건?���? 조회
>>>>>>> 605c56beb1be9475787071c783d4758326ff41d7
SELECT * FROM user_views
WHERE view_name = 'BOOK_DETAIL';

SELECT * FROM user_objects
WHERE object_type = 'VIEW';

<<<<<<< HEAD
-- VIEW 삭제
DROP VIEW book_detail;
SELECT * FROM user_views ;
=======
-- VIEW ?��?��
DROP VIEW book_detail;
SELECT * FROM user_views ;

-------------------------------------------
-- INDEX
-------------------------------------------

-- ���ڵ� �˻� �ӵ� ����� ���� ���� �۾�
-- WHERE ���� ���ǿ��� ���Ǵ� �ʵ�
-- JOIN�� �������� ���Ǵ� �ʵ忡 �����ϸ�
-- �˻� �ӵ� ��� ���(�� �ʿ��� �ʵ忡�� ����)

CREATE TABLE s_emp
    AS SELECT * FROM hr.employees;
    
-- �ε����� Ȯ��
SELECT * FROM user_indexes;

-- s_emp ���̺� employee_id �÷��� UNIQUE �ε��� ����
CREATE UNIQUE INDEX s_emp_id_pk     -- �ε��� �̸�
    ON s_emp(employee_id);
    
SELECT * FROM user_indexes;

-- � �ε����� ��� �÷��� �ɷ��ִ� �� Ȯ��
SELECT * FROM user_ind_columns;

SELECT t.index_name, t.table_name, c.column_name, c.column_position
FROM user_indexes t, user_ind_columns c
WHERE t.index_name = c.index_name AND
    t.table_name = 'S_EMP';
    
-- �ε��� ����
DROP INDEX s_emp_id_pk;
SELECT * FROM user_indexes;

----------------------------
-- SEQUENCE
----------------------------

-- ���� author ���̺� �� ���ڵ� �߰�
SELECT * FROM author;

-- �ߺ����� �ʴ� PK�� ���;� ��
INSERT INTO author(author_id, author_name)
    VALUES ((SELECT MAX(author_id) + 1 FROM author), '��Ƽ�� ŷ');
    
SELECT * FROM author;

-- �� ����� �������� ����
-- �ߺ����� �ʴ� ���� �����ϱ� ���� SWQUENCE ���

ROLLBACK;

SELECT MAX(author_id) + 1 FROM  author;

-- ������ ����
CREATE SEQUENCE seq_author_id
    START WITH 3        -- 3���� ����
    INCREMENT BY 1
    MAXVALUE 1000000;       -- �ִ��� 1000000
    
-- �������� �̿��� INSERT(PK)
INSERT INTO author(author_id, author_name)
VALUES(seq_author_id.NEXTVAL,   -- SEQUENCE���� �ߺ����� �ʴ� ������ ����
        '��Ƽ�� ŷ');
        
SELECT * FROM author;

-- �� �������� ����
CREATE SEQUENCE my_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10;

-- NEXTVAL, CURRVAL ���� �÷��� �̿�
SELECT my_seq.NEXTVAL FROM dual;        -- �� ���� ����
SELECT my_seq.CURRVAL FROM dual;        -- ���� �������� �� Ȯ��(���� ����)

-- ������ ����
ALTER SEQUENCE my_seq
    INCREMENT BY 2  -- ���� ���� 2�� ����
    MAXVALUE 1000000;
    
SELECT my_seq.NEXTVAL FROM dual;
SELECT my_seq.NEXTVAL FROM dual;

-- �������� ���� ��ųʸ�
SELECT * FROM user_sequences;
SELECT object_name FROM user_objects
WHERE object_type = 'SEQUENCE';

-- �������� ����
DROP SEQUENCE my_seq;
SELECT * FROM user_sequences;
>>>>>>> 605c56beb1be9475787071c783d4758326ff41d7
