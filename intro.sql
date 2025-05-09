CREATE DATABASE temp1;
DROP DATABASE temp1;

create	database temp2;
DROP DATABASE temp2;

CREATE DATABASE college;
 
USE college;

CREATE TABLE student (
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);

CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR(50),
subject VARCHAR(50)
);

INSERT INTO student  VALUES(1, "SUYASH", 21);
INSERT INTO student  VALUES(2, "SANSI", 20);


INSERT INTO student
(id, name, age)
VALUES
(101, "add", 45),
(102, "ajay", 18);


INSERT INTO teacher VALUES(101, "PP", "C++");
INSERT INTO teacher VALUES(102, "CHARU", "DSA");

SELECT * FROM student;
SELECT * FROM teacher;

USE world;
SELECT * FROM city;


DROP DATABASE IF EXISTS name1;

SHOW TABLES;
SHOW DATABASES;
