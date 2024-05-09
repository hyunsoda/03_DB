CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_ID" VARCHAR2(30) NOT NULL,
	"MEMBER_NAME"	NVARCHAR2(10)		NOT NULL,
	"MEMBER_EMAIL"	NVARCHAR2(50)		NOT NULL,
	"MEMBER_PW"	NVARCHAR2(150)		NOT NULL,
	"MEMBER_TEL"	CHAR(11)		NOT NULL,
	"MEMBER_ADDRESS"	NVARCHAR2(150)		NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMBER_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"AUTHORITY"	NUMBER	DEFAULT 1	NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원번호 (PK)';

COMMENT ON COLUMN "MEMBER"."MEMBER_NAME" IS '회원이름';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 이메일';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_TEL" IS '회원 전화번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_ADDRESS" IS '회원 주소';

COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '가입날짜';

COMMENT ON COLUMN "MEMBER"."MEMBER_DEL_FL" IS '회원탈퇴여부';

COMMENT ON COLUMN "MEMBER"."AUTHORITY" IS '회원권한(1:일반회원, 2:관리자)';

CREATE TABLE "MONEY_DONATION" (
	"MONEY_DONATION_NO"	NUMBER		NOT NULL,
	"MONEY_DONATION_TOTAL"	NUMBER	DEFAULT 0	NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "MONEY_DONATION"."MONEY_DONATION_NO" IS '후원신청번호';

COMMENT ON COLUMN "MONEY_DONATION"."MONEY_DONATION_TOTAL" IS '후원총금액';

COMMENT ON COLUMN "MONEY_DONATION"."MEMBER_NO" IS '회원번호 (PK)';

CREATE TABLE "ACTIVITY" (
	"ACT_NO"	NUMBER		NOT NULL,
	"ACT_NAME"	NVARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "ACTIVITY"."ACT_NO" IS '활동번호(PK)';

COMMENT ON COLUMN "ACTIVITY"."ACT_NAME" IS '활동이름';

CREATE TABLE "COMMENT" (
	"COMMENT_NO"	NUMBER		NOT NULL,
	"COMMTENT_CONTENT"	NVARCHAR2(500)		NOT NULL,
	"COMMENT_WRITE_DATE"	DATE		NOT NULL,
	"COMMENT_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"ORIGINAL_COMMENT_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "COMMENT"."COMMENT_NO" IS '댓글 번호';

COMMENT ON COLUMN "COMMENT"."COMMTENT_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "COMMENT"."COMMENT_WRITE_DATE" IS '댓글 작성일';

COMMENT ON COLUMN "COMMENT"."COMMENT_DEL_FL" IS '댓글 삭제 여부 (Y/N)';

COMMENT ON COLUMN "COMMENT"."MEMBER_NO" IS '회원번호 (PK)';

COMMENT ON COLUMN "COMMENT"."BOARD_NO" IS '게시글번호(PK)';

COMMENT ON COLUMN "COMMENT"."ORIGINAL_COMMENT_NO" IS '부모댓글 번호';

CREATE TABLE "QNABOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	NVARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	NVARCHAR2(2000)		NOT NULL,
	"BOARD_WRITE_DATE"	DATE		NOT NULL,
	"BOARD_UPDATE_DATE"	DATE		NOT NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"BOARD_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

ALTER TABLE QNABOARD MODIFY "BOARD_UPDATE_DATE" NULL;
COMMIT;

COMMENT ON COLUMN "QNABOARD"."BOARD_NO" IS '게시글번호(PK)';

COMMENT ON COLUMN "QNABOARD"."BOARD_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "QNABOARD"."BOARD_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "QNABOARD"."BOARD_WRITE_DATE" IS '게시글 작성일';

COMMENT ON COLUMN "QNABOARD"."BOARD_UPDATE_DATE" IS '게시글 마지막 수정일';

COMMENT ON COLUMN "QNABOARD"."READ_COUNT" IS '조회수';

COMMENT ON COLUMN "QNABOARD"."BOARD_DEL_FL" IS '게시글 삭제여부 (Y/N)';

COMMENT ON COLUMN "QNABOARD"."MEMBER_NO" IS '회원번호 (PK)';

CREATE TABLE "VOlUNTEER" (
	"VOLUNTEER_NO"	NUMBER		NOT NULL,
	"ACT_NO"	NUMBER		NOT NULL,
	"ACT_DATE"	DATE		NOT NULL,
	"VOLUNTEER_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"VOLUNTEER_TITLE"	VARCHAR2(50)		NOT NULL,
	"VOLUNTEER_CONTENT"	VARCHAR2(500)		NOT NULL
);

COMMENT ON COLUMN "VOlUNTEER"."VOLUNTEER_NO" IS '봉사번호(PK)';

COMMENT ON COLUMN "VOlUNTEER"."ACT_NO" IS '활동번호(PK)';

COMMENT ON COLUMN "VOlUNTEER"."ACT_DATE" IS '봉사하러가는날';

COMMENT ON COLUMN "VOlUNTEER"."VOLUNTEER_DEL_FL" IS '삭제여부';

COMMENT ON COLUMN "VOlUNTEER"."VOLUNTEER_TITLE" IS '봉사제목';

COMMENT ON COLUMN "VOlUNTEER"."VOLUNTEER_CONTENT" IS '봉사내용';

CREATE TABLE "VOLUNTEERLIST" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"VOLUNTEER_NO"	NUMBER		NOT NULL,
	"REGISTRY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "VOLUNTEERLIST"."MEMBER_NO" IS '회원번호 (PK)';

COMMENT ON COLUMN "VOLUNTEERLIST"."VOLUNTEER_NO" IS '봉사번호(PK)';

COMMENT ON COLUMN "VOLUNTEERLIST"."REGISTRY_DATE" IS '봉사신청일';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "MONEY_DONATION" ADD CONSTRAINT "PK_MONEY_DONATION" PRIMARY KEY (
	"MONEY_DONATION_NO"
);

ALTER TABLE "ACTIVITY" ADD CONSTRAINT "PK_ACTIVITY" PRIMARY KEY (
	"ACT_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "PK_COMMENT" PRIMARY KEY (
	"COMMENT_NO"
);

ALTER TABLE "QNABOARD" ADD CONSTRAINT "PK_QNABOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "VOlUNTEER" ADD CONSTRAINT "PK_VOLUNTEER" PRIMARY KEY (
	"VOLUNTEER_NO"
);
--
--ALTER TABLE "VOLUNTEERLIST" ADD CONSTRAINT "PK_VOLUNTEERLIST" PRIMARY KEY (
--	"MEMBER_NO",
--	"VOLUNTEER_NO"
--);

--ALTER TABLE VOLUNTEERLIST DROP CONSTRAINT "PK_VOLUNTEERLIST";
COMMIT;

ALTER TABLE "MONEY_DONATION" ADD CONSTRAINT "FK_MEMBER_TO_MONEY_DONATION_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_MEMBER_TO_COMMENT_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_QNABOARD_TO_COMMENT_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "QNABOARD" (
	"BOARD_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_COMMENT_TO_COMMENT_1" FOREIGN KEY (
	"ORIGINAL_COMMENT_NO"
)
REFERENCES "COMMENT" (
	"COMMENT_NO"
);

ALTER TABLE "QNABOARD" ADD CONSTRAINT "FK_MEMBER_TO_QNABOARD_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "VOlUNTEER" ADD CONSTRAINT "FK_ACTIVITY_TO_VOlUNTEER_1" FOREIGN KEY (
	"ACT_NO"
)
REFERENCES "ACTIVITY" (
	"ACT_NO"
);

ALTER TABLE "VOLUNTEERLIST" ADD CONSTRAINT "FK_MEMBER_TO_VOLUNTEERLIST_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

--ALTER TABLE "VOLUNTEERLIST" ADD CONSTRAINT "FK_VOlUNTEER_TO_VOLUNTEERLIST_1" FOREIGN KEY (
--	"VOLUNTEER_NO"
--)
--REFERENCES "VOlUNTEER" (
--	"VOLUNTEER_NO"
--);

ALTER TABLE VOLUNTEERLIST DROP CONSTRAINT "FK_VOlUNTEER_TO_VOLUNTEERLIST_1";
ALTER TABLE VOLUNTEERLIST ADD CONSTRAINT "FK_VOlUNTEER_TO_VOLUNTEERLIST_1" FOREIGN KEY (
	"VOLUNTEER_NO"
)
REFERENCES "ACTIVITY" (
	"ACT_NO"
);
COMMIT;
--------------------------------------------------------------------
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;


INSERT INTO "MEMBER" VALUES(SEQ_MEMBER_NO.NEXTVAL,'user01', '유저일', 'user01@kh.or.kr','$2a$10$gkm6uWMQa0zwX4UR30GrSe0beeXa0IUlPTLulSpsscAJMS/NVs3li','01012345678','서울시 종로구 kh정보교육원', DEFAULT, DEFAULT, DEFAULT );
INSERT INTO "MEMBER" VALUES(SEQ_MEMBER_NO.NEXTVAL,'user02', '유저이', 'so0144@naver.com','$2a$10$gkm6uWMQa0zwX4UR30GrSe0beeXa0IUlPTLulSpsscAJMS/NVs3li','01012345678','서울시 종로구 kh정보교육원', DEFAULT, DEFAULT, DEFAULT );

SELECT * FROM MEMBER;

COMMIT;


SELECT * FROM MONEY_DONATION;

ALTER TABLE MONEY_DONATION 
ADD "MEMBER_EMAIL" NVARCHAR2(50);	

ALTER TABLE MONEY_DONATION 
ADD "MEMBER_TEL" CHAR(11);

ALTER TABLE MONEY_DONATION 
MODIFY "MEMBER_EMAIL" NOT NULL;

ALTER TABLE MONEY_DONATION 
MODIFY "MEMBER_TEL" NOT NULL;

COMMIT;

SELECT * FROM MONEY_DONATION;


CREATE SEQUENCE SEQ_MONEY_DONATION_NO NOCACHE;

SELECT * FROM VOLUNTEERLIST;

---------------------------
INSERT INTO ACTIVITY VALUES (1,'연탄봉사');
INSERT INTO ACTIVITY VALUES (2,'재능 기부 봉사');
INSERT INTO ACTIVITY VALUES (3,'자택 방문 봉사');

SELECT * FROM ACTIVITY;
COMMIT;


ALTER TABLE VOLUNTEERLIST 
ADD "MEMBER_NAME" NVARCHAR2(10);

ALTER TABLE VOLUNTEERLIST 
ADD "MEMBER_TEL" CHAR(11);

ALTER TABLE VOLUNTEERLIST 
ADD "FIELD" NVARCHAR2(30);

ALTER TABLE VOLUNTEERLIST MODIFY
"MEMBER_NAME" NOT NULL;

ALTER TABLE VOLUNTEERLIST MODIFY
"MEMBER_TEL" NOT NULL;

ALTER TABLE VOLUNTEERLIST MODIFY
"FIELD" DEFAULT NULL;

COMMIT;




SELECT * FROM "MEMBER" m ;

CREATE SEQUENCE SEQ_BOARD_NUM NOCACHE;

BEGIN
	FOR I IN 1..50 LOOP
		
		INSERT INTO "QNABOARD"
		VALUES(SEQ_BOARD_NUM.NEXTVAL,
					 SEQ_BOARD_NUM.CURRVAL || '번째 게시글',
					 SEQ_BOARD_NUM.CURRVAL || '번째 게시글 내용 입니다',
					 SYSDATE, DEFAULT, DEFAULT, DEFAULT,1);
		
	END LOOP;
END;

COMMIT;
SELECT * FROM QNABOARD ;


SELECT ACT_NAME, TO_CHAR(REGISTRY_DATE,'YYYY-MM-DD') REGISTRY_DATE, FIELD FROM VOLUNTEERLIST 
LEFT JOIN ACTIVITY ON (ACT_NO = VOLUNTEER_NO)
WHERE MEMBER_NO = 1
ORDER BY REGISTRY_DATE ASC ;

SELECT * FROM MEMBER;
COMMIT;

SELECT * FROM QNABOARD q ;
