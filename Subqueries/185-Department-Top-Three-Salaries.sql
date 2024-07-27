-- Your task is to find the employees who are high earners in each department.
-- A high earner in a department is defined as an employee who has a salary in the top three unique salaries for that department.

-- all what we will do is -> ranking every employee within the same dept based on salary to get first three emplyees with highest salary  


-- Step 1: Create a CTE to rank salaries within each department.
WITH cte AS (
    SELECT d.name AS 'Department',
            e.name AS 'Employee', 
            e.salary AS 'Salary', 
        -- Rank salaries within each department.
        DENSE_RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS 'd_rank'
    FROM Employee e JOIN Department d ON e.departmentId = d.id
)
-- Step 2: then we just Select the high earners by filtering ranks less than 4 as we only want first three 
SELECT Department,Employee,Salary FROM cte WHERE d_rank < 4; 


-- hint : you can the cte alone to see how the ranked data is stored after that you just select based in the rank val 