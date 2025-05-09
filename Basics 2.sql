CREATE  DATABASE college;
USE college;

CREATE TABLE student (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

CREATE TABLE dept(
id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE teacher(
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO dept VALUES
(101, 'CSE'),
(102, 'AIML'),
(103, 'AIDS'),
(104, 'ME');

INSERT INTO teacher VALUES
(201, "James", 101),
(202, "Shri", 102),
(203, "Shain", 103),
(204, "PP", 104);

SELECT * FROM teacher;

UPDATE dept
SET  id = 302
WHERE id = 102;

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

 SELECT * FROM student;
SELECT name, marks FROM student;
SELECT DISTINCT city FROM student;

SELECT * FROM student WHERE marks > 80 ;
SELECT * FROM student WHERE marks > 80 AND city = 'MP';
SELECT  * FROM student WHERE marks > 70 OR city = 'GOA';
SELECT * FROM student WHERE marks BETWEEN 70 AND 90;
SELECT * FROM student WHERE city IN ('Goa', 'MP'); 
SELECT * FROM student WHERE city NOT IN ('Goa', 'MP');   

SELECT * FROM student ORDER BY marks ASC ; 
SELECT * FROM student ORDER BY marks DESC  LIMIT 3; 	

SELECT MAX(marks) FROM student; 
SELECT MIN(marks) FROM student;
SELECT COUNT(rollno) FROM student;
SELECT AVG(marks) FROM student;


SELECT city, COUNT(rollno) FROM student GROUP BY city  ORDER BY COUNT(rollno) DESC;
SELECT city, AVG(marks) FROM student GROUP BY city  ORDER BY AVG(marks) ASC;

SELECT COUNT(rollno), city FROM student GROUP BY city HAVING max(marks) > 60;

SELECT city, max(marks), grade FROM student WHERE grade = 'A' GROUP BY city HAVING max(marks) > 70 ORDER BY city DESC;

#tablee related queries#


SET SQL_SAFE_UPDATES = 0;

UPDATE student
SET grade = 'O'
WHERE grade = 'C';

UPDATE student
SET marks = 99, grade = 'A'
WHERE rollno = 106;

DELETE FROM student
WHERE marks < 20;

SELECT * FROM student;


ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student
CHANGE COLUMN age stu_age INT;

UPDATE student
SET stu_age = 21
WHERE grade = 'A';

TRUNCATE TABLE teacher;

-- # question - student table  
-- #* Change the name of column "name" to 'Full_name"
-- #*Delete all the students who scored marks less than 80
-- #*Delete the column for grades

ALTER TABLE student
CHANGE COLUMN name stu_name VARCHAR(50);

ALTER TABLE student
DROP  COLUMN  grade;

DELETE FROM student
WHERE marks < 80;




