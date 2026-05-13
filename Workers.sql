CREATE DATABASE worker_data;
USE worker_data;
CREATE TABLE Salesperson(
Id_code INT PRIMARY KEY NOT NULL,
Sp_name VARCHAR(25) UNIQUE NOT NULL,
Salary INT NOT NULL,
ITCODE INT NOT NULL
);
CREATE TABLE Item(
ITCODE INT NOT NULL REFERENCES Salesperson(ITCODE),
ItemType VARCHAR(25) NOT NULL,
Turnover BIGINT
);
INSERT INTO Salesperson(Id_code,Sp_name,Salary,ITCODE)
VALUES
(1001,"Tandeep Jha",60000,12),
(1002,"Yogaraj Sinha",70000,15),
(1003,"Tenzin Jack",45000,12),
(1004,"Anokhi Raj",50000,17),
(1005,"Tarana Sen",55000,17);
INSERT INTO Item(ITCODE,ItemType,Turnover)
VALUES
(15,"Stationary",3400000),
(17,"Hoistery",6500000),
(12,"Bakery",10090000);

--  Display the code and name of all salespersons having '17' as itemtype code from the table salesperson
SELECT Id_code,Sp_name FROM salesperson WHERE ITCODE = 17;

--  Display all details from table salesperson in descending order of salary
SELECT * FROM salesperson ORDER BY Salary DESC;

-- Display the number of salepersons dealing in each type of item
SELECT ITCODE, COUNT(*) FROM salesperson GROUP BY ITCODE;

--  Display the NAMEs of all salespersons and their corresponding ItemType
SELECT Sp_name,ItemType FROM salesperson S, item I WHERE S.ITCODE=I.ITCODE;

-- Display the highest salary based on type of item
SELECT ITCODE,MAX(Salary) FROM salesperson GROUP BY ITCODE;

-- Display the name salary and turnover from both the table to feel pity
SELECT Sp_name,Salary,Turnover FROM salesperson S, item I WHERE S.ITCODE = I.ITCODE;