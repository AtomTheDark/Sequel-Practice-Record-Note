CREATE DATABASE worker_data;
USE worker_data;
CREATE TABLE Salesperson(
Id_code INT PRIMARY KEY NOT NULL,
Sp_name VARCHAR(25) UNIQUE NOT NULL,
Salary INT NOT NULL,
IT_CODE INT NOT NULL
);
CREATE TABLE Item(
IT_CODE INT NOT NULL REFERENCES Salesperson(IT_CODE),
ItemType VARCHAR(25) NOT NULL,
Turnover BIGINT
);
INSERT INTO Salesperson(Id_code,Sp_name,Salary,IT_CODE)
VALUES
(1001,'Tan deep Jha',60000,12),
(1002,'Yoga raj Sin ha',70000,15),
(1003,'Tenzin Jack',45000,12),
(1004,'Ano khi Raj',50000,17),
(1005,'Tarana Sen',55000,17);
INSERT INTO Item(IT_CODE,ItemType,Turnover)
VALUES
(15,'Stationary',3400000),
(17,'Hollister',6500000),
(12,'Bakery',10090000);

--  Display the code and name of all salespersons having '17' as ItemType code from the table salesperson
SELECT Id_code,Sp_name FROM salesperson WHERE IT_CODE = 17;

--  Display all details from table salesperson in descending order of salary
SELECT * FROM salesperson ORDER BY Salary DESC;

-- Display the number of salesperson dealing in each type of item
SELECT IT_CODE, COUNT(*) FROM salesperson GROUP BY IT_CODE;

--  Display the NAMEs of all salespersons and their corresponding ItemType
SELECT Sp_name,ItemType FROM salesperson S, item I WHERE S.IT_CODE=I.IT_CODE;

-- Display the highest salary based on type of item
SELECT IT_CODE,MAX(Salary) FROM salesperson GROUP BY IT_CODE;

-- Display the name salary and turnover from both the table to feel pity
SELECT Sp_name,Salary,Turnover FROM salesperson S, item I WHERE S.IT_CODE = I.IT_CODE;