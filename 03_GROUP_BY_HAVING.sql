/* SELECT문 해석 순서
 * 
 * 5 : SELECT 컬럼명 AS 별칭, 계산식, 함수식
 * 1 : FROM 테이블명
 * 2 : WHERE 컬럼명 | 함수식 비교연산자 비교값
 * 3 : GROUP BY 그룹을 묶을 컬럼명 
 * 4 : HAVING 그룹함수식 비교연산자 비교값
 * 6 : ORDER BY 컬럼명 | 별칭 | 컬럼순번 정렬방식 ( ASC/DESC ) [NULLS FIRST | LAST];
 * 
 * */

----------------------------------------------------------------

-- * GROUP BY절 : 같은 값들이 여러개 기록된 컬럼을 가지고 같은 값들을
-- 						    하나의 그룹으로 묶음

-- GROUP BY 컬럼명 | 함수식, ..

-- 여러개의 값을 묶어서 하나로 처리할 목적으로 사용함
-- 그룹으로 묶은 값에 대해서 SELECT절에서 그룹함수를 사용함

-- 그룹함수는 단 한 개의 결과값만 산출하기 때문에 그룹이 여러 개일 경우 오류 발생
-- 여러개의 결과값을 산출하기 위해 그룹함수가 적용된 그룹의 기준을 ORDER BY절에 기술하여 사용


-- EMPLOYEE 테이블에서 부서코드, 부서별 급여 합 조회

-- 1) 부서코드만 조회
SELECT DEPT_CODE FROM EMPLOYEE; -- 23행

-- 2) 전체 급여 합 조회
SELECT SUM(SALARY) FROM EMPLOYEE; -- 1행

SELECT DEPT_CODE, SUM(SALARY) FROM EMPLOYEE
GROUP BY DEPT_CODE; --> DEPT_CODE가 같은 행끼리 하나의 그룹이 됨
-- 단일 그룹의 그룹 함수가 아닙니다

-- EMPLOYEE 테이블에서
-- 직급코드가 같은 사람의 직급코드, 급여 평균, 인원 수를 
-- 직급코드 오름차순으로 조회

SELECT JOB_CODE, ROUND(AVG(SALARY)), COUNT(*) FROM EMPLOYEE GROUP BY JOB_CODE ORDER BY JOB_CODE;

-- EMPLOYEE 테이블에서 
-- 성별(남/여)과 각 성별 별 인원 수, 급여 합을
-- 인원 수 오름차순으로 조회
SELECT DECODE( SUBSTR(EMP_NO,8,1),'1','남','2', '여') 성별,
-- EMP_NO 8번째 자리에서 1개 자른 것이 1이면 남자 2이면 여자
			COUNT(*) "인원 수",
			SUM(SALARY) "급여 합"
FROM EMPLOYEE
GROUP BY DECODE( SUBSTR(EMP_NO,8,1),'1','남','2', '여') -- 별칭사용 X (SELECT 절보다 해석 순서가 앞)
ORDER BY "인원 수"; -- 별칭 사용 O (SELECT절 해석 완료)


























