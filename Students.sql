CREATE DATABASE stu_data;
USE stu_data;
CREATE TABLE students(
Roll_no INT PRIMARY KEY,
Stu_Name VARCHAR(50) UNIQUE,
Gender VARCHAR(1),
Age INT,
Dept VARCHAR(50) NULL,
DOB DATE,
Fees INT
);
INSERT INTO students(Roll_no,Stu_Name,Gender,Age,Dept,DOB,Fees)
VALUES
(1,"Arun","M",24,"Computer",'1997-01-10',120),
(2,"Ankit","M",21,"History",'1998-03-24',200),
(3,"Anu","F",20,"Hindi",'1996-12-12',300),
(4,"Bala","M",19,NULL,'1996-07-01',400),
(5,"Charan","M",18,"Hindi",'1999-09-05',250),
(6,"Deepa","F",19,"History",'1997-02-25',300),
(7,"Dinesh","M",22,"Computer",'1997-02-25',210),
(8,"Usha","F",23,NULL,'1997-07-31',200);

-- To Display Something Unique use DISTINCT 
SELECT DISTINCT Dept FROM students;

-- To Display Names of Female Who Opted for Hindi 
SELECT Stu_Name FROM students WHERE students.Gender = "F" AND students.Dept= "Hindi";

-- List the names of the students whose name have second alphabet as 'n' 
SELECT Stu_Name FROM students WHERE Stu_Name LIKE "_N%";

-- Delete the details of Roll_no 8
DELETE FROM students WHERE Roll_no = 8;

-- Change the fee to 170 of student whose roll_no is 1 if the existing fee is less than 130
UPDATE students SET Fees = 170 WHERE Roll_no = 1 AND Fees < 130;

-- Add a new column Area of datatype varchar of size 20
ALTER TABLE students ADD Area VARCHAR(20);

-- Add the value "TRY" in the Area attribute whose department is Hindi or Computer| In the parenthesis I
-- have added a dummy condition to satisfy safe update mode without referencing a key
UPDATE students SET Area = "TRY" WHERE Dept IN("Hindi","Computer") AND Roll_no > 0;

-- Display the details of students whose Area is null
SELECT * FROM students WHERE Area IS NULL;

-- Display everything
SELECT * FROM students;