﻿DROP TABLE
IF EXISTS MYCAT_SEQUENCE;

CREATE TABLE MYCAT_SEQUENCE (
	name VARCHAR (50) NOT NULL,
	current_value BIGINT NOT NULL,
	increment BIGINT NOT NULL DEFAULT 100,
	PRIMARY KEY (name)
) ;


-- ----------------------------
-- Function structure for `mycat_seq_currval`
-- ----------------------------
DROP FUNCTION IF EXISTS `MYCAT_SEQ_CURRVAL`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `MYCAT_SEQ_CURRVAL`(seq_name VARCHAR(50)) RETURNS varchar(64) CHARSET utf8
    DETERMINISTIC
BEGIN
    DECLARE retval VARCHAR(64);
    SET retval="-1,0";
    SELECT concat(CAST(current_value AS CHAR),",",CAST(increment AS CHAR) ) INTO retval FROM MYCAT_SEQUENCE  WHERE name = seq_name;
    RETURN retval ;
END
;;
DELIMITER ;


-- ----------------------------
-- Function structure for `mycat_seq_nextval`
-- ----------------------------
DROP FUNCTION IF EXISTS `MYCAT_SEQ_NEXTVAL`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `MYCAT_SEQ_NEXTVAL`(seq_name VARCHAR(50)) RETURNS varchar(64) CHARSET utf8
    DETERMINISTIC
BEGIN
    DECLARE retval VARCHAR(64);
    DECLARE val BIGINT;
    DECLARE inc INT;
    DECLARE seq_lock INT;
    set val = -1;
    set inc = 0;
    SET seq_lock = -1;
    SELECT GET_LOCK(seq_name, 15) into seq_lock;
    if seq_lock = 1 then
      SELECT current_value + increment, increment INTO val, inc FROM MYCAT_SEQUENCE WHERE name = seq_name for update;
      if val != -1 then
          UPDATE MYCAT_SEQUENCE SET current_value = val WHERE name = seq_name;
      end if;
      SELECT RELEASE_LOCK(seq_name) into seq_lock;
    end if;
    SELECT concat(CAST((val - inc + 1) as CHAR),",",CAST(inc as CHAR)) INTO retval;
    RETURN retval;
END
;;
DELIMITER ;


-- ----------------------------
-- Function structure for `mycat_seq_setval`
-- ----------------------------
DROP FUNCTION IF EXISTS `MYCAT_SEQ_SETVAL`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `MYCAT_SEQ_SETVAL`(seq_name VARCHAR(50), value INTEGER) RETURNS varchar(64) CHARSET utf8
    DETERMINISTIC
BEGIN
    DECLARE retval VARCHAR(64);
    DECLARE inc INT;
    SET inc = 0;
    SELECT increment INTO inc FROM MYCAT_SEQUENCE WHERE name = seq_name;
    UPDATE MYCAT_SEQUENCE SET current_value = value WHERE name = seq_name;
    SELECT concat(CAST(value as CHAR),",",CAST(inc as CHAR)) INTO retval;
    RETURN retval;
END
;;
DELIMITER ;


INSERT INTO MYCAT_SEQUENCE VALUES ('GLOBAL', 0, 100);
SELECT MYCAT_SEQ_CURRVAL('GLOBAL');