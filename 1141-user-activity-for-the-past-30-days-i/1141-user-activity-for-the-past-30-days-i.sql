# Write your MySQL query statement below
select count(distinct user_id) as active_users, activity_date as 'day'
from activity
where activity_date BETWEEN date_sub('2019-07-27', interval 29 day) AND '2019-07-27'
group by activity_date 
