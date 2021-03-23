
-----------------------------
-- DB Í∞ùÏ≤¥
-----------------------------

<<<<<<< HEAD
-- VIEW : ÌïúÍ∞ú ÌòπÏùÄ Î≥µÏàò Í∞úÏùò ÌÖåÏù¥Î∏îÏùÑ Í∏∞Î∞òÏúºÎ°ú Ìï®, Ïã§Ï†ú Îç∞Ïù¥ÌÑ∞Îäî Í∞ñÍ≥† ÏûàÏßÄ ÏïäÏùå
-- VIEW ÏÉùÏÑ±ÏùÑ ÏúÑÌï¥ÏÑúÎäî CREATE VIEW Í∂åÌïúÏù¥ ÌïÑÏöî
-- systemÏúºÎ°ú Î°úÍ∑∏Ïù∏
GRANT CREATE VIEW TO C##KMS;

-- SIMPLE VIEW
-- Îã®Ïùº ÌÖåÏù¥Î∏î ÌòπÏùÄ Î∑∞Î•º Í∏∞Î∞òÏúºÎ°ú ÏÉùÏÑ±
-- Ï†úÏïΩÏ°∞Í±¥ ÏúÑÎ∞òÏù¥ ÏóÜÎã§Î©¥ INSERT, UPDATE, DELETE Í∞ÄÎä•
-- employees ÌÖåÏù¥Î∏îÎ°úÎ∂ÄÌÑ∞ department_idÍ∞Ä 10Ïù∏ ÏÇ¨ÎûåÎì§Îßå VIEWÎ°ú ÏÉùÏÑ±
=======
-- VIEW : ?ïúÍ∞? ?òπ?? Î≥µÏàò Í∞úÏùò ?Öå?ù¥Î∏îÏùÑ Í∏∞Î∞ò?úºÎ°? ?ï®, ?ã§?†ú ?ç∞?ù¥?Ñ∞?äî Í∞ñÍ≥† ?ûàÏß? ?ïä?ùå
-- VIEW ?Éù?Ñ±?ùÑ ?úÑ?ï¥?Ñú?äî CREATE VIEW Í∂åÌïú?ù¥ ?ïÑ?öî
-- system?úºÎ°? Î°úÍ∑∏?ù∏
GRANT CREATE VIEW TO C##KMS;

-- SIMPLE VIEW
-- ?ã®?ùº ?Öå?ù¥Î∏? ?òπ?? Î∑∞Î?? Í∏∞Î∞ò?úºÎ°? ?Éù?Ñ±
-- ?†ú?ïΩÏ°∞Í±¥ ?úÑÎ∞òÏù¥ ?óÜ?ã§Î©? INSERT, UPDATE, DELETE Í∞??ä•
-- employees ?Öå?ù¥Î∏îÎ°úÎ∂??Ñ∞ department_idÍ∞? 10?ù∏ ?Ç¨?ûå?ì§Îß? VIEWÎ°? ?Éù?Ñ±
>>>>>>> 605c56beb1be9475787071c783d4758326ff41d7
CREATE TABLE emp_10
    AS SELECT employee_id, first_name, last_name, salary
        FROM hr.employees;

SELECT * FROM emp_10;

CREATE OR REPLACE VIEW view_emp_10
    AS SELECT * FROM emp_10;
    
DESC view_emp_10;
<<<<<<< HEAD
-- VIEWÎäî ÌÖåÏù¥Î∏îÏ≤òÎüº Ï°∞Ìöå Í∞ÄÎä•
-- Ïã§Ï†ú Îç∞Ïù¥ÌÑ∞Îäî Í∏∞Î∞ò ÌÖåÏù¥Î∏îÏóêÏÑú Í∞ÄÏ†∏Ïò¥
SELECT * FROM view_emp_10;

-- SIMPLE VIEWÎäî Ï†úÏïΩ ÏÇ¨Ìï≠Ïóê ÏúÑÎ∞∞ÎêòÏßÄ ÏïäÏúºÎ©¥ ÎÇ¥Ïö© Í∞±Ïã† Í∞ÄÎä•
-- view_emp_10Ïùò Í∏âÏó¨Î•º ÎëêÎ∞∞Î°ú
UPDATE view_emp_10 SET salary = salary * 2;

-- Í∞ÄÍ∏âÏ†ÅÏù¥Î©¥ VIEWÎäî Ï°∞ÌöåÏö©ÏúºÎ°ú ÌôúÏö©
-- VIEW ÏÉùÏÑ± Ïãú Î≥ÄÍ≤Ω Î∂àÍ∞Ä Í∞ùÏ≤¥Î°ú ÎßåÎì§ ÌïÑÏöî
-- READ ONLY ÏòµÏÖòÏùÑ Î∂ÄÏó¨
=======
-- VIEW?äî ?Öå?ù¥Î∏îÏ≤ò?üº Ï°∞Ìöå Í∞??ä•
-- ?ã§?†ú ?ç∞?ù¥?Ñ∞?äî Í∏∞Î∞ò ?Öå?ù¥Î∏îÏóê?Ñú Í∞??†∏?ò¥
SELECT * FROM view_emp_10;

-- SIMPLE VIEW?äî ?†ú?ïΩ ?Ç¨?ï≠?óê ?úÑÎ∞∞ÎêòÏß? ?ïä?úºÎ©? ?Ç¥?ö© Í∞±Ïã† Í∞??ä•
-- view_emp_10?ùò Í∏âÏó¨Î•? ?ëêÎ∞∞Î°ú
UPDATE view_emp_10 SET salary = salary * 2;

-- Í∞?Í∏âÏ†Å?ù¥Î©? VIEW?äî Ï°∞Ìöå?ö©?úºÎ°? ?ôú?ö©
-- VIEW ?Éù?Ñ± ?ãú Î≥?Í≤? Î∂àÍ? Í∞ùÏ≤¥Î°? ÎßåÎì§ ?ïÑ?öî
-- READ ONLY ?òµ?Öò?ùÑ Î∂??ó¨
>>>>>>> 605c56beb1be9475787071c783d4758326ff41d7
CREATE OR REPLACE VIEW view_emp_10
    AS SELECT * FROM emp_10 WITH READ ONLY;
    
UPDATE view_emp_10 SET salary = salary * 2;
<<<<<<< HEAD
-- ÏùΩÍ∏∞ Ï†ÑÏö© Î∑∞ÏóêÏÑúÎäî DML ÏûëÏóÖ ÏàòÌñâ Î∂àÍ∞Ä

-- COMPLEX VIEW
-- Î≥µÏàòÍ∞úÏùò Table or ViewÎ•º Í∏∞Î∞ò
-- Ìï®Ïàò, ÌëúÌòÑÏãùÏùÑ Ìè¨Ìï®Ìï† Ïàò ÏûàÏùå
-- Í∏∞Î≥∏Ï†ÅÏúºÎ°ú INSERT, UPDATE, DELETE Î∂àÍ∞Ä
-- book ÌÖåÏù¥Î∏î JOIN author -> VIEW
=======
-- ?ùΩÍ∏? ?†Ñ?ö© Î∑∞Ïóê?Ñú?äî DML ?ûë?óÖ ?àò?ñâ Î∂àÍ?

-- COMPLEX VIEW
-- Î≥µÏàòÍ∞úÏùò Table or ViewÎ•? Í∏∞Î∞ò
-- ?ï®?àò, ?ëú?òÑ?ãù?ùÑ ?è¨?ï®?ï† ?àò ?ûà?ùå
-- Í∏∞Î≥∏?†Å?úºÎ°? INSERT, UPDATE, DELETE Î∂àÍ?
-- book ?Öå?ù¥Î∏? JOIN author -> VIEW
>>>>>>> 605c56beb1be9475787071c783d4758326ff41d7
SELECT * FROM author;
SELECT * FROM book;

INSERT INTO book
<<<<<<< HEAD
VALUES(1, 'ÌÜ†ÏßÄ', sysdate, 1);

INSERT INTO book(book_id, title, author_id)
VALUES(2, 'ÏÇ¥Ïù∏ÏûêÏùò Í∏∞ÏñµÎ≤ï', 2);
=======
VALUES(1, '?Ü†Ïß?', sysdate, 1);

INSERT INTO book(book_id, title, author_id)
VALUES(2, '?Ç¥?ù∏?ûê?ùò Í∏∞ÏñµÎ≤?', 2);
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
UPDATE book_detail SET author_name = 'ÎØ∏ÏÉÅ';      -- Í∏∞Î≥∏Ï†ÅÏúºÎ°ú Î≥µÌï© VIEWÎäî ÏàòÏ†ïÏù¥ Î∂àÍ∞Ä

----------------------------------------
-- VIEWÎ•º ÏúÑÌïú ÎîïÏÖîÎÑàÎ¶¨
----------------------------------------
SELECT * FROM user_views;
-- ÌäπÏ†ï viewÏùò Ï†ïÎ≥¥Î•º ÌôïÏù∏ÌïòÎ†§Î©¥ view_name Ï°∞Í±¥ÏúºÎ°ú Ï°∞Ìöå
=======
UPDATE book_detail SET author_name = 'ÎØ∏ÏÉÅ';      -- Í∏∞Î≥∏?†Å?úºÎ°? Î≥µÌï© VIEW?äî ?àò?†ï?ù¥ Î∂àÍ?

----------------------------------------
-- VIEWÎ•? ?úÑ?ïú ?îï?Öî?ÑàÎ¶?
----------------------------------------
SELECT * FROM user_views;
-- ?äπ?†ï view?ùò ?†ïÎ≥¥Î?? ?ôï?ù∏?ïò?†§Î©? view_name Ï°∞Í±¥?úºÎ°? Ï°∞Ìöå
>>>>>>> 605c56beb1be9475787071c783d4758326ff41d7
SELECT * FROM user_views
WHERE view_name = 'BOOK_DETAIL';

SELECT * FROM user_objects
WHERE object_type = 'VIEW';

<<<<<<< HEAD
-- VIEW ÏÇ≠Ï†ú
DROP VIEW book_detail;
SELECT * FROM user_views ;
=======
-- VIEW ?Ç≠?†ú
DROP VIEW book_detail;
SELECT * FROM user_views ;

-------------------------------------------
-- INDEX
-------------------------------------------

-- ∑πƒ⁄µÂ ∞Àªˆ º”µµ «‚ªÛ¿ª ¿ß«— ªˆ¿Œ ¿€æ˜
-- WHERE ¿˝¿« ¡∂∞«ø°º≠ ªÁøÎµ«¥¬ « µÂ
-- JOIN¿« ¡∂∞«¿∏∑Œ ªÁøÎµ«¥¬ « µÂø° ¿˚øÎ«œ∏È
-- ∞Àªˆ º”µµ «‚ªÛ ±‚¥…(≤¿ « ø‰«— « µÂø°∏∏ ¿˚øÎ)

CREATE TABLE s_emp
    AS SELECT * FROM hr.employees;
    
-- ¿Œµ¶Ω∫¿« »Æ¿Œ
SELECT * FROM user_indexes;

-- s_emp ≈◊¿Ã∫Ì employee_id ƒ√∑≥ø° UNIQUE ¿Œµ¶Ω∫ ª˝º∫
CREATE UNIQUE INDEX s_emp_id_pk     -- ¿Œµ¶Ω∫ ¿Ã∏ß
    ON s_emp(employee_id);
    
SELECT * FROM user_indexes;

-- æÓ∂≤ ¿Œµ¶Ω∫∞° æÓ¥¿ ƒ√∑≥ø° ∞…∑¡¿÷¥¬ ¡ˆ »Æ¿Œ
SELECT * FROM user_ind_columns;

SELECT t.index_name, t.table_name, c.column_name, c.column_position
FROM user_indexes t, user_ind_columns c
WHERE t.index_name = c.index_name AND
    t.table_name = 'S_EMP';
    
-- ¿Œµ¶Ω∫ ªË¡¶
DROP INDEX s_emp_id_pk;
SELECT * FROM user_indexes;

----------------------------
-- SEQUENCE
----------------------------

-- ∏∏æ‡ author ≈◊¿Ã∫Ìø° ªı ∑πƒ⁄µÂ √ﬂ∞°
SELECT * FROM author;

-- ¡ﬂ∫πµ«¡ˆ æ ¥¬ PK∏¶ æÚæÓøÕæﬂ «‘
INSERT INTO author(author_id, author_name)
    VALUES ((SELECT MAX(author_id) + 1 FROM author), 'Ω∫∆º∫Ï ≈∑');
    
SELECT * FROM author;

-- ¿Ã πÊΩƒ¿∫ æ»¿¸«œ¡ˆ æ ¿Ω
-- ¡ﬂ∫πµ«¡ˆ æ ¥¬ ∞™¿ª √ﬂ√‚«œ±‚ ¿ß«ÿ SWQUENCE ªÁøÎ

ROLLBACK;

SELECT MAX(author_id) + 1 FROM  author;

-- Ω√ƒˆΩ∫ ª˝º∫
CREATE SEQUENCE seq_author_id
    START WITH 3        -- 3∫Œ≈Õ √ﬂ√‚
    INCREMENT BY 1
    MAXVALUE 1000000;       -- √÷¥Ò∞™¿∫ 1000000
    
-- Ω√ƒˆΩ∫∏¶ ¿ÃøÎ«— INSERT(PK)
INSERT INTO author(author_id, author_name)
VALUES(seq_author_id.NEXTVAL,   -- SEQUENCEø°º≠ ¡ﬂ∫πµ«¡ˆ æ ¥¬ ¡§ºˆ∏¶ ª˝º∫
        'Ω∫∆º∫Ï ≈∑');
        
SELECT * FROM author;

-- ªı Ω√ƒˆΩ∫∏¶ ª˝º∫
CREATE SEQUENCE my_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10;

-- NEXTVAL, CURRVAL ∞°ªÛ ƒ√∑≥¿ª ¿ÃøÎ
SELECT my_seq.NEXTVAL FROM dual;        -- ªı ∞™¿ª √ﬂ√‚
SELECT my_seq.CURRVAL FROM dual;        -- «ˆ¿Á Ω√ƒˆΩ∫¿« ∞™ »Æ¿Œ(¡ı∞° æ»«‘)

-- Ω√ƒˆΩ∫ ºˆ¡§
ALTER SEQUENCE my_seq
    INCREMENT BY 2  -- ¡ı∞° ∞™¿ª 2∑Œ ∫Ø∞Ê
    MAXVALUE 1000000;
    
SELECT my_seq.NEXTVAL FROM dual;
SELECT my_seq.NEXTVAL FROM dual;

-- Ω√ƒˆΩ∫∏¶ ¿ß«— µÒº≈≥ ∏Æ
SELECT * FROM user_sequences;
SELECT object_name FROM user_objects
WHERE object_type = 'SEQUENCE';

-- Ω√ƒˆΩ∫¿« ªË¡¶
DROP SEQUENCE my_seq;
SELECT * FROM user_sequences;
>>>>>>> 605c56beb1be9475787071c783d4758326ff41d7
