 select d.Name_direction, s.average_rate, s.Name as best_result
 from dbo.Direction d
 left join 
 (
   select Name + ' ' + Surname as Name,
          Exam_score,
		  Code_id,
		  AVG(Exam_score) over (partition by code_id) as average_rate, --определяем средний балл по направлению
		  MAX(Exam_score) over (partition by code_id) as max_rate, -- определяем максимальный балл по направлению
		  ROW_NUMBER() over (partition by code_id, Exam_score  order by Name) as rn -- при одинаковом максимальном балле у нескольких студентов определяем первого
   from dbo.Students
 ) s on s.Code_id = d.Code_id 
     and s.max_rate = s.Exam_score -- берём только студентов с максимальным баллом  
	 and rn = 1 -- берём только одного студента с максимальным баллом для каждого направления