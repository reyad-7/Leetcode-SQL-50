-- Your task is to find the percentage of the users registered in each contest,
-- rounded to two decimals.

-- First : Select the contest_id and calculate the percentage of users registered in each contest
-- then we Calculate the percentage of registered users for each contest by dividing the count of registered users by the total number of users and multiplying by 100

SELECT r.contest_id, ROUND((COUNT(r.user_id) / (SELECT COUNT(user_id) FROM Users)) * 100, 2) AS percentage
FROM Register r JOIN Users u ON r.user_id = u.user_id
-- Group the results by contest_id to calculate the percentage for each contest
GROUP BY r.contest_id
-- Order the results by percentage in descending order and by contest_id in ascending order in case of a tie
ORDER BY percentage DESC, contest_id ASC;
