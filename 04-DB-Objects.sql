
-----------------------------
-- DB 媛앹껜
-----------------------------

-- VIEW : ?븳媛? ?샊?? 蹂듭닔 媛쒖쓽 ?뀒?씠釉붿쓣 湲곕컲?쑝濡? ?븿, ?떎?젣 ?뜲?씠?꽣?뒗 媛뽮퀬 ?엳吏? ?븡?쓬
-- VIEW ?깮?꽦?쓣 ?쐞?빐?꽌?뒗 CREATE VIEW 沅뚰븳?씠 ?븘?슂
-- system?쑝濡? 濡쒓렇?씤
GRANT CREATE VIEW TO C##KMS;

-- SIMPLE VIEW
-- ?떒?씪 ?뀒?씠釉? ?샊?? 酉곕?? 湲곕컲?쑝濡? ?깮?꽦
-- ?젣?빟議곌굔 ?쐞諛섏씠 ?뾾?떎硫? INSERT, UPDATE, DELETE 媛??뒫
-- employees ?뀒?씠釉붾줈遺??꽣 department_id媛? 10?씤 ?궗?엺?뱾留? VIEW濡? ?깮?꽦
CREATE TABLE emp_10
    AS SELECT employee_id, first_name, last_name, salary
        FROM hr.employees;

SELECT * FROM emp_10;

CREATE OR REPLACE VIEW view_emp_10
    AS SELECT * FROM emp_10;
    
DESC view_emp_10;
-- VIEW?뒗 ?뀒?씠釉붿쿂?읆 議고쉶 媛??뒫
-- ?떎?젣 ?뜲?씠?꽣?뒗 湲곕컲 ?뀒?씠釉붿뿉?꽌 媛??졇?샂
SELECT * FROM view_emp_10;

-- SIMPLE VIEW?뒗 ?젣?빟 ?궗?빆?뿉 ?쐞諛곕릺吏? ?븡?쑝硫? ?궡?슜 媛깆떊 媛??뒫
-- view_emp_10?쓽 湲됱뿬瑜? ?몢諛곕줈
UPDATE view_emp_10 SET salary = salary * 2;

-- 媛?湲됱쟻?씠硫? VIEW?뒗 議고쉶?슜?쑝濡? ?솢?슜
-- VIEW ?깮?꽦 ?떆 蹂?寃? 遺덇? 媛앹껜濡? 留뚮뱾 ?븘?슂
-- READ ONLY ?샃?뀡?쓣 遺??뿬
CREATE OR REPLACE VIEW view_emp_10
    AS SELECT * FROM emp_10 WITH READ ONLY;
    
UPDATE view_emp_10 SET salary = salary * 2;
-- ?씫湲? ?쟾?슜 酉곗뿉?꽌?뒗 DML ?옉?뾽 ?닔?뻾 遺덇?

-- COMPLEX VIEW
-- 蹂듭닔媛쒖쓽 Table or View瑜? 湲곕컲
-- ?븿?닔, ?몴?쁽?떇?쓣 ?룷?븿?븷 ?닔 ?엳?쓬
-- 湲곕낯?쟻?쑝濡? INSERT, UPDATE, DELETE 遺덇?
-- book ?뀒?씠釉? JOIN author -> VIEW
SELECT * FROM author;
SELECT * FROM book;

INSERT INTO book
VALUES(1, '?넗吏?', sysdate, 1);

INSERT INTO book(book_id, title, author_id)
VALUES(2, '?궡?씤?옄?쓽 湲곗뼲踰?', 2);

SELECT * FROM book;
COMMIT;

CREATE OR REPLACE VIEW book_detail
    (book_id, title, author, pub_date)
    AS SELECT book_id, title, author_name, pub_date
        FROM book b, author a
        WHERE b. author_id = a.author_id;
        
DESC book_detail;

SELECT * FROM book_detail;

UPDATE book_detail SET author_name = '誘몄긽';      -- 湲곕낯?쟻?쑝濡? 蹂듯빀 VIEW?뒗 ?닔?젙?씠 遺덇?

----------------------------------------
-- VIEW瑜? ?쐞?븳 ?뵓?뀛?꼫由?
----------------------------------------
SELECT * FROM user_views;
-- ?듅?젙 view?쓽 ?젙蹂대?? ?솗?씤?븯?젮硫? view_name 議곌굔?쑝濡? 議고쉶
SELECT * FROM user_views
WHERE view_name = 'BOOK_DETAIL';

SELECT * FROM user_objects
WHERE object_type = 'VIEW';

-- VIEW ?궘?젣
DROP VIEW book_detail;
SELECT * FROM user_views ;

-------------------------------------------
-- INDEX
-------------------------------------------

-- 레코드 검색 속도 향상을 위한 색인 작업
-- WHERE 절의 조건에서 사용되는 필드
-- JOIN의 조건으로 사용되는 필드에 적용하면
-- 검색 속도 향상 기능(꼭 필요한 필드에만 적용)

CREATE TABLE s_emp
    AS SELECT * FROM hr.employees;
    
-- 인덱스의 확인
SELECT * FROM user_indexes;

-- s_emp 테이블 employee_id 컬럼에 UNIQUE 인덱스 생성
CREATE UNIQUE INDEX s_emp_id_pk     -- 인덱스 이름
    ON s_emp(employee_id);
    
SELECT * FROM user_indexes;

-- 어떤 인덱스가 어느 컬럼에 걸려있는 지 확인
SELECT * FROM user_ind_columns;

SELECT t.index_name, t.table_name, c.column_name, c.column_position
FROM user_indexes t, user_ind_columns c
WHERE t.index_name = c.index_name AND
    t.table_name = 'S_EMP';
    
-- 인덱스 삭제
DROP INDEX s_emp_id_pk;
SELECT * FROM user_indexes;

----------------------------
-- SEQUENCE
----------------------------

-- 만약 author 테이블에 새 레코드 추가
SELECT * FROM author;

-- 중복되지 않는 PK를 얻어와야 함
INSERT INTO author(author_id, author_name)
    VALUES ((SELECT MAX(author_id) + 1 FROM author), '스티븐 킹');
    
SELECT * FROM author;

-- 이 방식은 안전하지 않음
-- 중복되지 않는 값을 추출하기 위해 SWQUENCE 사용

ROLLBACK;

SELECT MAX(author_id) + 1 FROM  author;

-- 시퀀스 생성
CREATE SEQUENCE seq_author_id
    START WITH 3        -- 3부터 추출
    INCREMENT BY 1
    MAXVALUE 1000000;       -- 최댓값은 1000000
    
-- 시퀀스를 이용한 INSERT(PK)
INSERT INTO author(author_id, author_name)
VALUES(seq_author_id.NEXTVAL,   -- SEQUENCE에서 중복되지 않는 정수를 생성
        '스티븐 킹');
        
SELECT * FROM author;

-- 새 시퀀스를 생성
CREATE SEQUENCE my_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10;

-- NEXTVAL, CURRVAL 가상 컬럼을 이용
SELECT my_seq.NEXTVAL FROM dual;        -- 새 값을 추출
SELECT my_seq.CURRVAL FROM dual;        -- 현재 시퀀스의 값 확인(증가 안함)

-- 시퀀스 수정
ALTER SEQUENCE my_seq
    INCREMENT BY 2  -- 증가 값을 2로 변경
    MAXVALUE 1000000;
    
SELECT my_seq.NEXTVAL FROM dual;
SELECT my_seq.NEXTVAL FROM dual;

-- 시퀀스를 위한 딕셔너리
SELECT * FROM user_sequences;
SELECT object_name FROM user_objects
WHERE object_type = 'SEQUENCE';

-- 시퀀스의 삭제
DROP SEQUENCE my_seq;
SELECT * FROM user_sequences;