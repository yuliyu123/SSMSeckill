-- database init
-- create database;
CREATE DATABASE secoundKill;
--use database
USE secoundKill;
--create secound kill table
CREATE TABLE seckill (
  `seckill_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'product id',
  ` NAME ` VARCHAR (120
) NOT NULL COMMENT 'product name',
  `number` INT NOT NULL COMMENT 'product number',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time ',
  `start_time` TIMESTAMP NOT NULL COMMENT 'seckill start time',
  `end_time` TIMESTAMP NOT NULL COMMENT 'seckill end time',
PRIMARY KEY (seckill_id
),
KEY idx_start_time (start_time
),
KEY idx_end_time (end_time
),
KEY idx_create_time (create_time
)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT 'secound kill table';

--init data
INSERT INTO seckill (name, number, start_time, end_time)
VALUES
  ('888 yuan secound kill', 888, '2016-10-16 00:00:00', '2016-10-30 00:00:00'),
  ('777 yuan secound kill', 777, '2016-10-16 00:00:00', '2016-10-30 00:00:00'),
  ('666 yuan secound kill', 666, '2016-10-16 00:00:00', '2016-10-30 00:00:00');

--secound kill detail
--user login information
CREATE TABLE success_kill (
  `seckill_id` BIGINT NOT NULL COMMENT 'product id',
  `user_phone` BIGINT NOT NULL COMMENT 'user mobile phone',
  ` STATUS ` TINYINT NOT NULL DEFAULT -1 COMMENT 'status: -1:secound kill not success 0:secound kill success,1:paied,2:have bean send',
  `create_time` TIMESTAMP NOT NULL COMMENT 'create time',
PRIMARY KEY (seckill_id, user_phone
), /* combined primary key */
KEY idx_create_time (create_time
)
)ENGINE = InnoDB CHARSET = utf8 COMMENT 'secound kill success information';

--connect mysql console
mysql -uroot - p