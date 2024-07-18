# Write your MySQL query statement below
-- Your task is to calculate the number of bank accounts for each salary category.

-- We will solve this by creating three separate queries for each salary category and then using UNION to combine them.

-- First query: Calculate the number of accounts with "Low Salary"
select "Low Salary" as category , sum(if(income < 20000,1,0)) as accounts_count from Accounts 

union
-- -- Second query: Calculate the number of accounts with "Average Salary"
select "Average Salary" as category , sum(if(income between 20000 and 50000 ,1,0)) as accounts_count from Accounts 

union 
-- --Third query: Calculate the number of accounts with "High Salary"
select "High Salary" as category , sum(if(income > 50000,1,0)) as accounts_count 
from Accounts




-- another solution (using cts)-- 


-- with cteLow as (select * from  Accounts where income < 20000) ,

-- cteAvg as (select * from  Accounts where income between 20000 and 50000 ),

-- cteHigh as (select * from  Accounts where income > 50000) 

-- select "Low Salary" as category ,count(*) as accounts_count  from cteLow 
-- union 
-- select "Average Salary" as category , count(*) as accounts_count  from cteAvg
-- union 
-- select "High Salary" as category , count(*) as accounts_count  from cteHigh