# Write your MySQL query statement below
select d.name as Department,
       e.name as Employee, 
       e.salary as salary
from employee e inner join department d
on e.departmentId = d.id where e.salary = (select max(e2.salary) from employee e2 where e2.departmentId = e.departmentId)