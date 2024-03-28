CREATE TABLE STUDENT(
	STUDENT_NO	NUMBER PRIMARY KEY,
	STUDENT_ID	VARCHAR2(50) NOT NULL,
	STUDENT_PW	VARCHAR2(100) NOT NULL,
	STUDENT_NAME VARCHAR2(20) NOT NULL,
	MAJOR VARCHAR2(100) NOT NULL,
	STUDENT_DEL_FL	CHAR(1)	DEFAULT 'N' NOT NULL
);

CREATE SEQUENCE SEQ_STUDENT_NUM NOCACHE;

ALTER TABLE "STUDENT" ADD CHECK("STUDENT_DEL_FL" IN ('N', 'Y'));

INSERT INTO STUDENT VALUES
(SEQ_STUDENT_NUM.NEXTVAL,'user01', 'pass01','안소현', '체육학과', DEFAULT);



INSERT INTO STUDENT VALUES
(SEQ_STUDENT_NUM.NEXTVAL,'user02', 'pass02','정수빈', '영어영문학과', DEFAULT);

INSERT INTO STUDENT VALUES
(SEQ_STUDENT_NUM.NEXTVAL,'user03', 'pass03','김은별','국어국문학과', DEFAULT);

INSERT INTO STUDENT VALUES
(SEQ_STUDENT_NUM.NEXTVAL,'user04', 'pass04','송민주','우주과학과', DEFAULT);

INSERT INTO STUDENT VALUES
(SEQ_STUDENT_NUM.NEXTVAL,'user05', 'pass05','김택연','프랑스어학과', DEFAULT);

INSERT INTO STUDENT VALUES
(SEQ_STUDENT_NUM.NEXTVAL,'user06', 'pass06','김사랑', '기계공학과', DEFAULT);

INSERT INTO STUDENT VALUES
(SEQ_STUDENT_NUM.NEXTVAL,'user07', 'pass07','김종조', '연극영화과', DEFAULT);

INSERT INTO STUDENT VALUES
(SEQ_STUDENT_NUM.NEXTVAL,'user08', 'pass08','정윤희', '시각디자인과', DEFAULT);

SELECT  * FROM STUDENT;

CREATE TABLE CLASS(
	CLS_NO NUMBER PRIMARY KEY,
	CLS_NAME VARCHAR2(300) NOT NULL,
	MAJOR VARCHAR2(100) NOT NULL
);


CREATE TABLE REGISTER(
	REG_NO NUMBER NOT NULL, 
	CLS_NO NUMBER REFERENCES TABLE CLASS,
	CLS_NAME VARCHAR2(100) NOT NULL,
	STUDENT_NO NUMBER NOT NULL,
	MAJOR VARCHAR2(100) NOT NULL,
	
);

CREATE SEQUENCE SEQ_CLASS_NUM NOCACHE;

CREATE SEQUENCE SEQ_REGISTER_NUM NOCACHE;


INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '체육통계학', '체육학과');

INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '스포츠마케팅', '체육학과');

INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '졸업논문', '체육학과');

INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '우주관측및실습', '우주과학과');

INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '우주수치계산', '우주과학과');

INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '졸업논문', '우주과학과');

INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '초급프랑스어', '프랑스어학과');

INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '중급프랑스어', '프랑스어학과');

INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '프랑스어회화', '프랑스어학과');

INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '영어회화', '영어영문학과');

INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '셰익스피어 읽기', '영어영문학과');

INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '영국사', '영어영문학과');

INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '논어', '국어국문학과');

INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '고전시가', '국어국문학과');

INSERT INTO CLASS VALUES (SEQ_CLASS_NUM.NEXTVAL, '고전문법', '국어국문학과');



SELECT * FROM CLASS;



INSERT INTO REGISTER VALUES (SEQ_REGISTER_NUM.NEXTVAL, '고전문법', 3,'국어국문학과');

INSERT INTO REGISTER VALUES (SEQ_REGISTER_NUM.NEXTVAL, '체육통계학', 1,'체육학과');

INSERT INTO REGISTER VALUES (SEQ_REGISTER_NUM.NEXTVAL, '스포츠마케팅', 1,'체육학과');

ALTER TABLE REGISTER 
  ADD CONSTRAINT UK_CLASS UNIQUE (CLS_NAME, STUDENT_NO);

SELECT * FROM REGISTER;


SELECT * FROM STUDENT;

SELECT STUDENT_NO, STUDENT_ID, STUDENT_PW, STUDENT_NAME, MAJOR, STUDENT_DEL_FL
FROM STUDENT
WHERE STUDENT_ID = 'user01'
AND STUDENT_PW ='pass01';

COMMIT;

SELECT CLS_NAME FROM CLASS 
WHERE MAJOR = '체육학과';

INSERT INTO REGISTER VALUES (SEQ_REGISTER_NUM.NEXTVAL, '스포츠마케팅', 1,'체육학과');

DELETE FROM REGISTER 
WHERE REG_NO = 2;



UPDATE STUDENT SET
MAJOR = '컴퓨터공학과'
WHERE STUDENT_NO = 6;







