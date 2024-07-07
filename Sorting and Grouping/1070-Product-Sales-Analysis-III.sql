# Write your MySQL query statement below
select product_id,year as first_year , quantity, price from Sales 
where (product_id , year ) in
(
select product_id,min(year) from sales group by product_id  
)

-- Your task is to find the product_id, first year it was sold,the quantity sold, and the price per unit --for each product.
-- To solve this, we just have one simple problem which is how to get the first year of each product

-- so we need to:
-- Identify the first year of each product in inner query 
-- in Inner Query:
-- For each product_id, find the earliest year it was sold (using min() aggregrate function) 
-- then we select the matching product_ids rows executed from inner sub query (which has the first product year when it has been sold)