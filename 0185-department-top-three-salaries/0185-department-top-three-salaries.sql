select d.name AS Department, ranked.name AS Employee, ranked.salary AS Salary
from (
    select 
    e.name,
    e.salary,
    e.departmentId,
    dense_rank() over (partition by e.departmentId order by e.salary desc) as rn
    from Employee e
) AS ranked
join Department d ON ranked.departmentId = d.id
where rn <= 3;