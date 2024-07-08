# Write your MySQL query statement below

select max(num) as num from MyNumbers 
where num in (
    select num from MyNumbers group by num having (count(num)=1)
)

-- Your task is to find the largest number that appears only once in the MyNumbers table.

-- In the inner subquery:
-- We group the numbers and filter to only include those that appear exactly once using the HAVING clause.

-- In the outer query:
-- We select the maximum number from the results of the inner subquery. 
-- If no number meets the criteria, the result will be null.