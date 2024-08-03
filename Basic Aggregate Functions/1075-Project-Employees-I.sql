-- your task is to  report the average experience years of all the employees for each project,
-- rounded to 2 digits.


-- first we select project_id and calculate the average experience years for each project 
-- then Calculate the average experience years by summing the experience years and dividing by the count of employees

SELECT p.project_id,ROUND(SUM(e.experience_years) / COUNT(e.employee_id), 2) AS average_years
FROM Project p JOIN Employee e ON p.employee_id = e.employee_id
-- Group the results by project_id to calculate the average for each project
GROUP BY p.project_id;
