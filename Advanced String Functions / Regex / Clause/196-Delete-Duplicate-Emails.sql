# Write your MySQL query statement below
-- Your task is to delete all duplicate emails, keeping only one unique email with the smallest id.
-- We will use a DELETE statement to achieve this.
-- To avoid issues with modifying the same table we are reading from, we use a subquery inside another subquery.

-- Delete rows from Person where the id is not the minimum id for each email
DELETE FROM Person
WHERE id NOT IN (
    -- Select the minimum id for each email
    SELECT minId
    FROM (
        -- Get the minimum id for each email
        SELECT MIN(id) AS minId
        FROM Person
        GROUP BY email
    ) AS minIds
);

-- Explanation:
-- 1. The inner subquery selects the minimum id (minId) for each email and groups them by email.
-- 2. The outer subquery uses the results from the inner subquery to create a temporary table  aliased as minIds with the minimum ids.
-- 3. The DELETE statement then removes rows from the Person table where the id is not in the list of minimum ids, effectively keeping only one unique email with the smallest id.
