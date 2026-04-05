# Write your MySQL query statement below
/*select count(*) as num ( 
select requester_id as id from RequestAccepted
union all 
select accepter_id  as id from RequestAccepted
) as friends
group by id
order by num desc
limit 1;
*/

-- using CTE
with allfriends as (
    select requester_id as id from RequestAccepted 
    union all 
    select accepter_id  as id from RequestAccepted 
),
cnt as (
    select id, count(*) as num 
    from allfriends
    group by id
)
select id, num 
from cnt 
where num =(select max(num) from cnt);