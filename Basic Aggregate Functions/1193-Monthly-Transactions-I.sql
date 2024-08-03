-- Your task is to find for each month and country:
-- 1. The number of transactions
-- 2. Their total amount
-- 3. The number of approved transactions
-- 4. Their total amount

SELECT 
    -- Format the transaction date to 'YYYY-MM' to get the month
    DATE_FORMAT(t.trans_date, '%Y-%m') AS month, 
    t.country, 
    -- Count the total number of transactions
    COUNT(t.id) AS trans_count,
    -- Count the number of approved transactions using CASE WHEN
    COUNT(CASE WHEN t.state = 'approved' THEN 1 END) AS approved_count,
    -- Sum the total amount of transactions
    SUM(t.amount) AS trans_total_amount,
    -- Sum the total amount of approved transactions using CASE WHEN
    SUM(CASE WHEN t.state = 'approved' THEN t.amount ELSE 0 END) AS approved_total_amount
FROM Transactions t
-- Group by country and formatted month to calculate the metrics for each month and country
GROUP BY t.country, DATE_FORMAT(t.trans_date, '%Y-%m');
