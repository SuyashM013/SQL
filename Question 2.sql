CREATE DATABASE payments;
USE payments;

CREATE TABLE pay(
customer_id INT PRIMARY KEY,
name VARCHAR(50),
mode VARCHAR(50),
city VARCHAR(50)
);

INSERT INTO pay 
(customer_id, name, mode, city)
VALUES
(101, 'Olivia', 'Netbanking', 'Poland'),
(102, 'Ethan', 'Credit Card', 'Miami'),
(103, 'Maya', 'Credit Card', 'Seattle'),
(104, 'Liam', 'Netbanking', 'Denver'),
(105, 'Sophia', 'Credit Card', 'Rio'),
(106, 'Caleb', 'Debit Card', 'Tokiyo'),
(107, 'Ava', 'Debit Card', 'Phoenix'),
(108, 'Lucas', 'Netbanking', 'Boston'),
(109, 'Isabella', 'Netbanking', 'Berlin'),
(110, 'Jakson', 'Credit Card', 'Boston');

SELECT mode, COUNT(customer_id) FROM pay GROUP BY mode;