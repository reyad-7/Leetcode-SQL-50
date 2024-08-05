# Write your MySQL query statement below
-- The task is to find all dates' IDs with higher temperatures compared to their previous dates (yesterday).

-- First use a self-join on the Weather table to compare each date's temperature with the previous date's temperature
-- We use the DATEDIFF func to ensure we are comparing each date with its previous date(yesterday)
-- then ensure the temperature of the current date is higher than the previous date
select First.id from Weather First , Weather Second 
where DATEDIFF(First.recordDate,Second.recordDate) = 1 
and  Second.temperature < First.temperature