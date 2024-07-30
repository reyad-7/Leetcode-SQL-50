# Write your MySQL query statement below

-- your task is to fix the names so that only the first character is uppercase and the rest are lowercase.

-- for this task we use CONCAT to combine the uppercase first character with the lowercase rest of the string.

select user_id ,concat(
    -- Convert the first character of the name to uppercase.
    upper(substring(name,1,1)),
    -- Convert the rest of the name to lowercase.
    lower (substring(name,2))
    ) as name
from Users order by user_id  