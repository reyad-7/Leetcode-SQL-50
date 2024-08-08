# Write your MySQL query statement below

select mng.name from employee mng left outer join employee emp on mng.id = emp.managerId 
group by mng.id having (count(mng.id)>=5) 




-- Given the Employee table in the example:

-- +-----+-------+------------+-----------+
-- | id  | name  | department | managerId |
-- +-----+-------+------------+-----------+
-- | 101 | John  | A          | null      |
-- | 102 | Dan   | A          | 101       |
-- | 103 | James | A          | 101       |
-- | 104 | Amy   | A          | 101       |
-- | 105 | Anne  | A          | 101       |
-- | 106 | Ron   | B          | 101       |
-- +-----+-------+------------+-----------+


--  We join Employee as  (emp on mng.id = emp.managerId.)
--  After the join, the table might look like this 

-- mng.id\tmng.name\temp.id\temp.name
-- 101\t      John\t    102 \tDan
-- 101\t      John\t    103\t    James
-- 101\t      John\t    104 \tAmy
-- 101\t      John\t    105\t    Anne
-- 101\t      John\t    106 \tRon


-- then We group by mng.id, resulting in a single group for John (ID 101).

--  The HAVING COUNT(mng.id) >= 5 filters out managers with fewer than 5 reports. John has exactly 5, so he is included.