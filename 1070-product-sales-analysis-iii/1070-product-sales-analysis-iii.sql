# Write your MySQL query statement below
select product_id, year as first_year, quantity, price
from ( 
    select *, rank() over(partition by product_id order by year) as rn
from sales
) t
where rn = 1;

/* select product_id, year as first_year, quantity, price
from sales
where (product_id, year) In(
    select product_id, min(year) 
    from sales
    group by product_id 
);
*/