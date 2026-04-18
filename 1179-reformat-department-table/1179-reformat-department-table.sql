# Write your MySQL query statement below

select id, 
SUM(case when month = 'Jan' then revenue  else Null end) as Jan_Revenue,
SUM(case when month = 'Feb' then revenue  else Null end) as Feb_Revenue,
SUM(case when month = 'Mar' then revenue  else Null end) as Mar_Revenue,
SUM(case when month = 'Apr' then revenue  else Null end) as Apr_Revenue,
SUM(case when month = 'May' then revenue  else Null end) as May_Revenue,
SUM(case when month = 'Jun' then revenue  else Null end) as Jun_Revenue,
SUM(case when month = 'Jul' then revenue  else Null end) as Jul_Revenue,
SUM(case when month = 'Aug' then revenue  else Null end) as Aug_Revenue,
SUM(case when month = 'Sep' then revenue  else Null end) as Sep_Revenue,
SUM(case when month = 'Oct' then revenue  else Null end) as Oct_Revenue,
SUM(case when month = 'Nov' then revenue  else Null end) as Nov_Revenue,
SUM(case when month = 'Dec' then revenue  else Null end) as Dec_Revenue
from department
group by id;


