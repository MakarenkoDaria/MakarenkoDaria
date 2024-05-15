IF NOT EXISTS (SELECT* FROM Direction WHERE Name_direction in ('История', 'Право', 'Физика'))

INSERT INTO dbo.Direction (Name_direction, Min_score)
VALUES ('История', 160),
       ('Право', 180),
	   ('Физика', 200);

