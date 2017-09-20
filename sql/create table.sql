conn /as sysdba;

create user sh identified by sh;

grant connect, resource to sh;


DROP TABLE EMPLOYEE;
DROP TABLE TEAM;
DROP TABLE CONTENT;
DROP TABLE BOARD;

/* 사원 */
CREATE TABLE EMPLOYEE (
	EMPLOYEE_NO NVARCHAR2(10) NOT NULL, /* 사번 */
	TEAM_ID NVARCHAR2(10), /* 팀ID */
	EMAIL NVARCHAR2(50), /* 이메일 */
	EMPLOYEE_NAME NVARCHAR2(50), /* 이름 */
	JOIN_DATE DATE, /* 입사일 */
	PASSWORD NVARCHAR2(50), /* 암호 */
	IS_AUTHORITY NVARCHAR2(5), /* 인증여부 */
	LAST_LOGIN DATE, /* 최근로그인 */
	POSITION_ID NVARCHAR2(10), /* 직급_ID */
	ROLE NVARCHAR2(10) /* ROLE */
);

ALTER TABLE EMPLOYEE
	ADD
		CONSTRAINT PK_EMPLOYEE
		PRIMARY KEY (
			EMPLOYEE_NO
		);

/* 팀 */
CREATE TABLE TEAM (
	TEAM_ID NVARCHAR2(10) NOT NULL, /* 팀ID */
	TEAM_NAME NVARCHAR2(50) /* 팀명 */
);

ALTER TABLE TEAM
	ADD
		CONSTRAINT PK_TEAM
		PRIMARY KEY (
			TEAM_ID
		);


/* 메세지 */
CREATE TABLE MESSAGE (
	RECEIVER_EMPLOYEE_NO NVARCHAR2(10), /* 수신인사번 */
	SENDER_EMPLOYEE_NO NVARCHAR2(10), /* 발신인사번 */
	MESSAGE_CONTENT NVARCHAR2(200), /* 내용 */
	MESSAGE_TITLE NVARCHAR2(200), /* 제목 */
	IS_READ NVARCHAR2(5), /* 확인여부 */
	WRITE_DATE DATE /* 발신일 */
);

/* 게시물 */
CREATE TABLE CONTENT (
	CONTENT_ID NVARCHAR2(20) NOT NULL, /* 게시물ID */
	EMPLOYEE_NO NVARCHAR2(10), /* 작성자사번 */
	CONTENT_TITLE NVARCHAR2(50), /* 제목 */
	CONTENT_CONTENT NVARCHAR2(2000), /* 내용 */
	TEAM_ID NVARCHAR2(10), /* 팀ID */
	BOARD_ID NVARCHAR2(10), /* 게시판ID */
	WRITE_DATE DATE /* 작성일 */
);

ALTER TABLE CONTENT
	ADD
		CONSTRAINT PK_CONTENT
		PRIMARY KEY (
			CONTENT_ID
		);

/* 게시판 */
CREATE TABLE BOARD (
	BOARD_ID NVARCHAR2(10) NOT NULL, /* 게시판ID */
	BOARD_NAME NVARCHAR2(50), /* 게시판명 */
	BOARD_AUTHORITY NVARCHAR2(10), /* 접근권한 */
	IS_TEAM NVARCHAR2(5) /* 팀전용여부 */
);

ALTER TABLE BOARD
	ADD
		CONSTRAINT PK_BOARD
		PRIMARY KEY (
			BOARD_ID
		);

/* 댓글 */
CREATE TABLE REPLY (
	CONTENT_ID NVARCHAR2(20), /* 게시물ID */
	EMPLOYEE_NO NVARCHAR2(10), /* 작성자사번 */
	WRITE_DATE DATE, /* 작성시간 */
	REPLY_CONTENT NVARCHAR2(200) /* 댓글내용 */
);

/* 직급 */
CREATE TABLE POSITION (
	POSITION_ID NVARCHAR2(10) NOT NULL, /* 직급_ID */
	POSITION_NAME NVARCHAR2(50) /* 직급명 */
);

ALTER TABLE POSITION
	ADD
		CONSTRAINT PK_POSITION
		PRIMARY KEY (
			POSITION_ID
		);



INSERT INTO TEAM VALUES('DEV01','개발1팀');
INSERT INTO TEAM VALUES('DEV02','개발2팀');
INSERT INTO TEAM VALUES('DEV03','개발3팀');
INSERT INTO TEAM VALUES('DEV04','개발4팀');

INSERT INTO BOARD VALUES('NOTICE','공지사항',3,'N');
INSERT INTO BOARD VALUES('FREE','자유게시판',10,'N');
INSERT INTO BOARD VALUES('TEAM','팀게시판',10,'Y');


INSERT INTO POSITION VALUES('1','사장');
INSERT INTO POSITION VALUES('2','부사장');
INSERT INTO POSITION VALUES('3','전무');
INSERT INTO POSITION VALUES('4','상무');
INSERT INTO POSITION VALUES('5','이사');
INSERT INTO POSITION VALUES('6','부장');
INSERT INTO POSITION VALUES('7','차장');
INSERT INTO POSITION VALUES('8','과장');
INSERT INTO POSITION VALUES('9','대리');
INSERT INTO POSITION VALUES('10','사원');

INSERT INTO 
EMPLOYEE(
		EMPLOYEE_NO,
		TEAM_ID,
		EMAIL,
		EMPLOYEE_NAME,
		JOIN_DATE,
		POSITION_ID,
		PASSWORD,
		IS_AUTHORITY,
		ROLE,
		LAST_LOGIN) 
VALUES (
		'2016122910',
		'DEV02',	
		'tkdgjs1501@nate.com',
		'김상헌',
		SYSDATE,
		'10',
		'ADMIN',
		'Y',
		'ADMIN',
		SYSDATE
		)
		
		
INSERT INTO 
EMPLOYEE(
		EMPLOYEE_NO,
		TEAM_ID,
		EMAIL,
		EMPLOYEE_NAME,
		JOIN_DATE,
		POSITION_ID,
		PASSWORD,
		IS_AUTHORITY,
		ROLE,
		LAST_LOGIN) 
VALUES (
		'1',
		'DEV01',	
		'tkdgjs1501@nate.com',
		'사장',
		SYSDATE,
		'1',
		'1',
		'Y',
		'ADMIN',
		SYSDATE
		)

				
