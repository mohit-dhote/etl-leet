# Write your MySQL query statement below
with total_balence as(
    select
    account,
    sum(amount) as balance    
    from transactions
    group by account    
)

select u.name, tb.balance 
from users u 
join total_balence tb
on u.account = tb.account       
where tb.balance > 10000
