CREATE OR ALTER TRIGGER trg_students_ins_or_upd  
ON dbo.Students 
AFTER INSERT, UPDATE   
AS 
BEGIN
     UPDATE d 
     SET d.admission_is_over = 1
     FROM dbo.Direction d
     JOIN 
     (
       SELECT COUNT(user_id) as cnt, s.code_id
       FROM dbo.Students s 
	   JOIN dbo.Direction d
	   ON d.code_id = s.code_id
	   WHERE s.Exam_score > d.min_score
	   GROUP BY s.code_id
     ) s
     ON d.code_id = s.code_id AND s.cnt >= d.capacity
	 WHERE EXISTS (SELECT 1 FROM Inserted i WHERE i.code_id = d.code_id)
	 
END  
GO 
