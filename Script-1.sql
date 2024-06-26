CREATE TABLE "ITEM_IMG" (
	"IMG_NO"	NUMBER		NOT NULL,
	"IMG_PATH"	NVARCHAR2(300)		NOT NULL,
	"IMG_ORIGINAL_NAME"	NVARCHAR2(300)		NOT NULL,
	"IMG_RENAME"	NVARCHAR2(300)		NOT NULL,
	"IMG_ORDER"	NUMBER	DEFAULT 0	NOT NULL,
	"ITEM_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "ITEM_IMG"."IMG_NO" IS '이미지 번호';

COMMENT ON COLUMN "ITEM_IMG"."IMG_PATH" IS '이미지 경로';

COMMENT ON COLUMN "ITEM_IMG"."IMG_ORIGINAL_NAME" IS '이미지 원본 이름';

COMMENT ON COLUMN "ITEM_IMG"."IMG_RENAME" IS '이미지 변경 이름';

COMMENT ON COLUMN "ITEM_IMG"."IMG_ORDER" IS '이미지 순서';

COMMENT ON COLUMN "ITEM_IMG"."ITEM_NO" IS '상품 고유 번호(FK)';

CREATE TABLE "ITEM_CATEGORY" (
	"CATEGORY_CODE"	NUMBER		NOT NULL,
	"CATEGORY_NAME"	NVARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "ITEM_CATEGORY"."CATEGORY_CODE" IS '상품 카데고리 번호(PK)';

COMMENT ON COLUMN "ITEM_CATEGORY"."CATEGORY_NAME" IS '상품 카테고리명(자동차, 캠핑용품)';

CREATE TABLE "ITEM" (
	"ITEM_NO"	NUMBER		NOT NULL,
	"CATEGORY_CODE"	NUMBER		NOT NULL,
	"ITEM_VIEW_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"ITEM_DETAIL_CONTENT"	NVARCHAR2(300)		NULL
);

COMMENT ON COLUMN "ITEM"."ITEM_NO" IS '상품 고유 번호(PK)';

COMMENT ON COLUMN "ITEM"."CATEGORY_CODE" IS '상품 카데고리 번호(FK)';

COMMENT ON COLUMN "ITEM"."ITEM_VIEW_COUNT" IS '상품 조회수';

COMMENT ON COLUMN "ITEM"."ITEM_DETAIL_CONTENT" IS '상품 세부 정보';

CREATE TABLE "CAR" (
	"ITEM_NO"	NUMBER		NOT NULL,
	"CAR_GRADE_NO"	NUMBER		NOT NULL,
	"CAR_PASSENGERS"	NUMBER		NOT NULL,
	"CAR_SLEEP_CAPACITY"	NUMBER		NOT NULL,
	"CAR_NAME"	NVARCHAR2(30)		NOT NULL,
	"CAR_RENT_PRICE"	NUMBER		NOT NULL,
	"CAR_FUEL"	NVARCHAR2(30)	DEFAULT 'GASOLINE'	NOT NULL
);

COMMENT ON COLUMN "CAR"."ITEM_NO" IS '상품 고유 번호(PK)';

COMMENT ON COLUMN "CAR"."CAR_GRADE_NO" IS '차급 번호(FK)';

COMMENT ON COLUMN "CAR"."CAR_PASSENGERS" IS '자동차 최대 탑승 인원';

COMMENT ON COLUMN "CAR"."CAR_SLEEP_CAPACITY" IS '취침 가능 인원';

COMMENT ON COLUMN "CAR"."CAR_NAME" IS '자동차 이름';

COMMENT ON COLUMN "CAR"."CAR_RENT_PRICE" IS '자동차 대여 비용';

COMMENT ON COLUMN "CAR"."CAR_FUEL" IS '차 유종 정보 (GASOLINE, DIESEL, LPG)';

CREATE TABLE "CAMP_EQUIPMENT" (
	"ITEM_NO"	NUMBER		NOT NULL,
	"EQUIPMENT_CATEGORY_CODE"	NUMBER		NOT NULL,
	"EQUIPMENT_NAME"	NVARCHAR2(100)		NOT NULL,
	"EQUIPMENT_RENT_PRICE"	NUMBER		NOT NULL,
	"EQUIPMENT_RENT_COUNT"	NUMBER		NOT NULL,
	"EQUIPMENT_SELL_PRICE"	NUMBER		NOT NULL,
	"EQUIPMENT_SELL_COUNT"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "CAMP_EQUIPMENT"."ITEM_NO" IS '상품 고유 번호(PK)';

COMMENT ON COLUMN "CAMP_EQUIPMENT"."EQUIPMENT_CATEGORY_CODE" IS '장비 카테고리 번호(FK)';

COMMENT ON COLUMN "CAMP_EQUIPMENT"."EQUIPMENT_NAME" IS '장비이름';

COMMENT ON COLUMN "CAMP_EQUIPMENT"."EQUIPMENT_RENT_PRICE" IS '장비 대여 가격';

COMMENT ON COLUMN "CAMP_EQUIPMENT"."EQUIPMENT_RENT_COUNT" IS '장비 대여 재고';

COMMENT ON COLUMN "CAMP_EQUIPMENT"."EQUIPMENT_SELL_PRICE" IS '장비 판매 가격';

COMMENT ON COLUMN "CAMP_EQUIPMENT"."EQUIPMENT_SELL_COUNT" IS '장비 판매 재고';

CREATE TABLE "EQUIPMENT_CATEGORY" (
	"EQUIPMENT_CATEGORY_CODE"	NUMBER		NOT NULL,
	"EQUIPMENT_CATEGORY_NAME"	NVARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "EQUIPMENT_CATEGORY"."EQUIPMENT_CATEGORY_CODE" IS '장비 카테고리 번호(PK)';

COMMENT ON COLUMN "EQUIPMENT_CATEGORY"."EQUIPMENT_CATEGORY_NAME" IS '장비 카테고리 이름';

CREATE TABLE "PACKAGE" (
	"PACKAGE_NO"	NUMBER		NOT NULL,
	"PACKAGE_PRICE"	NUMBER		NOT NULL,
	"PACKAGE_NAME"	NVARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "PACKAGE"."PACKACE_NO" IS '패키지 번호(PK)';

COMMENT ON COLUMN "PACKAGE"."PACKAGE_PRICE" IS '패키지 대여 가격';

COMMENT ON COLUMN "PACKAGE"."PACKAGE_NAME" IS '패키지명';

CREATE TABLE "PACKAGE_DETAIL" (
	"PACKAGE_DETAIL_NO"	NUMBER		NOT NULL,
	"PACKAGE_NO"	NUMBER		NOT NULL,
	"ITEM_NO"	NUMBER		NOT NULL,
	"PACKAGE_ITEM_COUNT"	NUMBER	DEFAULT 1	NOT NULL,
	"CAR_LOCATION_NO"	NUMBER		NULL
);

ALTER TABLE PACKAGE_DETAIL RENAME COLUMN "PACKACE_NO" TO "PACKAGE_NO";
COMMIT;

COMMENT ON COLUMN "PACKAGE_DETAIL"."PACKAGE_DETAIL_NO" IS '패키지 상세 번호(PK)';

COMMENT ON COLUMN "PACKAGE_DETAIL"."PACKACE_NO" IS '상품 고유 번호(PK)';

COMMENT ON COLUMN "PACKAGE_DETAIL"."ITEM_NO" IS '상품 고유 번호(FK)';

COMMENT ON COLUMN "PACKAGE_DETAIL"."PACKAGE_ITEM_COUNT" IS '상품 수량';

COMMENT ON COLUMN "PACKAGE_DETAIL"."CAR_LOCATION_NO" IS '차고지 번호(FK)';

CREATE TABLE "CAR_LOCATION" (
	"CAR_LOCATION_NO"	NUMBER		NOT NULL,
	"CAR_LOCATION_NAME"	NVARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "CAR_LOCATION"."CAR_LOCATION_NO" IS '차고지 번호(PK)';

COMMENT ON COLUMN "CAR_LOCATION"."CAR_LOCATION_NAME" IS '차고지 이름';

CREATE TABLE "CAR_STOCK" (
	"CAR_STOCK_NO"	NUMBER		NOT NULL,
	"ITEM_NO"	NUMBER		NOT NULL,
	"CAR_ID"	NVARCHAR2(10)		NOT NULL,
	"CAR_RENT_CHECK"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"CAR_LOCATION_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "CAR_STOCK"."CAR_STOCK_NO" IS '자동차 재고 번호(PK)';

COMMENT ON COLUMN "CAR_STOCK"."ITEM_NO" IS '상품 고유 번호(FK)';

COMMENT ON COLUMN "CAR_STOCK"."CAR_ID" IS '차량 번호';

COMMENT ON COLUMN "CAR_STOCK"."CAR_RENT_CHECK" IS '자동차 대여 여부';

COMMENT ON COLUMN "CAR_STOCK"."CAR_LOCATION_NO" IS '차고지 번호(PK)';

CREATE TABLE "CAR_GRADE" (
	"CAR_GRADE_NO"	NUMBER		NOT NULL,
	"CAR_GRADE_NAME"	NVARCHAR2(5)		NULL
);

COMMENT ON COLUMN "CAR_GRADE"."CAR_GRADE_NO" IS '차급 번호(PK)';

COMMENT ON COLUMN "CAR_GRADE"."CAR_GRADE_NAME" IS '차급(소형, 중형, 대형, 캠핑카)';

----------------------------------------------------------------------------------

INSERT INTO ITEM_CATEGORY
VALUES(
	1, '자동차'
);
INSERT INTO ITEM_CATEGORY
VALUES(
	2, '캠핑용품'
);
INSERT INTO ITEM_CATEGORY
VALUES(
	3, '패키지'
);

SELECT ROUND(DBMS_RANDOM.VALUE(1, 3)) FROM DUAL;

-- 전체상품관리 테이블 샘플
BEGIN
   FOR I IN 1..60 LOOP
	INSERT INTO "ITEM"
	VALUES(
	   I, ROUND(DBMS_RANDOM.VALUE(1, 3)), DEFAULT, '상품 정보' || I
	);
   END LOOP;
END;


-- 차급
INSERT INTO CAR_GRADE
VALUES (
	1, '소형'
);
INSERT INTO CAR_GRADE
VALUES (
	2, '중형'
);
INSERT INTO CAR_GRADE
VALUES (
	3, '대형'
);
INSERT INTO CAR_GRADE
VALUES (
	4, '캠핑카'
);


-- 캠핑용품 카테고리
INSERT INTO EQUIPMENT_CATEGORY
VALUES (
	1, '텐트'
);
INSERT INTO EQUIPMENT_CATEGORY
VALUES (
	2, '화로'
);
INSERT INTO EQUIPMENT_CATEGORY
VALUES (
	3, '침낭/매트'
);
INSERT INTO EQUIPMENT_CATEGORY
VALUES (
	4, '보관함'
);
INSERT INTO EQUIPMENT_CATEGORY
VALUES (
	5, '취사용품'
);
INSERT INTO EQUIPMENT_CATEGORY
VALUES (
	6, '캠핑의자'
);
INSERT INTO EQUIPMENT_CATEGORY
VALUES (
	7, '캠핑테이블'
);
INSERT INTO EQUIPMENT_CATEGORY
VALUES (
	8, '랜턴/조명기구'
);
INSERT INTO EQUIPMENT_CATEGORY
VALUES (
	9, '멀티툴'
);


-- 차고지
INSERT INTO CAR_LOCATION
VALUES (
	1, '서울'
);
INSERT INTO CAR_LOCATION
VALUES (
	2, '경기도'
);
INSERT INTO CAR_LOCATION
VALUES (
	3, '강원도'
);
INSERT INTO CAR_LOCATION
VALUES (
	4, '충청북도'
);
INSERT INTO CAR_LOCATION
VALUES (
	5, '충청남도'
);
INSERT INTO CAR_LOCATION
VALUES (
	6, '경상북도'
);
INSERT INTO CAR_LOCATION
VALUES (
	7, '경상남도'
);
INSERT INTO CAR_LOCATION
VALUES (
	8, '전라북도'
);
INSERT INTO CAR_LOCATION
VALUES (
	9, '전라남도'
);
INSERT INTO CAR_LOCATION
VALUES (
	10, '제주도'
);


-- 캠핑용품
SELECT COUNT(*) FROM ITEM i GROUP BY CATEGORY_CODE ;

DECLARE
	RAN_NO NUMBER;
BEGIN
   	FOR I IN (SELECT ITEM_NO FROM ITEM WHERE CATEGORY_CODE=2) LOOP
	   	SELECT ROUND(DBMS_RANDOM.VALUE(1, 9)) INTO RAN_NO
	    FROM DUAL;
	   	
		INSERT INTO CAMP_EQUIPMENT
		VALUES(
		   I.ITEM_NO, RAN_NO, 
		   (SELECT EQUIPMENT_CATEGORY_NAME 
			   FROM EQUIPMENT_CATEGORY 
			   WHERE EQUIPMENT_CATEGORY_CODE = RAN_NO) || I.ITEM_NO,
			   ROUND(DBMS_RANDOM.VALUE(1, 3)) * 10000, ROUND(DBMS_RANDOM.VALUE(0, 10)),
			   ROUND(DBMS_RANDOM.VALUE(1, 3)) * 100000, ROUND(DBMS_RANDOM.VALUE(0, 10))
		);
	END LOOP;
END;


-- 차종
DECLARE
	RAN_NO NUMBER; -- 차급 설정용 랜덤 넘버
BEGIN
   	FOR I IN (SELECT ITEM_NO FROM ITEM WHERE CATEGORY_CODE=1) LOOP
	   	SELECT ROUND(DBMS_RANDOM.VALUE(1, 4)) INTO RAN_NO
	    FROM DUAL;
	   	
		INSERT INTO CAR
		VALUES(
		   I.ITEM_NO, RAN_NO, RAN_NO * 2, RAN_NO * 2, '차종' || I.ITEM_NO,
		   RAN_NO * 100000, 'GASOLINE'
		);
	END LOOP;
END;

CREATE SEQUENCE CAR_STOCK_NO;

-- 자동차 재고
DECLARE
	RAN_NO NUMBER; -- 차급 설정용 랜덤 넘버
BEGIN
	FOR J IN 1..3 LOOP
   	  FOR I IN (SELECT ITEM_NO FROM CAR) LOOP
	   	SELECT ROUND(DBMS_RANDOM.VALUE(1, 10)) INTO RAN_NO FROM DUAL;
	   	  
		INSERT INTO CAR_STOCK
		VALUES(
		   CAR_STOCK_NO.NEXTVAL, I.ITEM_NO, TO_CHAR(CAR_STOCK_NO.CURRVAL, 'FM0000'),
		   'N', RAN_NO
		);
	  END LOOP;
	END LOOP;
END;



-- 패키지
DECLARE
	RAN_NO NUMBER; -- 차급 설정용 랜덤 넘버
BEGIN
   	FOR I IN (SELECT ITEM_NO FROM ITEM WHERE CATEGORY_CODE=3) LOOP
	   	SELECT ROUND(DBMS_RANDOM.VALUE(1, 4)) INTO RAN_NO
	    FROM DUAL;
	   	
		INSERT INTO "PACKAGE"
		VALUES(
		   I.ITEM_NO, ROUND(DBMS_RANDOM.VALUE(5, 10)) * 100000, '패키지' || I.ITEM_NO
		);
	END LOOP;
END;


-- 패키지 상세


COMMIT;


SELECT * FROM ITEM;


-- 패키지 상세 
-- 차 추가
CREATE SEQUENCE SEQ_PACKAGE_DETAIL_NO;

DECLARE
   RAN_CAR NUMBER;
   RAN_LOC NUMBER;
BEGIN
      FOR I IN (SELECT PACKAGE_NO FROM "PACKAGE") LOOP
      
         -- 랜덤 차번호
         SELECT ITEM_NO INTO RAN_CAR
         FROM (SELECT ITEM_NO FROM ITEM
                  WHERE CATEGORY_CODE = 1 
                  ORDER BY DBMS_RANDOM.VALUE)
         WHERE ROWNUM = 1;
      
      -- 랜덤 지역번호
         SELECT CAR_LOCATION_NO INTO RAN_LOC
         FROM (SELECT CAR_LOCATION_NO FROM CAR_LOCATION
                  ORDER BY DBMS_RANDOM.VALUE)
         WHERE ROWNUM = 1;
         
      INSERT INTO PACKAGE_DETAIL
      VALUES(
         SEQ_PACKAGE_DETAIL_NO.NEXTVAL, I.PACKAGE_NO, RAN_CAR, 5, RAN_LOC
      );
   END LOOP;
END;

CREATE TABLE "REVIEW" (
   "REVIEW_NO"   NUMBER      NOT NULL,
   "REVIEW_CONTENT"   NVARCHAR2(300)      NULL,
   "REVIEW_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "ITEM_NO"   NUMBER      NOT NULL,
   "MEMBER_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "REVIEW"."REVIEW_NO" IS '후기 번호';

COMMENT ON COLUMN "REVIEW"."REVIEW_CONTENT" IS '후기 내용';

COMMENT ON COLUMN "REVIEW"."REVIEW_DATE" IS '후기 작성일';

COMMENT ON COLUMN "REVIEW"."ITEM_NO" IS '상품 고유 번호(FK)';

COMMENT ON COLUMN "REVIEW"."MEMBER_NO" IS '회원 번호(FK)';

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
   "REVIEW_NO"
);



COMMIT;



SELECT * FROM REVIEW;

CREATE TABLE "MEMBER" (
   "MEMBER_NO"   NUMBER      NOT NULL,
   "MEMBER_ID"   NVARCHAR2(100)      NULL,
   "MEMBER_PW"   NVARCHAR2(300)      NULL,
   "MEMBER_EMAIL"   NVARCHAR2(100)      NULL,
   "MEMBER_NICK_NAME"   NVARCHAR2(100)      NULL,
   "MEMBER_ADDRESS"   NVARCHAR2(150)      NULL,
   "ENROLL_DATE"   DATE   DEFAULT SYSDATE   NULL,
   "MEMBER_DEL_FL"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "MEMBER_NAME"   NVARCHAR2(10)      NULL,
   "PROFILE_IMG"   NVARCHAR2(300)      NULL,
   "MEMBER_PHONE_NO"   NVARCHAR2(15)      NULL,
   "MEMBER_BIRTH"   NVARCHAR2(30)      NULL,
   "LICENSE"   CHAR(1)   DEFAULT 'N'   NULL,
   "MEMBER_NO2"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원 번호(PK)';

COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '아이디';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '비밀번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원이메일';

COMMENT ON COLUMN "MEMBER"."MEMBER_NICK_NAME" IS '닉네임';

COMMENT ON COLUMN "MEMBER"."MEMBER_ADDRESS" IS '주소';

COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '가입일';

COMMENT ON COLUMN "MEMBER"."MEMBER_DEL_FL" IS '삭제여부';

COMMENT ON COLUMN "MEMBER"."MEMBER_NAME" IS '실명';

COMMENT ON COLUMN "MEMBER"."PROFILE_IMG" IS '프로필이미지';

COMMENT ON COLUMN "MEMBER"."MEMBER_PHONE_NO" IS '전화번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_BIRTH" IS '출생년도';

COMMENT ON COLUMN "MEMBER"."LICENSE" IS '운전면허식별번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_NO2" IS '회원 번호(PK)';

CREATE TABLE "AUTH" (
   "AUTH_NO"   NUMBER      NOT NULL,
   "AUTH_KEY"   NVARCHAR2(20)      NOT NULL,
   "AUTH_METHOD"   NVARCHAR2(250)      NOT NULL
);

COMMENT ON COLUMN "AUTH"."AUTH_NO" IS '번호';

COMMENT ON COLUMN "AUTH"."AUTH_KEY" IS '이메일/문자 인증번호';

COMMENT ON COLUMN "AUTH"."AUTH_METHOD" IS '인증방법(전화번호 혹은 이메일)';

CREATE TABLE "MEMBER_IMG" (
   "IMG_NO"   NUMBER      NOT NULL,
   "IMG_PATH"   NVARCHAR2(300)      NOT NULL,
   "IMG_ORIGINAL_NAME"   NVARCHAR2(300)      NOT NULL,
   "IMG_RENAME"   NVARCHAR2(300)      NOT NULL,
   "MEMBER_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "MEMBER_IMG"."IMG_NO" IS '이미지 번호';

COMMENT ON COLUMN "MEMBER_IMG"."IMG_PATH" IS '이미지 경로';

COMMENT ON COLUMN "MEMBER_IMG"."IMG_ORIGINAL_NAME" IS '이미지 원본 이름';

COMMENT ON COLUMN "MEMBER_IMG"."IMG_RENAME" IS '이미지 변경 이름';

COMMENT ON COLUMN "MEMBER_IMG"."MEMBER_NO" IS '회원 번호(PK)';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
   "MEMBER_NO"
);

ALTER TABLE "AUTH" ADD CONSTRAINT "PK_AUTH" PRIMARY KEY (
   "AUTH_NO"
);

ALTER TABLE "MEMBER_IMG" ADD CONSTRAINT "PK_MEMBER_IMG" PRIMARY KEY (
   "IMG_NO"
);


SELECT * FROM MEMBER;


ALTER TABLE "MEMBER" DROP COLUMN "MEMBER_NO2";
COMMIT;



CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;
COMMIT;

-- 용품 추가
DECLARE
   RAN_LOC NUMBER;
BEGIN
   FOR I IN (SELECT PACKAGE_NO FROM PACKAGE_DETAIL) LOOP
      FOR J IN (SELECT ITEM_NO 
               FROM (
                   SELECT EQUIPMENT_CATEGORY_CODE, ITEM_NO,
                          ROW_NUMBER() OVER (PARTITION BY EQUIPMENT_CATEGORY_CODE ORDER BY DBMS_RANDOM.VALUE) AS RN
                   FROM CAMP_EQUIPMENT ce 
               )
               WHERE RN = 1
               AND ROWNUM < ROUND(DBMS_RANDOM.VALUE(2, 5))
               ORDER BY DBMS_RANDOM.VALUE) LOOP
         
         -- 랜덤 지역번호
            SELECT CAR_LOCATION_NO INTO RAN_LOC
            FROM (SELECT CAR_LOCATION_NO FROM CAR_LOCATION
                     ORDER BY DBMS_RANDOM.VALUE)
         WHERE ROWNUM = 1;
                  
         INSERT INTO PACKAGE_DETAIL
         VALUES (
            SEQ_PACKAGE_DETAIL_NO.NEXTVAL, I.PACKAGE_NO, J.ITEM_NO, 2, RAN_LOC
         );
      END LOOP;
   END LOOP;
END;




SELECT * FROM ITEM_IMG ii ;
INSERT INTO ITEM_IMG VALUES (1,'/image/item/','1.avif','20240605143013_00001.avif',0,52);
INSERT INTO ITEM_IMG VALUES (2,'/image/item/','2.avif','20240605143013_00002.avif',1,52);
INSERT INTO ITEM_IMG VALUES (3,'/image/item/','3.avif','20240605143013_00003.avif',2,52);
INSERT INTO ITEM_IMG VALUES (4,'/image/item/','4.avif','20240605143013_00004.avif',3,52);

SELECT * FROM REVIEW;

INSERT INTO REVIEW VALUES (1,'좋아요',DEFAULT,52,1);
INSERT INTO REVIEW VALUES (2,'굳굳',DEFAULT,52,1);
INSERT INTO REVIEW VALUES (3,'화이팅',DEFAULT,52,1);

COMMIT;

SELECT * FROM CAR;
DELETE FROM CAR WHERE ITEM_NO = 5;
INSERT INTO CAR VALUES (5,4,8,8,'차종5',400000,'GASOLINE');

SELECT * FROM CAMP_EQUIPMENT ce ;

		SELECT EQUIPMENT_NAME, EQUIPMENT_RENT_PRICE, ITEM_VIEW_COUNT, EQUIPMENT_SELL_PRICE 
		FROM (SELECT EQUIPMENT_NAME, EQUIPMENT_RENT_PRICE, EQUIPMENT_SELL_PRICE FROM CAMP_EQUIPMENT NATURAL JOIN ITEM ORDER BY ITEM_VIEW_COUNT DESC)
		NATURAL JOIN ITEM 
		WHERE ITEM_NO != 3
		AND ROWNUM <=4;

	SELECT * FROM "PACKAGE";
	
SELECT PACKAGE_NO ITEM_NO, PACKAGE_PRICE, PACKAGE_NAME
FROM (SELECT PACKAGE_NO, PACKAGE_PRICE, PACKAGE_NAME FROM "PACKAGE"  JOIN ITEM ON (ITEM_NO = PACKAGE_NO) ORDER BY ITEM_VIEW_COUNT DESC)
WHERE PACKAGE_NO != 2
AND ROWNUM <=4;

SELECT * FROM ITEM_IMG ii ;


		SELECT PACKAGE_NO ITEM_NO, PACKAGE_PRICE, PACKAGE_NAME
		FROM (SELECT PACKAGE_NO, PACKAGE_PRICE, PACKAGE_NAME FROM "PACKAGE"  JOIN ITEM ON (ITEM_NO = PACKAGE_NO) ORDER BY ITEM_VIEW_COUNT DESC)
		JOIN PACKAGE_DETAIL PD USING ("PACKAGE_NO")
		WHERE PACKAGE_NO != 2;
		
	
		SELECT ITEM_NO, EQUIPMENT_NAME, EQUIPMENT_RENT_PRICE, ITEM_VIEW_COUNT, EQUIPMENT_SELL_PRICE 
		FROM (SELECT ITEM_NO, EQUIPMENT_NAME, EQUIPMENT_RENT_PRICE, EQUIPMENT_SELL_PRICE FROM CAMP_EQUIPMENT NATURAL JOIN ITEM ORDER BY ITEM_VIEW_COUNT DESC)
		NATURAL JOIN ITEM
		WHERE ITEM_NO != 60
		AND ROWNUM <=4;

	SELECT * FROM CAMP_EQUIPMENT ce ;
	SELECT * FROM ITEM;
SELECT * FROM PACKAGE_DETAIL pd ;
	
	SELECT PACKAGE_NO ITEM_NO, PACKAGE_PRICE, PACKAGE_NAME 
	FROM (SELECT ROWNUM, PACKAGE_NO, PACKAGE_PRICE, PACKAGE_NAME FROM "PACKAGE" JOIN ITEM ON (ITEM_NO = PACKAGE_NO) ORDER BY ITEM_VIEW_COUNT DESC)
	JOIN PACKAGE_DETAIL PD USING ("PACKAGE_NO")
	WHERE #{itemNo} IN PD.ITEM_NO
	AND ROWNUM <=4;

SELECT * FROM ITEM;

		SELECT ITEM_NO, EQUIPMENT_NAME, EQUIPMENT_RENT_PRICE, ITEM_VIEW_COUNT, EQUIPMENT_SELL_PRICE , EQUIPMENT_CATEGORY_NAME, ITEM_DETAIL_CONTENT
			(SELECT IMG_PATH || IMG_RENAME
			 FROM ITEM_IMG
			 WHERE ITEM_NO =2
			 AND  IMG_ORDER = 0) THUMBNAIL
		FROM CAMP_EQUIPMENT 
		NATURAL JOIN ITEM 
		NATURAL JOIN EQUIPMENT_CATEGORY 
		WHERE ITEM_NO = 2;
	SELECT * FROM REVIEW r ;
