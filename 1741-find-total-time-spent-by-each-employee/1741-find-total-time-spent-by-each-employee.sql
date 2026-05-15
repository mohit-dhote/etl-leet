# Write your MySQL query statement below 
# out-in = total_time, event_day grp by event day & emp id, 
select event_day as day, emp_id, 
sum(out_time - in_time) as total_time
from employees
group by emp_id, event_day
order by event_day 