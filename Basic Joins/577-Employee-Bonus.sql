# Write your MySQL query statement below
 -- We want to retrieve the name and bonus of each employee where the bonus is less than 1000 or the employee has no bonus.
-- left outer join used to assign bonus with null if an employee not exist in bonus table 
select e.name , b.bonus from Employee e left outer join Bonus b on e.empId = b.empId 
where b.bonus <1000  -- Include employees who have a bonus less than 1000
 or isnull(b.bonus)  -- Include employees who don't have a bonus (NULL in the Bonus table)