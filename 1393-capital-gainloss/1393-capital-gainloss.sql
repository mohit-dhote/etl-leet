# Write your MySQL query statement below
-- each stock -- group by 

select stock_name, 
SUM(
    case
    when operation = 'Buy' then -price 
    when operation = 'sell' then +price 
else 0
END) as capital_gain_loss 
from Stocks
group by stock_name;
