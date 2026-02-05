use employee_details;


select * from Employees;

---- 2nd Highest Salary
select max(salary) as [2nd highest salary] from employees 
where 
salary < (select max(salary) from Employees)


-- 3rd highest salary

select max(salary) as [3rd highest salary] from employees
where salary < 
(select max(salary) from Employees 
	where salary <
		(select max(salary) from Employees))

 -- ****another approch to get nth salary****-----

 --- using CTE along with DENSE_RANK

 WITH CTE as (
	select *, DENSE_RANK() over(order by salary desc) [DR] from Employees
 )

 select salary as [3rd Highest Salary] from CTE where DR = 3;

 -- Using Sub Query along with DENSE_RANK()
select salary as [4th highest salary] from
	(select *, DENSE_RANK() over(order by salary desc) [DR] from Employees) sub_query
	where DR = 4;

-- Using only Sub Query
select top 1 salary [2nd Highest Salary] from
	(select distinct top 2 salary from Employees order by salary DESC) x
order by salary asc;

