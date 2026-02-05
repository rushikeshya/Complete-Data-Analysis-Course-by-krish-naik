-- Stored Procedure in SQL

USE employee_details;

select * from Employees;

Create procedure sp_test
as
begin
	select * from Employees
end

sp_test

exec sp_test

execute sp_test


CREATE Procedure #SP_Names_salary
as
BEGIN
	SELECT FirstName, Salary from Employees where EmployeeID = 4
END

Exec #SP_Names_salary;

---- Example 2

CREATE PROC #sp_test2
as
BEGIN
	SELECT FirstName, LastName FROM Employees
END

exec #sp_test2


----- Modifying/Modifying Stored Procedures

Alter Proc #sp_test2
AS
BEGIN
	select EmployeeID, FirstName, LastName from Employees
END

exec #sp_test2