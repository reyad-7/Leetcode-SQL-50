-- Your task is to find the person_name of the last person that can fit on the bus 
-- without exceeding the weight limit of 1000 kilograms.
-- how can we handle this ?
-- using subquery :

-- inner subquery: calculate the cumulative sum of weights for each person 
-- (ordered asc by their turn)
--  we do this by using window function approach SUM(weight) OVER (ORDER BY turn ASC).
-- This gives us a running total of the weights in the order of their turn.
-- 'subQ' is just the alias for inner query 
-- now we got the persons fit into the bus with their turn sorted asc 

-- outer query : 
--  we will filter the result to find preson whose cumulative sun is smaller than or equal to 1000
-- we do this in using this condition (where subQ.CumSum <=1000) This filter out the people who would exceed the weight limit 

-- then we order the filtered results based on their turn desc to get the last person fit into 
-- using limit here to just get the only first person which is required 

select person_name from (
    select person_name , turn , sum(weight) over(order by turn asc) as CumSum from Queue     
) subQ
where subQ.CumSum <=1000
order by turn desc
limit 1;
