# Write your MySQL query statement below
select emp.employee_id , emp.department_id from Employee emp 
group by emp.employee_id
having count(emp.department_id)=1 
union 
select emp.employee_id , emp.department_id from Employee emp 
where emp.primary_flag ='Y'


-- Your task is to report all employees with their primary department.
-- For employees who belong to multiple departments, report their primary department (primary_flag = 'Y').
-- For employees who belong to only one department, report their only department.

-- This query combines two sets:
-- First set: Employees with only one department.
-- Second set: Employees with multiple departments, selecting their primary department.

-- First set -> Employees with only one department
-- To get the first set, group by employee_id and use HAVING COUNT(emp.department_id) = 1 to just get employees with only one department.

-- Second set -> Employees with multiple departments and one primary department
-- To get the second set, select employees where emp.primary_flag = 'Y'.