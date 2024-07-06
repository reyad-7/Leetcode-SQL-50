# Write your MySQL query statement below
select round (count(a1.player_id) / (SELECT COUNT(distinct a3.player_id) FROM Activity a3),2)
as fraction from Activity a1 
where (a1.player_id,DATE_SUB(A1.event_date, INTERVAL 1 DAY)) in  (
    select a2.player_id ,min(a2.event_date)from Activity a2 
    group by a2.player_id
)

-- Your task is to get the percentage of all users who logged in for at least 2 consecutive days starting from their first login date.

-- so how can you solve it : 

-- First, you want to get the minimum event date for each player, as it represents their first login date.

-- Inner Query:
-- In the inner query, we get each player's ID along with their first login date:

-- Outer Query:
-- then , we find the users whose event_date is greater than this first eventdate by only 1 and they are the users we want;
-- we acheive this by using built in function as shown above (DATE_SUB(A1.--event_date, INTERVAL 1 DAY)

-- so we count them and divide by the total (distinct) number of players to get the ratio. 