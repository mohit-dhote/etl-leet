# Write your MySQL query statement below
#scores  first score > latest score 
with scores_ranked as(
    select 
    student_id,
    subject, 
    score, 
    exam_date,
    row_number() over(partition by student_id, subject order by exam_date ASC) as first_atp,
    row_number() over(partition by student_id, subject order by exam_date desc) as last_atp
    from
    scores
)   

select 
f.student_id,
f.subject,
f.score as first_score,
l.score as latest_score
from scores_ranked f join scores_ranked l
on f.student_id = l.student_id and f.subject = l.subject
where f.first_atp = 1 
  AND l.last_atp = 1 and l.score > f.score 
order by f.student_id, f.subject;