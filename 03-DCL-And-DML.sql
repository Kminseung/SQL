/*
사용자 생성
    CREATE C##KMS IDENTIFIED BY 7777;
    - ORACLE : 사용자 생성 -> 동일 이름의 SCHEMA도 같이 생성
사용자 삭제
    DROP USER C##KMS
    DROP USER C##KMS CASCADE - 연결된 객체도 모두 삭제
권한을 갖고 있지 않으면 어떤 작업도 수행 불가능
*/

-- system으로 진행
-- 사용자 정보 확인
-- USER_USERS : 현재 사용자 관련 정보
-- ALL_USERS : DB의 모든 사용자 정보
-- DBA_USERS : 모든 사용자의 상세 정보(DBA Only)

-- 현재 사용자 확인
SELECT * FROM USER_USERS;

-- 전체 사용자 확인
SELECT * FROM ALL_USERS;

-- 로그인 권한 부여
GRANT CREATE SESSION TO C##KMS;     -- C##KMS에게 세션 생성(로그인) 권한 부여

-- CREATE TABLE test(a NUMBER);     권한 불충분
GRANT connect, resource TO C##KMS;      -- 접속과 권한 부여

/*
CREATE TABLE test(a NUMBER);
SELECT * FROM TAB;
DESC test;
INSERT INTO test VALUES(10);
-- 테이블 스페이스 'USERS'에 대한 권한이 없습니다.
*/

/*
Oracle 12 이후
    - 일반 계정 구분하기 위해 C## 접두어
    - 실제 데이터가 저장될 테이블 스페이스를 마련해 줘야 함
*/

/* 
C## 없이 계정을 생서하는 방법
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = true;
CREATE USER KMS IDENTIFIED BY 7777;

/* 사용자 데이터 저장 테이블 스페이스 부여 */
ALTER USER C##KMS DEFAULT TABLESPACE USERS      -- C##KMS 사용자 저장공간을 USER에 마련
    QUOTA unlimited on USERS;   -- 저장 공간 한도를 부한으로 부여

-- ROLE의 생성
DROP ROLE dbuser;
CREATE ROLE dbuser;     -- dbuser 역할을 만들어 여러개의 권한을 담아둠
GRANT CREATE session TO dbuser;       -- dbuser 역할에 접속할 수 있는 권한 부여
GRANT RESOURCE TO dbuser;       -- dbuser 역할에 자원 생성 권한 부여

-- ROLE을 GRANT 하면 내부에 있는 개별 권한이 모두 부여
GRANT dbuser TO KMS;    -- KMS 사용자에게 dbuser 역할을 부여

-- 권한 회수 REBOKE
REVOKE dbuser FROM KMS; -- KMS 사용자로부터 dbuser역할을 회수

-- 계정 삭제
DROP USER KMS CASCADE;

