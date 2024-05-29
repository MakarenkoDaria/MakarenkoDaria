CREATE OR ALTER PROC SP_direction_students 
@code_id int
AS 
  
BEGIN
    IF @code_id <> 1
	RAISERROR('Некорректный код направления', 16, 1);
	
    SELECT s.Name+ ' ' + s.Surname AS Student_name, d.Name_direction
    FROM dbo.Students s 
	join dbo.Direction d
	on s.Code_id = d.Code_id
	and s.Exam_score > d.Min_score
	and s.Code_id = @code_id
END;


--exec SP_direction_students 1
--exec SP_direction_students 2
