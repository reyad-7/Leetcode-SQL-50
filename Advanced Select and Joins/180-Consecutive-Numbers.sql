# Write your MySQL query statement below
select distinct l1.num as ConsecutiveNums from logs l1
join logs l2 on l1.id=l2.id-1
join logs l3 on l1.id=l3.id-2
where l1.num=l2.num and l2.num=l3.num 


-- Your task is to find all numbers that appear at least three times consecutively in the Logs table.
-- To solve this, we need to compare each row with the next (two rows) to check if there are consecutive numbers.


-- First, we select the numbers from the Logs table and create aliases l1, l2, and l3 for three instances of the table:
-- l1 represents the current row.
-- l2 represents the row immediately next to l1.
-- l3 represents the row two positions after l1.

-- Next, we join the tables on conditions that ensure l2 and l3 follow l1 consecutively:
-- l1.id = l2.id - 1 ensures that l2 is the row immediately after l1.
-- l1.id = l3.id - 2 ensures that l3 is the row two positions after l1.

-- then check if these three  three consecutive rows have the same num or not 
-- (WHERE l1.num = l2.num AND l2.num = l3.num )


-- why we use distinct 
-- in this example the output will be 3 and 3 (3 appears 2 times ) this is wrong 
-- so we use distincit 

-- | id | num |
-- | -- | --- |
-- | 1  | 3   |
-- | 2  | 3   |
-- | 3  | 3   |
-- | 4  | 3   |