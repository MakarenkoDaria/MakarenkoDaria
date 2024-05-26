IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Students') AND type in (N'U'))
BEGIN
  DROP TABLE dbo.Students
 
  CREATE TABLE dbo.Students(
  	User_id int NOT NULL,
  	Name varchar(100) NOT NULL,
  	Surname varchar(100) NOT NULL,
  	Exam_score int NULL,
  	Code_id int NOT NULL,
  PRIMARY KEY CLUSTERED 
  (
  	User_id, Code_id ASC
  )
  ) 
  ALTER TABLE dbo.Students  WITH CHECK ADD CONSTRAINT FK_Students_Direction_Code_id FOREIGN KEY(Code_id)
  REFERENCES dbo.Direction (Code_id)
  
END
GO