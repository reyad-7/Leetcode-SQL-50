# Write your MySQL query statement below

-- Your task is to find the prices of all products on 2019-08-16. 
-- If a product's price has not changed by that date, assume its price is 10. 
-- (Get the last occurrence of a product's price before or on 2019-08-16, if it has changed. 
-- If it has only changed after 2019-08-16, set the price to 10.)

-- We have two sets to consider:

-- First set: Products that have already changed before or on 2019-08-16.
-- How to get them?
-- Using a subquery.
-- Inner query: Get the latest change date (max(change_date) <= '2019-08-16') for each product_id 
-- to get the last occurrence before or on '2019-08-16'.
-- Then select that product_id with its latest price.

SELECT product_id, new_price AS price 
FROM Products 
WHERE (product_id, change_date) IN (
    SELECT product_id, MAX(change_date) 
    FROM Products 
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

-- Second set: Products with no price change before or on '2019-08-16'. 
-- We should assign them the default price of 10.
-- First, we need to check if there is no occurrence before or on '2019-08-16' 
-- and all occurrences are after '2019-08-16'.

-- How to check that?
-- Using aggregate function MIN(change_date) > '2019-08-16' for each product_id, 
-- we check if the earliest change date is greater than our desired date. 
-- If it is, then it has no occurrence before or on '2019-08-16', so set its price to 10 by default.

UNION ALL

SELECT product_id, 10 AS price 
FROM Products 
GROUP BY product_id 
HAVING MIN(change_date) > '2019-08-16';

-- Finally, union these two sets.
