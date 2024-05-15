IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Direction') AND type in (N'U'))
  CREATE TABLE dbo.Direction 
  (
      Code_id INT IDENTITY (1,1),
      Name_direction VARCHAR(255) NOT NULL,
      Min_score VARCHAR(255) NOT NULL,
  	PRIMARY KEY (Code_id)
  );