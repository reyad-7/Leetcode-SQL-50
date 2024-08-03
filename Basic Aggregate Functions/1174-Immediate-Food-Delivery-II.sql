-- Your task is to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

-- Inner query :  get the first order date for each customer by using MIN agg function 

-- outer query : we get this first order and calculate the percentage of immediate orders (where order_date equals customer_pref_delivery_date) and round it to 2 decimal places 

SELECT 
    ROUND(AVG(order_date = customer_pref_delivery_date) * 100, 2) AS immediate_percentage FROM Delivery
-- Filter to consider only the first orders of each customer
WHERE 
    (customer_id, order_date) IN (
        -- Subquery to get the first order date for each customer
        SELECT customer_id, MIN(order_date)  -- MIN() to get first order 
        FROM Delivery GROUP BY customer_id
    );