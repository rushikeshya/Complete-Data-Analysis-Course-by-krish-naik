/*
A common table expression (CTE) in sql is a temporary result set that we can reference
within a SELECT, INSERT, UPDATE, or DELETE statement, CTEs are defined using the WITH Keyword,
and they can make complex queries easier to write, understand, and maintain by breaking then into simpler parts.
*/

use employee_details;
select * from Employee;
select * from Employees;

select * into #temp1 from Employees;

select * from #temp1;


-- CTE for Select Command

with CTE As (
	Select * from #temp1
)
select * from cte;


with CTE as (
	select EmployeeID, FirstName from #temp1
)
select * from CTE;

with [Common table expression] as (
	select * from #temp1 where EmployeeID in (1,2,3)
)

select * into #temp2 from [Common table expression];

select * from #temp2;

-- CTEs for DML Commands - Insert, Update, Delete

-- CTE for Update

with CTE_1 as (
	select * from #temp1 where EmployeeID in (2,4,6)
)

update #temp1 
set EmployeeID = 101 
where EmployeeID 
in (select distinct EmployeeID from CTE_1);

select * from #temp1;


-- CTE with Delete Command

WITH CTE_2 as (
	select * from #temp1 where EmployeeID = 1
)
delete from #temp1 
where EmployeeID in 
(select distinct EmployeeID from cte_2);

select * from #temp1;

-- CTE for INSERT Command
with cte_3 as (
	select * from #temp1 where EmployeeID in (101)
)
insert into #temp1 select * from cte_3;

select * from #temp1;


-- Multiple CTEs
select * into #1 from dbo.Employees;

select * from #1;

with cte1 as (
	select * from #1 where EmployeeID in (1,2)
),
cte2 as(
	select * from #1 where EmployeeID in (3,4)
)

select * from cte1
union all
select * from cte2;

-- Example 2
with cte3 as (
	select EmployeeID, FirstName from #1 where EmployeeID = 1
),cte4 as (
	select EmployeeID, FirstName from #1 where EmployeeID in (3)
)

Select * into #2 
from (
	select * from cte3
	union all
	select * from cte4
	) x

select * from #2;

-- Example 3 Insert with multiple

with cte3 as (
	select EmployeeID, FirstName from #1 where EmployeeID = 1
), cte4 as (
	select EmployeeID, FirstName from #1 where EmployeeID = 3
)

insert into #2 select * from (
	select * from cte3
	union all
	select * from cte4
) x

select * from #2

-- Delete

with cte3 as (
	select EmployeeID, salary from #1 where EmployeeID = 1
), cte4 as (
	select EmployeeID, salary from #1 where EmployeeID = 4
)

delete from #1 where EmployeeID in (
	select distinct EmployeeID from cte3
	union all
	select distinct EmployeeID from cte4
) 

select * from #1

-- Update with multiple ctes

with cte3 as (
	select EmployeeID, salary from #1 where EmployeeID = 2
), cte4 as (
	select EmployeeID, salary from #1 where EmployeeID = 3
)

update #1 set EmployeeID = 101 where EmployeeID in (
	select distinct EmployeeID from cte3
	union all
	select distinct EmployeeID from cte4
)

select * from #1



------------- Recursive Common Table Expressions ------------

-- Recursive CTE
-- Factorial of a given number

-- simple recursive
with [R CTE] as (
	-- Anchor Query
	select 1 as n


	union all

	-- Recursive query
	select n+1 from [R CTE] where n<=4


)

select * from [R CTE]


------ Factorial using Recursive CTEs
with [R CTE] as (
	-- Anchor Query
	select 1 as n

	union all
	select n+1 from [R CTE] where n<=4


	-- recursive query
)

select exp(sum(log(n)))[factorial] from [R CTE]

