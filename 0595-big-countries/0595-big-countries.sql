# Write your MySQL query statement below


select name, population, area
from world
where area >= 3000000 Or population >= 25000000
group by name, population, area;



