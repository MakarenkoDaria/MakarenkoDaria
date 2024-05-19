select 
Name + ' ' + Surname as Student_name,
Name_direction,
case 
    when s.Exam_score >= d.Min_score
	then 'Да'
	when s.Exam_score < d.Min_score
	then 'Нет'
	when s.Exam_score is null
	then null
end as Status
from dbo.Students s
join dbo.Direction d 
  on s.Code_id = d.Code_id
  go