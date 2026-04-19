# Write your MySQL query statement below

with CTE_quality as( 
select query_name,
Round(avg(rating/position), 2) as quality,
Round(sum(Case when rating < 3 then 1 else 0 END)*100 / count(*), 2) as poor_query_percentage
from queries
group by query_name 
)

select * from CTE_quality;
