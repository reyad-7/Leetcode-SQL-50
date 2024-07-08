# Write your MySQL query statement below
select c.customer_id from Customer c 
group by c.customer_id 
having count(distinct c.product_key) =
(
    select count(p.product_key) from Product p 
)


-- Your task is to report the customer_ids from the Customer table who bought all products listed in the Product table.
-- First, we need to know the number of products listed in the Product table.

-- Inner Query:
-- We count the number of distinct products available in the Product table.

-- Outer Query:
-- We go through each customer_id, count its product_key with the GROUP BY aggregate function,
-- and keep only those customers whose count of products equals the total number of products.

-- note:
-- we use distincit here (having count(distinct c.product_key) as the customer can buy the same product many times not onle one time  