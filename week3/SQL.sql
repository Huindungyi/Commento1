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


/* ************************************** */

SELECT *
FROM statistc.requestInfo;

SELECT *
FROM statistc.requestCode;

SELECT *
FROM statistc.users;

SELECT SUBSTR(createDate, 3, 2) AS month,
    COUNT(DISTINCT userID) AS monthly_logins
FROM statistc.requestInfo
GROUP BY SUBSTR(createDate, 3, 2)
ORDER BY month;


SELECT SUBSTR(createDate, 1, 6) AS date,
    COUNT(DISTINCT userID) AS daily_logins
FROM statistc.requestInfo
GROUP BY SUBSTR(createDate, 1, 6)
ORDER BY date;

SELECT AVG(login_count) AS avg_login_count
FROM 
    (SELECT SUBSTR(createDate, 1, 8) AS date,
        COUNT(DISTINCT userID) AS login_count
    FROM statistc.requestInfo
    GROUP BY SUBSTR(createDate, 1, 8)
    ) AS daily_logins;
    
    


SELECT SUBSTR(createDate, 1, 6) AS date,
    COUNT(DISTINCT userID) AS logins_holidays_excluded
FROM statistc.requestInfo
WHERE DATE_FORMAT(STR_TO_DATE(createDate, '%y%m%d%H%i'), '%w') NOT IN (0, 6)
GROUP BY SUBSTR(createDate, 1, 6)
ORDER BY date;


SELECT u.HR_ORGAN AS department,
    SUBSTR(r.createDate, 3, 2) AS month,
    COUNT(DISTINCT r.userID) AS login_count
FROM statistc.requestInfo r
INNER JOIN statistc.users u ON r.userID = u.userID
GROUP BY u.HR_ORGAN, SUBSTR(r.createDate, 3, 2)
ORDER BY u.HR_ORGAN, month;
