# Write your MySQL query statement below
select c.customer_id 
from product p inner join customer c
on p.product_key = c.product_key
group by c.customer_id 
having count(Distinct c.product_key) = (select count(*) from product);