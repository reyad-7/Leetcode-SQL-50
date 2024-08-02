# Write your MySQL query statement below
-- your task is to write a solution to find the users who have valid emails.
-- valid mail : 
-- 1. The prefix name must start with a letter.
-- 2. The prefix name can contain letters, digits, underscores (_), periods (.), or dashes (-).
-- 3. The domain part must be exactly '@leetcode.com'.


-- REGEXP is used to match the email address pattern.
-- ^ asserts the position at the start of the string.
-- [a-zA-Z] matches a single letter at the start of the prefix.
-- [a-zA-Z0-9._-]* matches zero or more allowed characters in the prefix.

-- @leetcode\\.com matches the domain part, where \\. escapes the dot.
-- note : Without Escaping (@leetcode.com) This pattern would match any character in place of the dot ex : (@leetcodeXcom) will match this ... so we escape the dot for that reason

-- $ asserts the position at the end of the string.

select * from Users where  mail REGEXP '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$' 

