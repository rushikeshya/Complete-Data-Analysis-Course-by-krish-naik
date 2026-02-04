-- Operators in SQL
-- AND, OR, NOT, BETWEEN, IN 
USE employee_details;

select * from Employee;
-- AND Operator
SELECT * from Employee
where Department = 'IT'
AND EmployeeID = 3;

SELECT * from Employee
where Department = 'IT'
AND EmployeeID = '3';

-- Creating Employee Records Tables
CREATE TABLE EmployeeRecords (
	EmployeeID INT,
	FirstName VARCHAR(50),
	LastName varchar(50),
	Department varchar(50),
	Salary decimal
);

INSERT INTO EmployeeRecords(EmployeeID, FirstName, LastName, Department, Salary)
VALUES
(1, 'John', 'Miller', 'HR', 60000),
(2, 'Jane', 'Smith', 'Finance', 75000),
(3, 'John', 'Miller', 'HR', 60000),
(4, 'Emily', 'Davis', 'IT', 85000),
(5, 'Michael', 'Brown', 'Finance', 60000),
(6, 'Jane', 'Smith', 'Finance', 60000);

select * from EmployeeRecords;

ALTER TABLE EmployeeRecords
ALTER COLUMN Salary DECIMAL(10,2);

-- OR Operator
select * from EmployeeRecords
where Department = 'HR' OR Department ='Finance';

-- IN Operator
select * from EmployeeRecords
where Department in ('HR', 'Finance');

select * from EmployeeRecords
where (Department = 'HR' OR Department ='Finance') AND Salary = 60000;


-- NOT Operator
select * from EmployeeRecords
where NOT Department = 'HR'


-- SQL INSERT INTO Statements


