# Write your MySQL query statement below
select mng.employee_id , mng.name , count(emp.reports_to) as reports_count , ROUND(avg(emp.age)) 
as average_age
from Employees mng join Employees emp on emp.reports_to = mng.employee_id 
group by mng.employee_id  order by mng.employee_id 


-- Your task is to report the ids and names of all managers, 
-- the number of employees who report directly to them, 
-- and the average age of the reports rounded to the nearest integer.

-- steps 
-- Join the Employees table with itself (self join) to find employees reporting to managers 
-- Group by managerId to calculate the number of reports and their average age ....