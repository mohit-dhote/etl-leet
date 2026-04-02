# Write your MySQL query statement below
-- want -- player_id, first_login
-- primary key -- player_id, event_date


select player_id, min(event_date) as first_login
from activity 
group by player_id;






