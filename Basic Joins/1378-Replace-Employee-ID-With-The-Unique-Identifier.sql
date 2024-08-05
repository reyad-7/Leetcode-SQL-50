-- Your task is to show the unique ID of each user, if a user does not have a unique ID show null.

SELECT 
    euni.unique_id,e.name FROM Employees e
    -- Use LEFT JOIN to include all employees and match with their unique_id, if exist , if not put null 
    LEFT JOIN EmployeeUNI euni ON e.id = euni.id  ORDER BY e.id;
