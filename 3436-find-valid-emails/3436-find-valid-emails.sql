# Write your MySQL query statement below
SELECT user_id, email
FROM users
WHERE email REGEXP '^[a-z0-9_]+@[a-z]+\\.com$'
ORDER BY user_id ASC;