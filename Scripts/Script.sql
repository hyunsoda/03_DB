--- *** DML(Data Manipulation Language) : 데이터 조작 언어

-- 테이블에 값을 삽입하거나(INSERT), 수정하거나(UPDATE), 삭제(DELETE) 하는 구문

-- 주의 : 혼자서 COMMIT, ROLLBACK하지 말 것!


-- 테스트용 테이블 생성
CREATE TABLE EMPLOYEE2 AS SELECT * FROM EMPLOYEE;
CREATE TABLE DEPARTMENT2 AS SELECT * FROM DEPARTMENT;

SELECT * FROM EMPLOYEE2;
SELECT * FROM DEPARTMENT2; 

----------------------------------------------------------------------------

-- 1. INSERT

-- 테이블에 새로운 행을 추가하는 구문


-- 1) INSERT INTO 테이블명 VALUES(데이터, 데이터, 데이터, ...)
-- 테이블에 있는 모든 컬럼에 대한 값을 INSERT할 때 사용
-- INSERT 하고자 하는 컬럼이 모든 컬럼인 경우 컬럼명 생략 가능.
-- 단, 컬럼의 순서를 지켜서 VALUES에 값을 기입해야 함.

INSERT INTO EMPLOYEE2 VALUES('900','장채현','901230-2345678','jang_ch@kh.or.kr','01012341234','D1','J7','S3',4300000,0.2,'200',SYSDATE, NULL, 'N');

SELECT * FROM EMPLOYEE2 WHERE EMP_ID = '900';

ROLLBACK; -- COMMIT되지 않은 변경사항 엎기



-- 2) INSERT INTO 테이블명 (컬럼명, 컬럼명, 컬럼명...) VALUES (데이터, 데이터, 데이터,...);
-- 테이블에 내가 선택한 컬럼에 대한 값만 INSERT 할 때 사용
-- 선택 안된 컬럼은 값이 NULL이 들어감 (DEFAULT 존재 시 DEFAULT값으로 삽입됨)

INSERT INTO EMPLOYEE2(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY) 
VALUES('900','장채현','901230-2345678','jang_ch@kh.or.kr','01012341234','D1','J7','S3',4300000);

SELECT * FROM EMPLOYEE2 WHERE EMP_ID = '900';

COMMIT;
-- COMMIT하면 ROLLBACK해도 안 사라짐



-------------------------------------------------------------------

-- (참고) INSERT 시 VALUES 대신 서브쿼리 사용 가능
CREATE TABLE EMP_01(
	EMP_ID NUMBER,
	EMP_NAME VARCHAR2(30),
	DEPT_TITLE VARCHAR2(20)
);

SELECT * FROM EMP_01;

SELECT EMP_ID, EMP_NAME, DEPT_TITLE 
FROM EMPLOYEE2 
LEFT JOIN DEPARTMENT2 ON (DEPT_CODE = DEPT_ID);

-- 서브쿼리 (SELECT) 결과를 EMP_01 테이블에 INSERT
--> SELECT 조회 결과의 데이터 타입, 컬럼 개수가
-- INSERT 하려는 테이블의 컬럼과 일치해야함

INSERT INTO EMP_01(
	SELECT EMP_ID, EMP_NAME, DEPT_TITLE 
	FROM EMPLOYEE2 
	LEFT JOIN DEPARTMENT2 ON (DEPT_CODE = DEPT_ID)
);

SELECT * FROM EMP_01;

------------------------------------------------------------

-- 2. UPDATE (내용을 바꾸던가 추가해서 최신화)

-- 테이블에 기록된 컬럼의 값을 수정하는 구문

-- [작성법]
-- UPDATE 테이블명 SET 컬럼명 = 바꿀값
-- [WHERE 컬럼명 비교연산자 비교값];
--> WHERE 조건 중요!


-- DEPARTMENT2 테이블에서 DEPT_ID가 'D9'인 부서 정보 조회
SELECT * FROM DEPARTMENT2 WHERE DEPT_ID = 'D9';

-- DEPARTMENT2 테이블에서 DEPT_ID가 'D9'인 행의 DEPT_TITLE을
-- '전략기획팀'으로 수정

UPDATE DEPARTMENT2 
SET DEPT_TITLE = '전략기획팀' 
WHERE DEPT_ID = 'D9';












