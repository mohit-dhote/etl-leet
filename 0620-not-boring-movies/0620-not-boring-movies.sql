# Write your MySQL query statement below
select ID, MOVIE, DESCRIPTION, RATING 
FROM Cinema 
WHERE ID%2 != 0 AND description != "boring"
ORDER BY RATING DESC;