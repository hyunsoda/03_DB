--
--ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
--
---- 새로운 사용자 계정 생성 (sys 계정으로 진행)
--CREATE USER todo_servlet IDENTIFIED BY todo_servlet;
--
---- 사용자 계정 권한 부여 설정
--GRANT RESOURCE, CONNECT TO todo_servlet;
--
---- 객체가 생성될 수 있는 공간 할당량 지정
--ALTER USER todo_servlet DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;
--
----------------------------------------------------
CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(50)		NOT NULL,
	"MEMBER_PW"	VARCHAR2(100)		NOT NULL,
	"MEMBER_NICKNAME" VARCHAR2(30) NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE NOT NULL,
	"MEMBER_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '회원 아이디';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_NICKNAME" IS '회원 이름(별명)';

COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '회원 가입일';

COMMENT ON COLUMN "MEMBER"."MEMBER_DEL_FL" IS '탈퇴여부(N:탈퇴X, Y: 탈퇴O)';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);
-- 탈퇴여부 CHECK 제약 조건
ALTER TABLE "MEMBER" ADD CONSTRAINT "CH_MEMBER_DEL_FL" 
CHECK("MEMBER_DEL_FL" IN ('N', 'Y'));


-- 시퀀스 생성
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;

-- 샘플 계정 추가
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user01', 'pass01'
	, '유저일', DEFAULT, DEFAULT);

-- 샘플 계정 추가
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user02', 'pass02'
	, '유저이', DEFAULT, DEFAULT);


CREATE TABLE "TODO" (
	"TODO_NO" NUMBER NOT NULL,
	"TODO_TITLE" VARCHAR2(300) NOT NULL,
	"TODO_MEMO" VARCHAR2(500),
	"TODO_DATE" DATE	DEFAULT SYSDATE NOT NULL,
	"TODO_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO" NUMBER NOT NULL
);

COMMENT ON COLUMN "TODO"."TODO_NO" IS '투두 번호(SEQ_TODO_NO)';

COMMENT ON COLUMN "TODO"."TODO_TITLE" IS '투두 제목';

COMMENT ON COLUMN "TODO"."TODO_MEMO" IS '투두 메모내용';

COMMENT ON COLUMN "TODO"."TODO_DATE" IS '투두 생성일';

COMMENT ON COLUMN "TODO"."TODO_DEL_FL" IS '삭제 여부(N : 삭제X , Y : 삭제O)';

COMMENT ON COLUMN "TODO"."MEMBER_NO" IS '작성자 회원 번호';

-- 시퀀스 생성
CREATE SEQUENCE SEQ_TODO_NO NOCACHE;

ALTER TABLE "TODO" ADD CONSTRAINT "PK_TODO" PRIMARY KEY (
	"TODO_NO"
);

ALTER TABLE "TODO" ADD CONSTRAINT "FK_MEMBER_TO_TODO" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

-- 샘플 투두 추가
INSERT INTO "TODO"
VALUES(SEQ_TODO_NO.NEXTVAL, '장보기', '이마트에서 저녁거리 장보기'
	, DEFAULT, DEFAULT, 1);

COMMIT;
----------------------------------------------------------------------------

SELECT MEMBER_NO, MEMBER_ID, MEMBER_NICKNAME, 
TO_CHAR(ENROLL_DATE, 'YYYY"년" MM"월" DD"일" HH24"시" MI"분" SS"초"') AS ENROLL_DATE
FROM MEMBER
WHERE MEMBER_DEL_FL = 'N'
AND MEMBER_ID = 'user01'
AND MEMBER_PW = 'pass01';

SELECT * FROM TODO;
SELECT * FROM MEMBER;

SELECT TODO_NO, TODO_TITLE, TODO_MEMO, TODO_DATE
FROM "TODO"
WHERE MEMBER_NO = '1'
AND TODO_DEL_FL = 'N';


















