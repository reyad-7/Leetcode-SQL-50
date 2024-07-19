# Write your MySQL query statement below
-- Your task is to swap the seat id of every two consecutive students.
-- If the number of students is odd, the id of the last student is not swapped.
--  how can we do it ? 
-- first we use case conditions to handle the cases 
select 
case
    -- 1-If the id is the last one and it is odd , keep the id the same
    when id = (select max(id)from Seat ) and id % 2 = 1 
        then id 
    -- 2-If the id is odd, swap it with the next even id by adding 1 to this odd id    
    when id % 2 = 1
        then id + 1
    -- 3-If the id is even, swap it with the previous odd id by subtracting 1     
    when id % 2 = 0 
        then id - 1
    -- then retreiving the corresponding name based on the id handled by if conditions 
    end as id ,student 
    from Seat 
    -- then order the results by the new id to reflect the swapped order
order by id     