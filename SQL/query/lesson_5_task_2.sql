select 
Name + ' ' + Surname as Student_name,
Name_direction
from dbo.Students s
join dbo.Direction d 
  on s.Code_id = d.Code_id
  where s.Exam_score > d.Min_score and d.Name_direction = 'История'
  go
  