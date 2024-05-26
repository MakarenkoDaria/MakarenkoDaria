select s.Name as Student_name, d.Name_direction as best_direction, s.average_rate
 from dbo.Direction d
 left join 
 (
   select Name + ' ' + Surname as Name,
          Exam_score,
		  Code_id,
		  AVG(Exam_score) over (partition by user_id) as average_rate, --определяем средний балл по студенту
		  MAX(Exam_score) over (partition by code_id) as max_rate, -- определяем максимальный балл по направлению
		  ROW_NUMBER() over (partition by code_id, Exam_score  order by user_id) as rn -- при одинаковом максимальном балле у нескольких студентов определяем того, у которого наименьший номер
   from dbo.Students
 ) s on s.Code_id = d.Code_id 
     and s.max_rate = s.Exam_score -- берём только студентов с максимальным баллом  
	 and rn = 1 -- берём только одного студента с максимальным баллом для каждого направления

GO