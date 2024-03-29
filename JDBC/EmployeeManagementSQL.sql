SELECT EMP_ID, EMP_NAME, EMP_NO, EMAIL,PHONE,
NVL(DEPT_TITLE, '부서없음') DEPT_TITLE, JOB_NAME, SALARY FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
JOIN JOB USING (JOB_CODE)
ORDER BY EMP_ID;



SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;



SELECT * FROM EMPLOYEE ;

SELECT JOB_NAME, TRUNC(AVG(SALARY),1) SALARY FROM EMPLOYEE 
JOIN JOB USING (JOB_CODE)
GROUP BY JOB_NAME;
