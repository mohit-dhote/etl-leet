# Write your MySQL query statement below
select person_name 
from (
    select person_name,
    sum(weight) over(order by turn) as total_sum
    from Queue  
) t 
where total_sum <= 1000
order by total_sum desc
limit 1;