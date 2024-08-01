# Write your MySQL query statement below


-- your task is to  Find the second highest salary from the Employee table. If there is no second highest salary, return null.


-- Solution 1: Using subquery with LIMIT and OFFSET  limit is used to determine number of rows retrieved , offset is used to skip a specified number of rows from the result 

-- This solution selects the second highest distinct salary by ordering the salaries in descending order and using LIMIT and OFFSET.

-- Inner query : we select the second highenst salary by sorting rows by salary desc then skip the first row (with highest salary ) and select the second row (with second heighest salary)     

-- note : using outer select to returns a row with a null value when there is no second highest salary.

-- select(
--     select distinct salary from Employee order by salary desc LIMIT 1 OFFSET 1
-- ) as SecondHighestSalary 




-- Solution 2 : Using subquery to exclude the highest salary and then find the maximum of the remaining salaries (which will be the second highest of course ) 


select max(salary) as SecondHighestSalary from Employee where salary not in (
    select max(salary) from Employee
)
