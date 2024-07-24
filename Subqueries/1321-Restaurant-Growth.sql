-- Your task is to calculate the moving average of how much the customer paid in a seven-day window.
-- We will use a Common Table Expression (CTE) and window functions to achieve this.

-- Step 1: Create a CTE to calculate the daily sum of amounts.
with cte as (
    select visited_on ,SUM(amount) as dailySum
    from Customer 
    group by visited_on
)

-- Step 2: Use the CTE to calculate the moving average over a 7-day window.
select visited_on,
-- Calculate the 7-day moving sum using a window function.
    sum(dailySum) over(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as amount ,
    -- Calculate the 7-day moving average, rounded to two decimal places.
round (avg (dailySum) over (order BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2 )as average_amount
from cte 
-- now we have all the rows starting from day 1 and we juat want to skip the first 6 days to get rows with preceding 6 days window. 
-- so we skip first 6 rows . 
-- using offset 6 
limit 100 OFFSET 6