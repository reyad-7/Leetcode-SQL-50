-- Select all columns from the Cinema table
-- Filter rows where the ID is odd and the description is not 'boring'
-- Sort the result by rating in descending order

SELECT * 
FROM Cinema 
WHERE MOD(id, 2) = 1 -- Check if the ID is odd
  AND description <> 'boring' -- Exclude rows where the description is 'boring'
ORDER BY rating DESC; -- Order the results by rating in descending order
