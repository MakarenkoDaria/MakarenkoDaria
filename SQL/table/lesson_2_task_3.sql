IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = N'Exam_score' AND TABLE_NAME = 'Students')
ALTER TABLE dbo.Students
ADD Exam_score INT NULL;