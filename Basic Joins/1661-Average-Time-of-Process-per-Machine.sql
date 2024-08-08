
-- your task is to calculate the average processing time for each machine.

-- The average processing time is calculated by the total time taken to complete every process on the machine divided by the number of processes.
SELECT
    -- Calculate the average processing time and round it to 3 decimal places
    a.machine_id,ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time  
FROM Activity a  JOIN Activity b ON a.process_id = b.process_id AND a.machine_id = b.machine_id 
WHERE a.activity_type = 'start' AND b.activity_type = 'end' 
GROUP BY a.machine_id;  -- Group by machine ID to calculate the average processing time for each machine

