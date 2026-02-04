-- TEMP Tables

USE employee_details;

-- Creating Temporary table using existing table.
-- single `#` (Single pound sign) prefix are for local
select * into #temp1
from [dbo].[Employee];

select * from #temp1;

-- double `##` (Double pound sign) prefix are used for global 
-- that is we can use select * from ##temp2 command in other query file
select * into ##temp2
from [dbo].[Employee];