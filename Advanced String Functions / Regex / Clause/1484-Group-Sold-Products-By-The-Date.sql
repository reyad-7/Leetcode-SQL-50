-- Write your MySQL query statement below
-- Your task is to find for each date the number of different products sold and their names.

-- It is an easy task, but our problem is how to put product names into a list separated by commas.
-- We can handle this using the GROUP_CONCAT() function.

SELECT 
    sell_date, 
    COUNT(DISTINCT product) AS num_sold,  -- Count the number of distinct products sold on each date
    GROUP_CONCAT(DISTINCT product) AS products -- Concatenate the distinct products,sorted lexicographically,separated by commas
FROM Activities
GROUP BY sell_date  -- Group the results by sell_date to get the count and list of products for each date
ORDER BY sell_date;  -- Order the results by sell_date in ascending order