-- Views in MS SQL SERVER

USE employee_details;

select * into emp_bkp from Employees

---- A Views is a Virtual table, it a Stored SQL Query
-- IT helps in reducing the complexity of the code
-- It help in implementing security

CREATE view View_1 as (
	Select * from emp_bkp
)

select * from View_1;


-- Creating View for Secure the salary column - column level security
CREATE view View_2 as (
	Select EmployeeID, FirstName, LastName, Department from emp_bkp
)

select * from View_2;

drop view View_1
drop view View_2