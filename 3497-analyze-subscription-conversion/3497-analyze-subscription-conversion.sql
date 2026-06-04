# Write your MySQL query statement below
with trial_avg as(
    select user_id,
    round(avg(activity_duration),2) as avg_trial
    from useractivity
    where activity_type = 'free_trial'
    group by user_id
),
paid_avg as(
    select user_id,
    round(avg(activity_duration),2) as avg_paid
    from useractivity
    where activity_type = 'paid'
    group by user_id
)

select t.user_id, 
t.avg_trial as trial_avg_duration,
p.avg_paid as paid_avg_duration 
from trial_avg t join paid_avg p
on t.user_id = p.user_id;

