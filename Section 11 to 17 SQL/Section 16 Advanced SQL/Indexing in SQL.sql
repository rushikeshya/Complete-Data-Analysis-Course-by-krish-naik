-- Index in SQL
use employee_details;

select * from dbo.Employees;

create index IX_1 on dbo.Employees(salary desc)

select * from IX_1

SELECT * FROM Employees WHERE salary > 50000;


EXEC sp_helpindex 'dbo.Employees';

drop index dbo.employees.IX_1

EXEC sp_helpindex 'dbo.Employees';



------ Cluster Indexes --------

-- Creating Table
create table students (
	id int,
	name nvarchar(50),
	age int,
	gender varchar(20)
)

insert into Students values
(1,'Raj',23,'M'),
(4,'Nitin',25,'M'),
(3,'Priya',21,'F'),
(2,'Nikita',20,'F'),
(5,'Monica',20,'F')

select * from students;

-- Clustured Index - It Determined the Physical data in the table

create clustered index ix_1 on students(id);

select * from students;

create clustered index ix_2 on students(id desc);
-- above shows: Cannot create more than one clustered index on table 'students'. Drop the existing clustered index 

-- so
drop index ix_1 on students;
-- drop index dbo.students.ix_1

create clustered index ix_3 on students (gender desc, age asc);

select * from students;


---------------- NON-Clustered Indexex -------------------

select * from students;

create nonclustered index ix_2 on students (id);

create nonclustered index ix_1 on students (gender desc, age asc)

