-- Your task is to find each query_name, the quality, and poor_query_percentage.
-- Both quality and poor_query_percentage should be rounded to 2 decimal places.

-- First : Calculate the quality as the average of the ratio between query rating and its position

-- Then : Calculate the poor query percentage as the average of the condition where rating is less than 3
-- Multiplying by 100 to get the percentage and rounding to 2 decimal places
SELECT 
    q.query_name,
    ROUND(AVG(q.rating / q.position), 2) AS quality,
    ROUND(AVG(q.rating < 3) * 100, 2) AS poor_query_percentage
FROM Queries q where q.query_name is not null 
-- Group the results by query_name to calculate the required metrics for each query_name
GROUP BY q.query_name;
