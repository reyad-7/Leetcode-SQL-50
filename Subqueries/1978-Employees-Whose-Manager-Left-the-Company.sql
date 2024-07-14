-- Your task is to find the IDs of the employees whose salary is strictly less than $30000 
-- and whose manager left the company. 
-- A manager leaving the company means that their information is deleted from the Employees table,
-- but their reports still have their manager_id set to the manager that left. 
-- This means that each employee with a manager_id still exists, but the manager does not exist in the employees' IDs list.

-- How can we solve it?!
-- Using a subquery:
-- Inner query: Select the employee IDs that currently exist in the table.
-- Since the IDs of managers who left the company do not exist in the employee IDs, 
-- in our outer query, we select all employees whose manager_id is not in the employees' IDs list 
-- and whose salary is strictly less than $30000.

# Write your MySQL query statement below

select employee_id from Employees where salary <30000 and  manager_id not in (
    select employee_id from Employees
)  
order by employee_id 
