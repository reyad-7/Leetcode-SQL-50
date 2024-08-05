-- Your task is to report the product_name, year, and price for each sale_id in the Sales table.
-- it is jus a basic join to retrieve required data 

select p.product_name  , s.year , s.price 
from Sales s join Product p on s.product_id = p.product_id