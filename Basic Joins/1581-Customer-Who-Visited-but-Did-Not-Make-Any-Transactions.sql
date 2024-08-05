# Write your MySQL query statement below

-- The task is to find customers who visited without making any transactions
-- and count the number of such visits for each customer.


-- first approach 

-- Perform a LEFT JOIN between Visits and Transactions, linking on visit_id
-- LEFT JOIN ensures all visits are included, even those without transactions



-- -- uncomment this part to see sol 1   
-- select v.customer_id ,count(v.visit_id) as 'count_no_trans' 
-- from Visits v left join Transactions t 
-- -- Filter to include only visits where no matching transaction was found
-- on (v.visit_id = t.visit_id) where ISNULL (t.visit_id)  
-- group by (v.customer_id)


-- -- second approach 

-- Filter visits where visit_id is not in the list of visit_ids from Transactions
-- we achieve this using subquery 
select customer_id ,count(visit_id) as 'count_no_trans' from Visits where visit_id not in (
    select visit_id from Transactions 
)
group by customer_id