# Write your MySQL query statement below
-- first cte to calculate org_level
-- | employee_id | employee_name | level |
-- | ----------- | ------------- | ----- |
-- | 1           | Alice         | 1     |
-- | 2           | Bob           | 2     |
-- | 3           | Charlie       | 2     |
-- | 4           | David         | 3     |
with recursive org_level as (
    -- base case with the executive
    select 
        employee_id, 
        employee_name,
        1 as level
    from Employees
    where manager_id is null

    union all 

    -- recursion step using the direct report to one above 
    select 
        e.employee_id,
        e.employee_name,
        ol.level + 1 as level
    from Employees e
    join org_level ol
        on e.manager_id = ol.employee_id
),

-- second recursive cte to see the organization relationship
-- find ALL subordinate report to a manager regardless level
-- | manager_id | subordinate_id | salary |
-- | ---------- | -------------- | ------ |
-- | 1          | 1              | 12000  |
-- | 1          | 2              | 10000  |
-- | 1          | 3              | 10000  |
-- | 1          | 4              | 7500   |
-- | 1          | 5              | 7500   |
-- | 1          | 6              | 9000   |
-- | 1          | 7              | 8500   |
-- | 1          | 8              | 6000   |
-- | 1          | 9              | 7000   |
-- | 1          | 10             | 7000   |
org_rela as (
    -- base case with all current employees
    select 
        employee_id as manager_id,
        employee_id as sub_id,
        salary
    from Employees

    union all 

    -- recursive step walking down the org tree
    select 
        orl.manager_id,
        e.employee_id as sub_id,
        e.salary
    from Employees e
    join org_rela orl
        on orl.sub_id = e.manager_id
)

select 
    ol.employee_id, 
    ol.employee_name,
    ol.level,
    count(orl.sub_id) - 1 as team_size,
    sum(orl.salary) as budget
from org_level ol
join org_rela orl
    on ol.employee_id = orl.manager_id
group by ol.employee_id, ol.employee_name, ol.level
order by ol.level, budget desc, ol.employee_name;