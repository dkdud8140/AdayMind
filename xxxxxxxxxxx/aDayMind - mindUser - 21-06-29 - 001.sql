CREATE DATABASE aDayMind ;

USE aDayMind;

CREATE TABLE tbl_user (
	u_seq	BIGINT	auto_increment	PRIMARY KEY,
	u_prof	BIGINT	,
	u_id	VARCHAR(125)	NOT NULL	UNIQUE,
	u_pw	VARCHAR(125)	NOT NULL	,
	u_nick	VARCHAR(125)	NOT NULL	UNIQUE,
	u_mail	VARCHAR(125)	NOT NULL	UNIQUE,
	u_warning	INT		
);

CREATE TABLE tbl_writing (
	wr_seq				BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	wr_user				BIGINT	NOT NULL	,
	wr_content			VARCHAR(3000)	NOT NULL	,
    wr_origin			VARCHAR(50),
	wr_like_count		INT		,
	wr_warning_count	INT		,
	wr_write_date		TIMESTAMP DEFAULT NOW(),
	wr_last_date		TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `tbl_warning` (
	wa_seq		BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	wa_writing	BIGINT	NOT NULL	,
	wa_user		BIGINT	NOT NULL	,
	wa_content	VARCHAR(3000)	NOT NULL	,
	wa_check	TINYINT(2)		,
	`wa_date`	TIMESTAMP DEFAULT NOW()
);

CREATE TABLE `tbl_like` (
	li_seq		BIGINT	AUTO_INCREMENT PRIMARY KEY,
	li_wr_seq	BIGINT	NOT NULL,
	li_fan		BIGINT	NOT NULL,
	li_date		TIMESTAMP DEFAULT NOW(),
	li_check	TINYINT(2)	
);

CREATE TABLE `tbl_userProf` (
	prof_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	prof_user	CHAR(6)	NOT NULL	,
	prof_url	VARCHAR(300)		
);

DROP TABLE tbl_user;
DROP TABLE tbl_userprof;
DROP TABLE tbl_warning;
DROP TABLE tbl_writing;
DROP TABLE tbl_like;



ALTER TABLE `tbl_user` ADD CONSTRAINT `FK_tbl_userProf_TO_tbl_user_1` FOREIGN KEY (
	`prof_seq`
)
REFERENCES `tbl_userProf` (
	`prof_seq`
);

ALTER TABLE `tbl_writing` ADD CONSTRAINT `FK_tbl_user_TO_tbl_writing_1` FOREIGN KEY (
	`wr_user`
)
REFERENCES `tbl_user` (
	`u_seq`
);

ALTER TABLE `tbl_warning` ADD CONSTRAINT `FK_tbl_writing_TO_tbl_warning_1` FOREIGN KEY (
	`wa_writing`
)
REFERENCES `tbl_writing` (
	`wr_seq`
);

ALTER TABLE `tbl_warning` ADD CONSTRAINT `FK_tbl_writing_TO_tbl_warning_2` FOREIGN KEY (
	`wa_user`
)
REFERENCES `tbl_writing` (
	`wr_user`
);

ALTER TABLE `tbl_like` ADD CONSTRAINT `FK_tbl_writing_TO_tbl_like_1` FOREIGN KEY (
	`wr_seq`
)
REFERENCES `tbl_writing` (
	`wr_seq`
);

ALTER TABLE `tbl_like` ADD CONSTRAINT `FK_tbl_writing_TO_tbl_like_2` FOREIGN KEY (
	`wr_user`
)
REFERENCES `tbl_writing` (
	`wr_user`
);

SELECT *  FROM tbl_writing ;
SELECT *  FROM tbl_user ;

INSERT INTO tbl_writing (wr_user,wr_content,wr_origin)
 VALUES (1,'인설트 실험','') ;

INSERT INTO tbl_user (u_id, u_pw, u_nick, u_mail)
VALUES ('admin','admin','관리자','mind@mind.com');
INSERT INTO tbl_user (u_id, u_pw, u_nick, u_mail)
VALUES ('user01','user01','user01','user01@mind.com');
INSERT INTO tbl_user (u_id, u_pw, u_nick, u_mail)
VALUES ('user02','user02','user02','user02@mind.com');
INSERT INTO tbl_user (u_id, u_pw, u_nick, u_mail)
VALUES ('user03','user03','user03','user03@mind.com');


update tbl_writing 
set wr_like_count = 1890
WHERE wr_seq = 10;

SELECT* FROM tbl_writing
WHERE wr_like_count > 0
ORDER BY wr_like_count ;

INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (18, 6, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (15, 6, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (13, 6, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (20, 6, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (2, 6, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (8, 6, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (11, 6, 1);

INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (18, 7, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (15, 7, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (11, 7, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (20, 7, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (6, 7, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (5, 7, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (10, 7, 1);


INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (2, 4, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (4, 4, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (6, 4, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (8, 4, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (10, 4, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (12, 4, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (14, 4, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (16, 4, 1);
INSERT INTO tbl_like ( li_wr_seq, li_fan, li_check) VALUES (18, 4, 1);

SELECT * FROM tbl_like;

CREATE VIEW view_write 
AS(
SELECT 
	W.wr_seq AS vw_seq,
    U.u_seq AS vw_user_seq,
	U.u_nick AS vw_nick,
	W.wr_content AS vw_content,
	W.wr_like_count AS vw_like_conunt,
	W.wr_warning_count AS vw_warning_conunt,
	W.wr_write_date AS vw_write_date,
	W.wr_last_date AS vw_last_date,
	W.wr_origin AS wv_origin
FROM tbl_writing W
	LEFT JOIN tbl_user U
		ON W.wr_user = U.u_seq
);

DROP VIEW view_write;

CREATE VIEW view_likelist as (
SELECT 
	L.li_wr_seq AS vl_wr_seq,
	VW.vw_nick AS vl_user,
	VW.vw_content AS vl_content,
	VW.vw_like_conunt AS vl_like_count,
	VW.vw_write_date AS vl_write_date,
    VW.vw_last_date AS vl_lst_date,
    L.li_date AS vl_like_date,
	VW.wv_origin AS vl_origin,
    U.u_nick AS vl_fan
FROM tbl_like L
	LEFT JOIN tbl_user U
		ON L.li_fan = U.u_seq
    LEFT JOIN view_write VW
		ON L.li_wr_seq = VW.vw_seq
);
        
SHOW columns FROM view_write;














