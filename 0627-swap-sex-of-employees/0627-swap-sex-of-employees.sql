# Write your MySQL query statement below
 
update salary
set sex = case 
when sex = 'm' then 'f' 
when sex = 'f' then 'm' 
end;





 -- set sex = 'm' and sex = 'f'
 -- where sex = 'f' and sex = 'm';