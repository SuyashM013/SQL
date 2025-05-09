USE xyz_employe;

CREATE TABLE employe (
id INT PRIMARY KEY,
name VARCHAR(50),
salery INT
);

INSERT INTO employe 
(id, name, salery)
VALUES
(1, 'ADAM', 25000),
(2, 'BOB', 30000),
(3, 'CASSY', 40000);

SELECT * FROM employe;

