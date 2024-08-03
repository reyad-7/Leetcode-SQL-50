-- Select the product_id and the average price calculated for each product
-- Calculate the average price as the total price divided by the total units sold
-- Use ROUND() to round the average price to 2 decimal places

SELECT p.product_id, 
       ROUND(IFNULL(SUM(p.price * u.units) / SUM(u.units), 0), 2) AS average_price 
FROM Prices p 
-- Perform a left outer join between Prices and UnitsSold tables
LEFT OUTER JOIN UnitsSold u 
ON p.product_id = u.product_id 
   AND u.purchase_date BETWEEN p.start_date AND p.end_date 
-- Group the results by product_id
GROUP BY p.product_id;
