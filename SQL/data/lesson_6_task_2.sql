IF EXISTS (SELECT 1 FROM Direction WHERE capacity = 0)

UPDATE dbo.Direction
SET capacity = case code_id
                   when 1
                   then 2
                   when 2
                   then 2
                   when 3
                   then 1
               end
GO

