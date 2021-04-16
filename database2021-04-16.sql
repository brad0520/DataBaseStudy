# DB 생성
DROP DATABASE IF EXISTS shoppingmall;
CREATE DATABASE shoppingmall;
USE shoppingmall;

CREATE TABLE member (
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    regDate DATETIME NOT NULL,
    `loginId` CHAR(100) NOT NULL,
    `loginPw` CHAR(100) NOT NULL,
    `name` CHAR(100) NOT NULL,
    `nickname` CHAR(100) NOT NULL
);

CREATE TABLE board (
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    regDate DATETIME NOT NULL,
    `name` CHAR(100) NOT NULL
);

CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    regDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    body TEXT NOT NULL,
    boardId INT(10) UNSIGNED NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    writer CHAR(100) NOT NULL,
    passwd CHAR(100) NOT NULL,
    hit int(10) NOT NULL
);

CREATE TABLE articleReply (
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    regDate DATETIME NOT NULL,
    body TEXT NOT NULL,
    boardId INT(10) UNSIGNED NOT NULL,
    articleId INT(10) UNSIGNED NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    writer CHAR(100) NOT NULL,
    passwd CHAR(100) NOT NULL
);

SHOW tables;

# 1. 테스트 회원 3명 만들기

INSERT INTO member
SET regDate = NOW(),
loginId = 'memberA',
loginPw = '1234',
`name` = '홍길동',
nickname = '길동이';

INSERT INTO member
SET regDate = NOW(),
loginId = 'memberB',
loginPw = '4321',
`name` = '성춘향',
nickname = '춘향이';

INSERT INTO member
SET regDate = NOW(),
loginId = 'memberC',
loginPw = '1324',
`name` = '임꺽정',
nickname = '꺽정이';

# 2. 게시판 만들기
#	- 공지사항
#	- 자유게시판
#	- 질문과 답변

INSERT INTO board
SET regDate = NOW(),
`name` = '공지사항';

INSERT INTO board
SET regDate = NOW(),
`name` = '자유게시판';

INSERT INTO board
SET regDate = NOW(),
`name` = '질문과 답변';

# 3. 게시물과 댓글 등록하기
#	- A 회원이 자유게시판에 글 1, 2, 3 작성

INSERT INTO article
SET regDate = NOW(),
title = '자유제목1',
body = '자유내용1',
boardId = 2,
memberId = 1;
	
INSERT INTO article
SET regDate = NOW(),
title = '자유제목2',
body = '자유내용2',
boardId = 2,
memberId = 1;

INSERT INTO article
SET regDate = NOW(),
title = '자유제목3',
body = '자유내용3',
boardId = 2,
memberId = 1;

# - B 회원이 자유게시판에 글 4, 5 작성

INSERT INTO article
SET regDate = NOW(),
title = '자유제목4',
body = '자유내용4',
boardId = 2,
memberId = 2;

INSERT INTO article
SET regDate = NOW(),
title = '자유제목5',
body = '자유내용5',
boardId = 2,
memberId = 2;

# - C 회원이 자유게시판 글 1에 댓글 2개 작성

INSERT INTO articleReply
SET regDate = NOW(),
body = '자유1댓글1',
boardId = 2,
articleId = 1,
memberId = 3;

INSERT INTO articleReply
SET regDate = NOW(),
body = '자유2댓글2',
boardId = 2,
articleId = 1,
memberId = 3;

# - B 회원이 공지사항에 글 1, 2 작성

INSERT INTO article
SET regDate = NOW(),
title = '공지제목1',
body = '공지내용1',
boardId = 1,
memberId = 2;

INSERT INTO article
SET regDate = NOW(),
title = '공지제목2',
body = '공지내용2',
boardId = 1,
memberId = 2;

# - A 회원이 공지사항 글 1, 2에 댓글 3개씩 작성

SELECT * FROM article WHERE boardId = 1;

INSERT INTO articleReply
SET regDate = NOW(),
body = '공지1댓글1',
boardId = 1,
articleId = 6,
memberId = 1;

INSERT INTO articleReply
SET regDate = NOW(),
body = '공지1댓글2',
boardId = 1,
articleId = 6,
memberId = 1;

INSERT INTO articleReply
SET regDate = NOW(),
body = '공지1댓글3',
boardId = 1,
articleId = 6,
memberId = 1;

INSERT INTO articleReply
SET regDate = NOW(),
body = '공지2댓글1',
boardId = 1,
articleId = 7,
memberId = 1;

INSERT INTO articleReply
SET regDate = NOW(),
body = '공지2댓글2',
boardId = 1,
articleId = 7,
memberId = 1;

INSERT INTO articleReply
SET regDate = NOW(),
body = '공지2댓글3',
boardId = 1,
articleId = 7,
memberId = 1;

# - C 회원이 질/답 게시판에 글 1, 2 작성

INSERT INTO article
SET regDate = NOW(),
title = '질답제목1',
body = '질답내용1',
boardId = 3,
memberId = 3;


INSERT INTO article
SET regDate = NOW(),
title = '질답제목2',
body = '질답내용2',
boardId = 3,
memberId = 3;

# - C 회원이 질/답 게시판 자신의 글에 댓글 2개씩 작성

INSERT INTO articleReply
SET regDate = NOW(),
body = '질답1댓글1',
boardId = 3,
articleId = 8,
memberId = 3;

INSERT INTO articleReply
SET regDate = NOW(),
body = '질답1댓글2',
boardId = 3,
articleId = 8,
memberId = 3;

INSERT INTO articleReply
SET regDate = NOW(),
body = '질답2댓글1',
boardId = 3,
articleId = 9,
memberId = 3;

INSERT INTO articleReply
SET regDate = NOW(),
body = '질답2댓글2',
boardId = 3,
articleId = 9,
memberId = 3;

# - B 회원이 질/답 글 2번에 댓글 3개 작성

INSERT INTO articleReply
SET regDate = NOW(),
body = '질답2댓글2',
boardId = 3,
articleId = 9,
memberId = 2;

INSERT INTO articleReply
SET regDate = NOW(),
body = '질답2댓글2',
boardId = 3,
articleId = 9,
memberId = 2;

INSERT INTO articleReply
SET regDate = NOW(),
body = '질답2댓글2',
boardId = 3,
articleId = 9,
memberId = 2;

SELECT * FROM member;
DESC member;

SELECT * FROM board;
DESC board;

SELECT * FROM article;
DESC article;

SELECT * FROM articleReply;
DESC articleReply;