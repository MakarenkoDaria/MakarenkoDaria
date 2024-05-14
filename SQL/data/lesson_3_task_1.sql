IF NOT EXISTS (SELECT* FROM Students WHERE Surname in ('Бунша', 'Бендер', 'Тимофеев'))

INSERT INTO dbo.Students (Name,Surname,Exam_score,Direction)
VALUES ('Иван', 'Бунша', 220, 'История'),
       ('Остап', 'Бендер', 170, 'Право'),
	   ('Александр', 'Тимофеев', 300, 'Физика');

