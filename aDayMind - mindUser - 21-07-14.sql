CREATE DATABASE amind;

use amind;

CREATE TABLE tbl_user (
	u_seq	BIGINT			auto_increment	PRIMARY KEY,
	u_prof	BIGINT 			UNIQUE,		
	u_id	VARCHAR(125)	NOT NULL	UNIQUE,
	u_pw	VARCHAR(125)	NOT NULL,	
	u_nick	VARCHAR(125)	NOT NULL	UNIQUE,
	u_mail	VARCHAR(125)	NOT NULL	UNIQUE,
	u_warning	INT DEFAULT 0,
	u_ban INT DEFAULT 0,
    u_level INT
);

CREATE TABLE tbl_userProf (
	prof_seq	BIGINT			AUTO_INCREMENT	PRIMARY KEY,
	prof_url	VARCHAR(300)		
);

CREATE TABLE tbl_writing (
	wr_seq				BIGINT			AUTO_INCREMENT	PRIMARY KEY,
	wr_user				BIGINT			NOT NULL,	
	wr_nick				VARCHAR(50)		NOT NULL,	
	wr_content			VARCHAR(3000)	NOT NULL,	
	wr_like_count		INT DEFAULT 0,		
	wr_warning_count	INT DEFAULT 0,	
	wr_write_date		TIMESTAMP DEFAULT NOW(),	
	wr_last_date		TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	
	wr_origin			VARCHAR(50)		
);

CREATE TABLE tbl_warning (
	wa_seq		BIGINT			AUTO_INCREMENT	PRIMARY KEY,
	wa_writing	BIGINT			NOT NULL,	
	wa_user		BIGINT			NOT NULL,	
	wa_content	VARCHAR(3000)	NOT NULL,	
	wa_check	INT DEFAULT 0,		
	wa_date		TIMESTAMP DEFAULT NOW()
);

ALTER TABLE tbl_warning
ADD COLUMN wa_reporter BIGINT NOT NULL ;


CREATE TABLE tbl_like (
	li_seq		BIGINT		AUTO_INCREMENT	PRIMARY KEY,
	li_wr_seq	BIGINT		NOT NULL,	
	li_fan		BIGINT		NOT NULL,	
	li_date		TIMESTAMP DEFAULT NOW()		
);

DESC tbl_writing;
DESC tbl_user;
DESC tbl_like;
DESC tbl_warning;


SELECT * FROM tbl_writing;
SELECT * FROM tbl_like;
SELECT * FROM tbl_warning;
SELECT * FROM tbl_user;
SELECT * FROM tbl_userProf;

ALTER TABLE tbl_userProf
ADD CONSTRAINT fk_prof
FOREIGN KEY (prof_seq)
REFERENCES tbl_user(u_prof)
ON DELETE CASCADE;

ALTER TABLE tbl_writing
ADD CONSTRAINT fk_wr_user
FOREIGN KEY(wr_user)
REFERENCES tbl_user(u_seq)
ON DELETE CASCADE;


ALTER TABLE tbl_warning
ADD CONSTRAINT fk_wa_writing
FOREIGN KEY(wa_writing)
REFERENCES tbl_writing(wr_seq)
ON DELETE CASCADE;


ALTER TABLE tbl_warning
ADD CONSTRAINT fk_wa_user
FOREIGN KEY(wa_user)
REFERENCES tbl_user(u_seq)
ON DELETE CASCADE;

ALTER TABLE tbl_like
ADD CONSTRAINT fk_li_writing
FOREIGN KEY(li_wr_seq)
REFERENCES tbl_writing(wr_seq)
ON DELETE CASCADE;

ALTER TABLE tbl_like
ADD CONSTRAINT fk_li_user
FOREIGN KEY(li_fan)
REFERENCES tbl_user(u_seq)
ON DELETE CASCADE;


SELECT * FROM tbl_writing
WHERE wr_user LIKE '%2%' OR wr_nick LIKE '%김%' ;

SELECT * FROM tbl_writing
		WHERE wr_content LIKE '%이%' ;
        
SELECT * FROM tbl_writing
		WHERE wr_user LIKE '%2%' OR 
				wr_nick LIKE '%2%' ;  
                
SELECT * FROM tbl_writing;            
SELECT * FROM tbl_writing
WHERE wr_last_date BETWEEN '2021-07-15 00:00:00' AND '2021-07-15 23:59:59';


DROP TABLE tbl_like;
DROP TABLE tbl_user;
DROP TABLE tbl_userprof;
DROP TABLE tbl_warning;
DROP TABLE tbl_writing;


SELECT * FROM tbl_user ;

INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test10','test10','test10test10','test10' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test11','test11','test11test11','test11' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test12','test12','test12test12','test12' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test13','test13','test13test13','test13' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test14','test14','test14test14','test14' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test15','test15','test15test15','test15' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test16','test16','test16test16','test16' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test17','test17','test17test17','test17' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test18','test18','test18test18','test18' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test19','test19','test19test19','test19' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test20','test20','test20test20','test20' );

INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test21','test21','test21test21','test21' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test22','test22','test22test22','test22' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test23','test23','test23test23','test23' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test24','test24','test24test24','test24' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test25','test25','test25test25','test25' );
INSERT INTO tbl_user (u_id, u_nick, u_pw, u_mail)
value ('test26','test26','test26test26','test26' );

select * from tbl_user;
UPDATE tbl_user
SET u_level = 0
WHERE u_id = 'admin';

UPDATE tbl_user
SET u_seq = 0
WHERE u_id = 'admin';