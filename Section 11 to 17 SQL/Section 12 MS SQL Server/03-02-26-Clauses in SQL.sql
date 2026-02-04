use employee_details;

-- Clauses in SQL
-- Where, Order BY, Having, Group BY

-- Where Clause

select * from [dbo].[Employee]
where Department = 'IT';

select * from [dbo].[Employee]
where EmployeeID = 2;

select EmployeeID, Salary from Employee
where EmployeeID = 2;

select EmployeeID, Salary from Employee
where Salary >= 70000;

select distinct EmployeeID, Salary from Employee
where Salary <= 75000;

-- Order by clause
select * from [dbo].[Employee]
order by 'salary';  -- Default is Ascending order.

select * from [dbo].[Employee]
order by 'salary' Desc;

select * from [dbo].[Employee]
order by FirstName asc, Salary Desc;

select * from [dbo].[Employee]
order by Department asc, Salary Desc;