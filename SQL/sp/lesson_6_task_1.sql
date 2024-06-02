CREATE OR ALTER PROC SP_direction_students 
@code_id int
AS 
  
BEGIN

	IF NOT EXISTS (SELECT 1 FROM Direction WHERE code_id = @code_id) 
	RAISERROR('Некорректный код направления', 16, 1);

    SELECT STRING_AGG (s.Name+ ' ' + s.Surname, ', ') AS Student_name, d.Name_direction
    FROM dbo.Students s 
	join dbo.Direction d
	on s.Code_id = d.Code_id
	and s.Exam_score > d.Min_score
	and s.Code_id = @code_id
	GROUP BY d.Name_direction
END;




--exec SP_direction_students 1
--exec SP_direction_students 2
--exec SP_direction_students 3
--exec SP_direction_students 6