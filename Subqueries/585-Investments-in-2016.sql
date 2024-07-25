-- Your task is to find the sum of total investment values in 2016 (tiv_2016) for all policyholders who:
-- 1. Have the same tiv_2015 value as one or more other policyholders.
-- 2. Are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).

-- Step 1: Create a CTE to filter out rows with unique (lat, lon) pairs.
-- Subquery to find (lat, lon) pairs that appear only once in the Insurance table.
with cte as (
    select * from Insurance where (lat , lon) in (
        select lat,lon from Insurance
        group by lat,lon 
        having count(*) = 1
    )
)

-- Step 2: Select the sum of tiv_2016 from the CTE for policyholders with tiv_2015 that appears more than once.
select round(sum(tiv_2016),2) as tiv_2016 from cte where tiv_2015 in ( 
    -- Subquery to find tiv_2015 values that appear more than once in the CTE. 
    select tiv_2015 from Insurance group by tiv_2015 
    -- this part check if the values appears more than once 
    having COUNT(*) > 1 
)
