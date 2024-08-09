-- your task is to select the user_id from the Signups table and calculate the confirmation rate

select s.user_id,
        -- Calculate the confirmation rate by averaging the 'confirmed' actions
        -- If no confirmation actions exist, return 0 as the default value
        round(ifnull(avg(c.action='confirmed'),0),2) as confirmation_rate
from Signups s 
    -- Perform a LEFT OUTER JOIN between Signups and Confirmations tables
    -- This ensures that every user_id from the Signups table is included in the result,
    -- even if they have no corresponding entries in the Confirmations table
left outer join Confirmations c 
on s.user_id = c.user_id
-- Group the results by user_id to calculate the confirmation rate for each user
group by s.user_id 