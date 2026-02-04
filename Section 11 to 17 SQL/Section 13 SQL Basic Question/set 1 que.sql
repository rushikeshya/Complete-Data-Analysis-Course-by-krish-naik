USE employee_details;
-- Creating `Employees` Table
CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY,
	FirstName varchar(50),
	LastName varchar(50),
	Department varchar(50),
	Salary Decimal(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
(1, 'John', 'Doe', 'HR', 55000.00),
(2, 'Jane', 'Smith', 'IT', 75000.00),
(3, 'Emily', 'Jones', 'Finance', 65000.00),
(4, 'Michael', 'Brown', 'IT', 80000.00),
(5, 'Sarah', 'Davis', 'HR', 60000.00),
(6, 'David', 'Wilson', 'Finance', 70000.00),
(7, 'Laura', 'Garcia', 'IT', 72000.00),
(8, 'Robert', 'Miller', 'HR', 58000.00),
(9, 'Sophia', 'Martinez', 'Finance', 67000.00),
(10, 'James', 'Anderson', 'IT', 81000.00);



-- Questions: 


-- 1. How do you select all columns from Employee table?
select * from [dbo].[Employees]

-- 2. How do you select only the FirstName and LastName columns from the Employee Table.
select FirstName, LastName from Employees;

--3) How do you find all employees who work in the 'IT' department?

select * from Employees where Department = 'IT';

--4) How do you select employees with a salary greater than 70,000?

select * from Employees where Salary > 70000;

--5) How do you sort the results by Last Name in ascending order?

select * from employees order by LastName;

--6) How do you select distinct departments from the Employees table?

select distinct Department from Employees;

--7) How do you count the number of employees in each department?

select Department, count(*) as [count of dept.] from Employees group by Department;

--8) How do you find the maximum salary in the Employees table?
select top 1 Salary as [max salary] from Employees
order by Salary Desc;

select max(salary) as [Max salary] from Employees;
--9) How do you find the average salary of employees in the 'Finance' 
select AVG(Salary) as AVG_Salary from Employees
where Department = 'Finance';

select AVG(Salary) as AVG_Salary from Employees
where Department LIKE 'Finance';

--10) How do you select employees whose last name starts with 'M'?
select * from Employees
where LastName like 'M%';


