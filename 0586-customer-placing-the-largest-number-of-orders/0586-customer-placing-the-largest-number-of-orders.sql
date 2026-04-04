# Write your MySQL query statement below
/* select count(*) as customer_number from orders where customer_number = (select max(customer_number) from orders o2 where count(*) > 1 );
*/

select customer_number 
from Orders 
group by customer_number
order by count(customer_number) desc
limit 1;


