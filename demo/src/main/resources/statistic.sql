CREATE DATABASE statistc;
 
CREATE Table statistc.requestInfo (
    requestID numeric NOT NULL primary key,
    requestCode varchar(5) NOT NULL,
    userID varchar(5),
    createDate varchar(10)
);
 
CREATE table statistc.requestCode (
    requestCode varchar(5) NOT NULL primary key,
    code_explain varchar(50) NOT NULL
);
 
CREATE table statistc.users (
    userID varchar(5) NOT NULL primary key,
    HR_ORGAN varchar(5) NOT NULL,
    USERNAME varchar(5) NOT NULL
);
 
 
INSERT INTO statistc.requestInfo(requestID, requestCode, userID, createDate )
VALUES(1, 'L', 'AAA', '2008180520'), #20년 8월 18일 5시 20분
(2, 'O', 'DDD', '2004040404'),
(3, 'L', 'BBB', '2006220920'),
(4, 'L', 'CCC', '1906220920');

INSERT INTO statistc.requestCode(requestCode, code_explain) 
VALUES('L', '로그인'),
    ('O', '로그아웃');

INSERT INTO statistc.users(userID, HR_ORGAN, USERNAME) 
VALUES('AAA', 'IT', 'A'),
    ('BBB', 'HR', 'B'),
    ('CCC', 'FN', 'C'),
    ('DDD', 'MK', 'D');