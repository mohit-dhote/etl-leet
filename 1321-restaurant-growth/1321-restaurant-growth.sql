# Write your MySQL query statement below

SELECT 
    visited_on,
    SUM(amount) OVER (ORDER BY visited_on ROWS 6 PRECEDING) AS amount,
    ROUND(SUM(amount) OVER (ORDER BY visited_on ROWS 6 PRECEDING) / 7, 2) AS average_amount
FROM (
    SELECT visited_on, SUM(amount) amount
    FROM Customer
    GROUP BY visited_on
) t
LIMIT 100000 OFFSET 6;