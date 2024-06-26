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
ALTER TABLE "MEMBER" MODIFY "MEMBER_ID" NVARCHAR2(100); -- 네이버 로그인때문에 MEMBER_ID 자료형 변경
SELECT * FROM MEMBER;

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원번호 (PK)';

COMMENT ON COLUMN "MEMBER"."MEMBER_NAME" IS '회원이름';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 이메일';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_TEL" IS '회원 전화번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_ADDRESS" IS '회원 주소';

COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '가입날짜';

COMMENT ON COLUMN "MEMBER"."MEMBER_DEL_FL" IS '회원탈퇴여부';

COMMENT ON COLUMN "MEMBER"."AUTHORITY" IS '회원권한(1:일반회원, 2:관리자)';


----------------------------------후원

CREATE TABLE "MONEY_DONATION" (
	"MONEY_DONATION_NO"	NUMBER		NOT NULL,
	"MONEY_DONATION_TOTAL"	NUMBER	DEFAULT 0	NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_EMAIL" NVARCHAR2(50) NOT NULL,
	"MEMBER_TEL" CHAR(11) NOT NULL
);

COMMENT ON COLUMN "MONEY_DONATION"."MONEY_DONATION_NO" IS '후원신청번호';

COMMENT ON COLUMN "MONEY_DONATION"."MONEY_DONATION_TOTAL" IS '후원총금액';

COMMENT ON COLUMN "MONEY_DONATION"."MEMBER_NO" IS '회원번호 (PK)';

----------------------------------활동 정보


CREATE TABLE "ACTIVITY" (
	"ACT_NO"	NUMBER		NOT NULL,
	"ACT_NAME"	NVARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "ACTIVITY"."ACT_NO" IS '활동번호(PK)';

COMMENT ON COLUMN "ACTIVITY"."ACT_NAME" IS '활동이름';

----------------------------------댓글

CREATE TABLE "COMMENT" (
	"COMMENT_NO"	NUMBER		NOT NULL,
	"COMMENT_CONTENT"	NVARCHAR2(500)		NOT NULL,
	"COMMENT_WRITE_DATE"	DATE		NOT NULL,
	"COMMENT_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"ORIGINAL_COMMENT_NO"	NUMBER	
);

COMMENT ON COLUMN "COMMENT"."COMMENT_NO" IS '댓글 번호';

COMMENT ON COLUMN "COMMENT"."COMMTENT_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "COMMENT"."COMMENT_WRITE_DATE" IS '댓글 작성일';

COMMENT ON COLUMN "COMMENT"."COMMENT_DEL_FL" IS '댓글 삭제 여부 (Y/N)';

COMMENT ON COLUMN "COMMENT"."MEMBER_NO" IS '회원번호 (PK)';

COMMENT ON COLUMN "COMMENT"."BOARD_NO" IS '게시글번호(PK)';

COMMENT ON COLUMN "COMMENT"."ORIGINAL_COMMENT_NO" IS '부모댓글 번호';

-----------------------------------------후기 게시판

CREATE TABLE "QNABOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	NVARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	NVARCHAR2(2000)		NOT NULL,
	"BOARD_WRITE_DATE"	DATE		NOT NULL,
	"BOARD_UPDATE_DATE"	DATE,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"BOARD_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "QNABOARD"."BOARD_NO" IS '게시글번호(PK)';

COMMENT ON COLUMN "QNABOARD"."BOARD_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "QNABOARD"."BOARD_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "QNABOARD"."BOARD_WRITE_DATE" IS '게시글 작성일';

COMMENT ON COLUMN "QNABOARD"."BOARD_UPDATE_DATE" IS '게시글 마지막 수정일';

COMMENT ON COLUMN "QNABOARD"."READ_COUNT" IS '조회수';

COMMENT ON COLUMN "QNABOARD"."BOARD_DEL_FL" IS '게시글 삭제여부 (Y/N)';

COMMENT ON COLUMN "QNABOARD"."MEMBER_NO" IS '회원번호 (PK)';

------------------------------------ 활동신청 정보

CREATE TABLE "VOLUNTEERLIST" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"VOLUNTEER_NO"	NUMBER		NOT NULL,
	"REGISTRY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMBER_NAME" NVARCHAR2(10) NOT NULL,
	"MEMBER_TEL" CHAR(11) NOT NULL,
	"FIELD" NVARCHAR2(30) DEFAULT NULL
);

COMMENT ON COLUMN "VOLUNTEERLIST"."MEMBER_NO" IS '회원번호 (PK)';

COMMENT ON COLUMN "VOLUNTEERLIST"."VOLUNTEER_NO" IS '봉사번호(PK)';

COMMENT ON COLUMN "VOLUNTEERLIST"."REGISTRY_DATE" IS '봉사신청일';


----------------------------------------IMG TABLE
CREATE TABLE "BOARD_IMG" (
	"IMG_NO"	NUMBER		NOT NULL,
	"IMG_PATH"	VARCHAR2(200)		NOT NULL,
	"IMG_ORIGINAL_NAME"	NVARCHAR2(50)		NOT NULL,
	"IMG_RENAME"	NVARCHAR2(50)		NOT NULL,
	"IMG_ORDER"	NUMBER		NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

-------------------------------------------

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


ALTER TABLE "VOLUNTEERLIST" ADD CONSTRAINT "FK_MEMBER_TO_VOLUNTEERLIST_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE VOLUNTEERLIST ADD CONSTRAINT "FK_VOlUNTEER_TO_VOLUNTEERLIST_1" FOREIGN KEY (
	"VOLUNTEER_NO"
)
REFERENCES "ACTIVITY" (
	"ACT_NO"
);
--------------------------------------------------------------------

---------------------SEQUNCE 모음----------------------------------
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;   -- MEMBER_NO  SEQUENCE

CREATE SEQUENCE SEQ_MONEY_DONATION_NO NOCACHE;  -- MONEY_DONATION_NO SEQUENCE


CREATE SEQUENCE SEQ_BOARD_NUM NOCACHE; -- BOARD_NO SEQUENCE


CREATE SEQUENCE SEQ_IMG_NO NOCACHE; -- IMG_NO SEQUENCE


CREATE SEQUENCE SEQ_COMMENT_NO NOCACHE; -- COMMENT_NO SEQUENCE


---------------------------  활동정보 INSERT -----------
INSERT INTO ACTIVITY VALUES (1,'연탄봉사');
INSERT INTO ACTIVITY VALUES (2,'재능 기부 봉사');
INSERT INTO ACTIVITY VALUES (3,'자택 방문 봉사');




CREATE OR REPLACE FUNCTION NEXT_IMG_NO    -- NEXT_IMG_NO FUNCTION만들기

-- 반환형
RETURN NUMBER

-- 사용할 변수
IS IMG_NO NUMBER;

BEGIN
	SELECT SEQ_IMG_NO.NEXTVAL
	INTO IMG_NO
	FROM DUAL;

	RETURN IMG_NO;
END;

