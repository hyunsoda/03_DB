SELECT * FROM TB_CLASS;
SELECT * FROM TB_CLASS_PROFESSOR;
SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_GRADE;
SELECT * FROM TB_STUDENT;
SELECT * FROM TB_PROFESSOR;
-- 1. 
SELECT STUDENT_NO 학번, STUDENT_NAME 이름 , TO_CHAR (ENTRANCE_DATE,'YYYY-MM-DD' ) 입학년도 
FROM TB_STUDENT WHERE DEPARTMENT_NO = 002 ORDER BY ENTRANCE_DATE;

-- 2.
SELECT PROFESSOR_NAME, PROFESSOR_SSN FROM TB_PROFESSOR
WHERE PROFESSOR_NAME NOT LIKE '___';

-- 3.
SELECT PROFESSOR_NAME 교수이름, TO_CHAR(SYSDATE, 'YYYY')- (19||SUBSTR(PROFESSOR_SSN,1,2)) 나이 FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN,8,1) = 1 ORDER BY 나이;

		-- 예시답안
SELECT PROFESSOR_NAME 교수이름,
FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE('19'||SUBSTR(PROFESSOR_SSN,1,6),'YYYYMMDD')) /12 ) 나이
FROM TB_PROFESSOR 
WHERE SUBSTR(PROFESSOR_SSN,8,1) = '1'
ORDER BY 나이; 

-- 4.
SELECT SUBSTR(PROFESSOR_NAME,2) 이름 FROM TB_PROFESSOR;

-- 5.
SELECT STUDENT_NO, STUDENT_NAME FROM TB_STUDENT WHERE EXTRACT (YEAR FROM ENTRANCE_DATE) - (19||SUBSTR(STUDENT_SSN,1,2)) >19;
			-- 입학년도에서 출생년도 빼면 입학한 나이가 나옴. 얘가 19보다 크다면 재수생
SELECT STUDENT_NO, STUDENT_NAME FROM TB_STUDENT WHERE EXTRACT (YEAR FROM ENTRANCE_DATE) - EXTRACT(YEAR FROM TO_DATE('19'||SUBSTR(STUDENT_SSN,1,6),'YYYYMMDD')) >19;

-- 6.
SELECT TO_CHAR(TO_DATE('2020-12-25') ,'DAY') FROM DUAL;
-- 'DAY' : 월요일 'DY' : 월 'D' : 2
-- 1 : 일요일
-- 2 : 월요일
-- 3 : 화요일 ...


-- 7.
-- YY는 모두 2000년대
-- RR은 49이하는 2000년대, 50 이상은 1900년대
-- 2099년 /10월 /11일 TO_DATE('99/10/11',YYMMDD)
-- 2049년 /10월 /11일 TO_DATE('49/10/11',YYMMDD)
-- 1999년 / 10월 /11일 ('99/10/11',RRMMDD)
-- 2049년 / 10월 /11일 ('49/10/11',RRMMDD)

-- 8. 
SELECT STUDENT_NO, STUDENT_NAME FROM TB_STUDENT 
WHERE SUBSTR(STUDENT_NO,1,1) != 'A';

-- 9.
SELECT ROUND(AVG(POINT),1) 평점  FROM TB_GRADE WHERE STUDENT_NO = 'A517178';

-- 10.
SELECT DEPARTMENT_NO 학과번호, COUNT(DEPARTMENT_NO) "학생 수(명)" FROM TB_STUDENT 
GROUP BY DEPARTMENT_NO ORDER BY DEPARTMENT_NO ;

-- 11.
SELECT COUNT(*) FROM TB_STUDENT WHERE COACH_PROFESSOR_NO IS NULL;  

-- 12.
SELECT SUBSTR(TERM_NO,1,4) 년도, ROUND(AVG(POINT),1)  "년도 별 평점" FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY 년도; 

-- 13. 
SELECT DEPARTMENT_NO 학과코드명, COUNT(*) "휴학생 수" FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y' GROUP BY DEPARTMENT_NO ORDER BY DEPARTMENT_NO ; 

-- 14.
SELECT STUDENT_NAME, COUNT(STUDENT_NAME) FROM TB_STUDENT 
GROUP BY STUDENT_NAME HAVING COUNT(STUDENT_NAME) >=2;

-- 15.
SELECT SUBSTR(TERM_NO,1,4) 년도, SUBSTR(TERM_NO, 5,2) 학기, ROUND(AVG(POINT),1)  평점 FROM TB_GRADE WHERE STUDENT_NO ='A112113' 
GROUP BY ROLLUP (SUBSTR(TERM_NO,1,4),SUBSTR(TERM_NO, 5,2))
ORDER BY 년도; 
