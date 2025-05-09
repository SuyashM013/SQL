CREATE DATABASE joins;
USE joins;

CREATE TABLE student (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);


INSERT INTO student 
(rollno, name, marks, grade, city)
VALUES
(101, "Anil", 88, "C", "Pune"),
(102, "suyash", 88, "A", "MP"),
(103, "Amit", 71, "B", "UP"),
(104, "Sansi", 49, "c", "MP"),
(105, "Vaishu", 98, "A", "MP"),
(106, "Farari",123, "C", "bihar"),
(107, "chetak", 8, "E", "Goa");

CREATE TABLE course(
id INT PRIMARY KEY,
course VARCHAR(50)
);

INSERT INTO course VALUES
(101, 'CSE'),
(102, 'AIML'),
(103, 'AIDS'),
(204, 'EC'),
(104, 'ME');


SELECT * FROM student;
SELECT * FROM course;

SELECT *
FROM student as s
INNER JOIN course as c
ON s.rollno = c.id;

SELECT *
FROM student as s
LEFT JOIN course as c
ON s.rollno = c.id;

SELECT  *
FROM student as s
RIGHT JOIN course as c
ON s.rollno = c.id;

SELECT *
FROM student as s
LEFT JOIN course as c
ON s.rollno = c.id
UNION
SELECT  *
FROM student as s
RIGHT JOIN course as c
ON s.rollno = c.id;

# 
SELECT *
FROM student as s
LEFT JOIN course as c
ON s.rollno = c.id
WHERE c.id IS NULL;

SELECT  *
FROM student as s
RIGHT JOIN course as c
ON s.rollno = c.id
WHERE s.rollno IS NULL;

SELECT *
FROM student as s
LEFT JOIN course as c
ON s.rollno = c.id
WHERE c.id is NULL
UNION
SELECT  *
FROM student as s
RIGHT JOIN course as c
ON s.rollno = c.id
WHERE s.rollno IS NULL;

CREATE TABLE employe(
id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT
);

INSERT INTO  employe
VALUES
(101, 'adam', 103),
(102, 'bob', 104),
(103, 'casey', NULL),
(104, 'donal', 103);

SELECT * FROM employe;

SELECT   a.name as manager, b.name
FROM employe as a
JOIN employe as b
ON a.id = b.manager_id;

SELECT name FROM employe
UNION  
SELECT name FROM student;

#sub queries
SELECT name, marks
FROM student
WHERE marks > (SELECT avg(marks) FROM student);

SELECT rollno, name
FROM student
WHERE rollno % 2 != 0;

CREATE VIEW view1 AS
SELECT rollno, name, marks FROM student;

SELECT * FROM view1;

DROP VIEW view1;