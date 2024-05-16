Update s 
set s.code_id = d.code_id
from dbo.Students s
join dbo.Direction d 
  on s.direction = d.name_direction

