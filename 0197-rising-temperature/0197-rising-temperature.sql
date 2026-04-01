# Write your MySQL query statement below
select w.id from weather w join weather w1
on w.recordDate =  w1.recordDate + interval 1 day 
where w.temperature > w1.temperature;   


-- want -- record date
-- compair records date
-- compair temp
