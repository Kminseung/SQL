/*
����� ����
    CREATE C##KMS IDENTIFIED BY 7777;
    - ORACLE : ����� ���� -> ���� �̸��� SCHEMA�� ���� ����
����� ����
    DROP USER C##KMS
    DROP USER C##KMS CASCADE - ����� ��ü�� ��� ����
������ ���� ���� ������ � �۾��� ���� �Ұ���
*/

-- system���� ����
-- ����� ���� Ȯ��
-- USER_USERS : ���� ����� ���� ����
-- ALL_USERS : DB�� ��� ����� ����
-- DBA_USERS : ��� ������� �� ����(DBA Only)

-- ���� ����� Ȯ��
SELECT * FROM USER_USERS;

-- ��ü ����� Ȯ��
SELECT * FROM ALL_USERS;

-- �α��� ���� �ο�
GRANT CREATE SESSION TO C##KMS;     -- C##KMS���� ���� ����(�α���) ���� �ο�

-- CREATE TABLE test(a NUMBER);     ���� �����
GRANT connect, resource TO C##KMS;      -- ���Ӱ� ���� �ο�

/*
CREATE TABLE test(a NUMBER);
SELECT * FROM TAB;
DESC test;
INSERT INTO test VALUES(10);
-- ���̺� �����̽� 'USERS'�� ���� ������ �����ϴ�.
*/

/*
Oracle 12 ����
    - �Ϲ� ���� �����ϱ� ���� C## ���ξ�
    - ���� �����Ͱ� ����� ���̺� �����̽��� ������ ��� ��
*/

/* 
C## ���� ������ �����ϴ� ���
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = true;
CREATE USER KMS IDENTIFIED BY 7777;

/* ����� ������ ���� ���̺� �����̽� �ο� */
ALTER USER C##KMS DEFAULT TABLESPACE USERS      -- C##KMS ����� ��������� USER�� ����
    QUOTA unlimited on USERS;   -- ���� ���� �ѵ��� �������� �ο�

-- ROLE�� ����
DROP ROLE dbuser;
CREATE ROLE dbuser;     -- dbuser ������ ����� �������� ������ ��Ƶ�
GRANT CREATE session TO dbuser;       -- dbuser ���ҿ� ������ �� �ִ� ���� �ο�
GRANT RESOURCE TO dbuser;       -- dbuser ���ҿ� �ڿ� ���� ���� �ο�

-- ROLE�� GRANT �ϸ� ���ο� �ִ� ���� ������ ��� �ο�
GRANT dbuser TO KMS;    -- KMS ����ڿ��� dbuser ������ �ο�

-- ���� ȸ�� REBOKE
REVOKE dbuser FROM KMS; -- KMS ����ڷκ��� dbuser������ ȸ��

-- ���� ����
DROP USER KMS CASCADE;

