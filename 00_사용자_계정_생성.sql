
-- 한 줄 주석

/* 
 * 범위주석
 * 
 *  */ 



-- 11G 버전 이전의 문법을 사용 가능하도록 함
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
-- CTRL + ENTER : 선택한 SQL 수행

-- 사용자 계정 생성
	-- 관리자 계정이기때문에 가능
CREATE USER test IDENTIFIED BY test;


-- 사용자 계정에 권한 부여
GRANT RESOURCE, CONNECT TO test;
		-- RESOURCE : 데이터베이스 객체를 생성하거나 관리하는데 필요한 권한을 줌
		-- 데이터베이스 객체 : table, view, sequence
		-- CONNECT : 접속 권한

-- 객체가 생성될 수 있는 공간 할당량 지정
ALTER USER test DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;
	-- 테이블 만드는데 공간 제한이 없다








