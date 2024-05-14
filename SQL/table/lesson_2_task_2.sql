IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Students') AND type in (N'U'))
  CREATE TABLE dbo.Students 
  (
      User_id INT IDENTITY (1,1),
      Name VARCHAR(100) NOT NULL,
      Surname VARCHAR(100) NOT NULL,
  	PRIMARY KEY (User_id)
  );
