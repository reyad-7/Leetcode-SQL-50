-- Your task is to find the people who have the most friends and the most friends number.
-- First, we get all IDs from requester_id and accepter_id (as one person can acquire and accept a friend request) to combine them.
-- Now we have all IDs, and each ID is repeated the number of times that appears in all IDs, 
-- so we can count how many times each ID appeared by using COUNT and GROUP BY aggregate functions.

-- cte to have all ids 
with cte as (
select requester_id as id from RequestAccepted

union all

select accepter_id  as id from RequestAccepted
)
-- Main query: Count the number of occurrences of each ID, 
-- Group by ID and order the result by the count in descending order
-- Select the top row which has the highest number of occurrences
select id , COUNT(id) as num from cte group by id order by num desc   
limit 1