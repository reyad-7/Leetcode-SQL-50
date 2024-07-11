# Write your MySQL query statement below
select x, y , z , 
case
when ( x + y > z and x + z > y and y + z > x)
       THEN \Yes\
       ELSE \No\ 
       END as triangle 
from Triangle 


-- another syntax for if condition 

-- SELECT *, IF(x+y>z and y+z>x and z+x>y, \Yes\, \No\) as triangle FROM Triangle