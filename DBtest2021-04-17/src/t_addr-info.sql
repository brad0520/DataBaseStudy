DROP DATABASE IF EXISTS addr;

CREATE DATABASE addr;

USE addr;

CREATE TABLE t_addr_info (
idx INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`name` CHAR(20) NOT NULL,
`address` CHAR(50) NOT NULL,
`phone` CHAR(13) NOT NULL,
`regDate` DATETIME NOT NULL
);

INSERT INTO t_addr_info 
SET `name` = '홍길동',
`address` = '서울',
`phone` = '01022223333',
`regDate` = NOW();

INSERT INTO t_addr_info 
SET `name` = '이순신',
`address` = '대전',
`phone` = '01055557777',
`regDate` = NOW();