# Write your MySQL query statement below
# only one dept = N , Y = Primary dept.
#get the emp who has Y and also those who has only one

-- Part 1: Employees with a primary department
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION

-- Part 2: Employees who belong to only one department
SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(department_id) = 1;