-- 함수 : 컬럼의 값을 읽어서 연산한 결과를 반환

-- 단일 행 함수 : n개의 값을 읽어 n개의 결과를 반환

-- 그룹 함수 : n개의 값을 읽어 1개의 결과를 반환 (합계, 평균, 최대, 최소)

-- 함수는 SELECT문의
-- SELECT절, WHERE절, ORDER BY절, GROUP BY절, HAVING절 사용 가능

------------------------------------- 단일 행 함수 ---------------------------

-- LENGTH(컬럼명 | 문자열) : 길이 반환
SELECT EMAIL, LENGTH(EMAIL) FROM EMPLOYEE;

--------------------------------------------------------


-- INSTR(컬럼명 | 문자열, '찾을 문자열' [ , 찾기 시작할 위치[ , 순번]] )
-- 지정한 위치부터 지정한 순번째로 검색되는 문자의 위치를 반환

-- 문자열을 앞에서부터 검색하여 첫 번째 B위치 조회
SELECT INSTR('AABAACAABBAA','B') FROM DUAL; -- 3
	-- 옵션이 없다면 맨 앞에서부터 검색해서 첫 번째 나오는 문자위치

-- 문자열을 5번째 문자부터 검색하여 첫 번째 B 위치를 조회
SELECT INSTR('AABAACAABBAA','B', 5) FROM DUAL; -- 9

-- 문자열을 5번째 문자부터 검색하여 두 번째 B 위치를 조회
SELECT INSTR('AABAACAABBAA','B', 5, 2) FROM DUAL; -- 10


-- EMPLOYEE 테이블에서 사원명, 이메일, 이메일 중 '@' 위치 조회
SELECT EMP_NAME, EMAIL, INSTR(EMAIL, '@') AS "@위치" FROM EMPLOYEE;

--------------------------------------------------------

-- SUBSTR('문자열' | 컬럼명, 잘라내기 시작할 위치 [, 잘라낼 길이])
-- 컬럼이나 문자열에서 지정한 위치부터 지정된 길이만큼 문자열을 잘라내서 반환
--> 잘라낼 길이 생략 시 끝까지 잘라냄

-- EMPLOYEE 테이블에서 사원명, 이메일 중 아이디 부분만 조회
-- sun_di

SELECT EMP_NAME, SUBSTR(EMAIL, 1, INSTR(EMAIL,'@')-1) 아이디 FROM EMPLOYEE; 

---------------------------------------------------------


-- TRIM([[옵션] '문자열' | 컬럼명 FROM] '문자열' | 컬럼명)
-- 주어진 컬럼이나 문자열의 앞, 뒤, 양쪽에 있는 지정된 문자를 제거
--> 보통 양쪽 공백 제거에 많이 사용

-- 옵션 : LEADING(앞쪽), TRAILING(뒤쪽), BOTH(양쪽, 기본값)

SELECT TRIM('     H  E  L L O      ') FROM DUAL; -- 양족 공백 제거
	-- 사이사이 공백이 아닌 양쪽만

SELECT TRIM(BOTH '#' FROM '###안녕######') FROM DUAL;


--------------------------------------------------------

/* 숫자 관련 함수*/

-- ABS(숫자 | 컬럼명) : 절대값

SELECT ABS(10), ABS(-10) FROM DUAL; 

SELECT '절대값 같음' FROM DUAL WHERE ABS(10) = ABS(-10); -- WHERE절 함수 작성 가능



-- MOD(숫자 | 컬럼명 , 숫자 | 컬럼명) : 나머지 값 반환
-- EMPLOYEE 테이블에서 사원의 월급을 100만으로 나눴을 때 나머지 조회
SELECT EMP_NAME, SALARY, MOD(SALARY, 1000000) FROM EMPLOYEE;



-- EMPLOYEE 테이블에서 사번이 짝수인 사원의 사번, 이름 조회
SELECT EMP_ID, EMP_NAME FROM EMPLOYEE WHERE MOD(EMP_ID,2) = 0;

-- EMPLOYEE 테이블에서 사번이 홀수인 사원의 사번, 이름 조회
SELECT EMP_ID, EMP_NAME FROM EMPLOYEE WHERE MOD(EMP_ID,2) != 0; -- <> 같지 않다


-- ROUND( 숫자 | 컬럼명 [, 소수점 위치]) : 반올림

SELECT ROUND(123.456) FROM DUAL; -- 123, 소수점 첫 번째 자리에서 반올림

SELECT ROUND(123.456, 1) FROM DUAL; -- 123.5, 소수점 두 번째 자리에서 반올림 // 첫 번째 자리까지 보여줌
																				--> 두 번째 자리에서 반올림해서 
																				-- 소수점 한 자리만 표현

SELECT ROUND(123.456, 0) FROM DUAL; -- 소수점 첫 번째 자리에서 반올림 (0 기본값)

SELECT ROUND(123.456, -1) FROM DUAL; -- 소수점 0번째 자리에서 반올림
																			-- 소수점 -1 자리 표현
																			-- = 1의 자리에서 반올림해서 10의 자리부터 표현

SELECT ROUND(132.456, -2) FROM DUAL; -- 10의 자리에서 반올림해서 100의 자리부터 표현



-- CEIL(숫자 | 컬럼명) : 올림
		-- 소수점 뒤 아무리 작아도 올림
-- FLOOR(숫자 | 컬럼명) : 내림
		-- 소수점 뒤 아무리 커도 내림
--> 둘 다 소수점 첫째 자리에서 올림 / 내림 처리

SELECT CEIL(123.1), FLOOR(123.9) FROM DUAL;
--				124			 			123


-- TRUNC(숫자 | 컬럼명 [, 위치]) : 특정 위치 아래를 버림(절삭)

SELECT TRUNC(123.456) FROM DUAL;  --123, 소수점 아래 버림

SELECT TRUNC(123.456, 1) FROM DUAL; -- 123.4, 소수점 첫째 자리 아래 버림 

SELECT TRUNC(132.456, -1) FROM DUAL;-- 120, 10의 자리 아래를 버림 



/* 버림, 내림 차이점 */

SELECT FLOOR(-123.5), TRUNC(-123.5) FROM DUAL;
--					-124						-123
-- FLOOR에서 가까운 정수인 -124 반환
-- TRUNC는 가깝던 말던 정수부분만 빼고 절삭



----------------------------------------------
/* 날짜 (DATE) 관련 함수 */

-- SYSDATE : 시스템의 현재 시간(년, 월, 일, 시 분, 초)을 반환
SELECT SYSDATE FROM DUAL;

-- SYSTIMESTAMP : SYSDATE + MS 단위 추가
SELECT SYSTIMESTAMP FROM DUAL;
-- TIMESTAMP : 특정 시간을 나타내거나 기록하기 위한 문자열
-- 2024-02-29 11:20:41.133 +0900 (UTC에서 +9시간 나타냄, 한국 표준시)

-- MONTHS_BETWEEN(날짜, 날짜) : 두 날짜의 개월 수 차이 반환
SELECT ROUND( MONTHS_BETWEEN(SYSDATE, '2024-06-26'), 3) "수강 기간(개월)" FROM DUAL; 
-- 보통 ROUND와 함께 많이 사용



-- EMPLOYEE 테이블에서
-- 사원의 이름, 입사일, 근무한 개월 수, 근무 년차 조회
SELECT EMP_NAME, HIRE_DATE, 
CEIL (MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) "근무한 개월 수",
CEIL (MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12) ||'년차' "근무 년차"
FROM EMPLOYEE; 

/* || : 연결 연산자(문자열 이어쓰기) */

-- ADD_MONTHS(날짜, 숫자) : 날짜에 숫자만큼의 개월 수를 더함(음수도 가능)
SELECT ADD_MONTHS(SYSDATE,4) FROM DUAL; 
SELECT ADD_MONTHS(SYSDATE,-1) FROM DUAL; 


-- LAST_DAY(날짜) : 해당 달의 마지막 날짜를 구함
SELECT LAST_DAY(SYSDATE) FROM DUAL; 
SELECT LAST_DAY('2021-02-01') FROM DUAL;


-- EXTRACT : 년, 월, 일 정보를 추출하여 리턴
-- EXTRACT(YEAR FROM 날짜) : 년도만 추출
-- EXTRACT(MONTH FROM 날짜) : 월만 추출
-- EXTRACT(DAY FROM 날짜) : 일만 추출

-- EMPLOYEE 테이블에서 
-- 각 사원의 이름, 입사일(입사년도, 월, 일), 조회
SELECT EMP_NAME, 
EXTRACT(YEAR FROM HIRE_DATE) || '년'||
EXTRACT(MONTH FROM HIRE_DATE) || '월'||
EXTRACT(DAY FROM HIRE_DATE) || '일' 입사일 FROM EMPLOYEE;

----------------------------------------------

/* 형변환 함수 */
-- 문자열(CHAR), 숫자(NUMBER), 날짜(DATE)끼리 형변환 가능

/* 문자열로 변환*/
-- TO_CHAR(날짜, [포맷] ) : 날짜형 데이터를 문자형 데이터로 변경
-- TO_CHAR(숫자, [포맷] ) : 숫자형 데이터를 문자형 데이터로 변경

-- <숫자 변환 시 포맷 패턴>
-- 9 : 숫자 한 칸을 의미, 여러 개 작성 시 오른쪽 정렬
-- 0 : 숫자 한 칸을 의미, 여러 개 작성 시 오른쪽 정렬 + 빈칸 0 추가
-- L : 현재 DB에 설정된 나라의 화폐 기호

SELECT TO_CHAR(1234) FROM DUAL; -- 1,234 -> '1234'

SELECT TO_CHAR(1234, '99999') FROM DUAL; --> ' 1234' 앞에 한 칸 공백

SELECT TO_CHAR(1234, '00000') FROM DUAL; --> '01234' 빈 칸에 0 추가

SELECT TO_CHAR( EXTRACT(MONTH FROM HIRE_DATE), '00' ) || '월' FROM EMPLOYEE;

SELECT TO_CHAR(1000000, '9,999,999') || '원' FROM DUAL; -- 1,000,000원'

SELECT TO_CHAR(1000000, 'L9,999,999') FROM DUAL; -- '￦1,000,000'


-- <날짜 변환 시 포맷 패턴>

-- YYYY : 년도 / YY : 년도 (짧게) 
-- RRRR : 년도 / RR : 년도 (짧게) 
-- MM : 월 / DD : 일
-- AM 또는 PM : 오전/오후 표시
-- HH : 시간 / HH24 : 24시간 표기법
-- MI : 분 / SS : 초

-- DAY : 요일(전체) / DY : 요일(요일명만 표시)

SELECT SYSDATE FROM DUAL; -- 2024-02-29 12:20:58.000

-- 2024/02/29 12:20:54 목요일
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS DAY') FROM DUAL; 

-- 02/29 (목)
SELECT TO_CHAR(SYSDATE, 'MM.DD (DY)') FROM DUAL; 



