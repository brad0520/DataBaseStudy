DROP DATABASE IF EXISTS simpleBoard;

CREATE DATABASE simpleBoard;

USE simpleBoard;

CREATE TABLE `member`
(
    `id`            INT         NULL        AUTO_INCREMENT COMMENT '번호', 
    `userId`        CHAR(30)    NOT NULL    COMMENT '아이디', 
    `userPw`        CHAR(30)    NOT NULL    COMMENT '비밀번호', 
    `userName`      CHAR(30)    NOT NULL    COMMENT '이름', 
    `userNickname`  CHAR(30)    NOT NULL    COMMENT '닉네임', 
    PRIMARY KEY (id)
);

CREATE TABLE board
(
    `id`          INT         NOT NULL    AUTO_INCREMENT COMMENT '번호', 
    `board_name`  CHAR(30)    NOT NULL    COMMENT '게시판 이름', 
    PRIMARY KEY (id)
);

CREATE TABLE reply
(
    `id`              INT         NOT NULL    AUTO_INCREMENT COMMENT '번호', 
    `boardId`         INT         NOT NULL    COMMENT '게시판 번호', 
    `boardArticleId`  INT         NOT NULL    COMMENT '게시글 번호', 
    `writerId`        INT         NOT NULL    COMMENT '작성자 번호', 
    `userNickname`    CHAR(30)    NOT NULL    COMMENT '작성자', 
    `body`            TEXT        NOT NULL    COMMENT '내용', 
    PRIMARY KEY (id)
);

CREATE TABLE article
(
    `id`            INT         NOT NULL    AUTO_INCREMENT COMMENT '번호', 
    `boardId`       INT         NOT NULL    COMMENT '게시판 번호', 
    `title`         CHAR(50)    NOT NULL    COMMENT '제목', 
    `body`          TEXT        NOT NULL    COMMENT '내용', 
    `writerId`      INT         NOT NULL    COMMENT '작성자 번호', 
    `userNickname`  CHAR(30)    NOT NULL    COMMENT '작성자', 
    `hit`           INT         NOT NULL    COMMENT '조회수', 
    PRIMARY KEY (id)
);

