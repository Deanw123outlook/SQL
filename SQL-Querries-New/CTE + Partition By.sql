-- CTE + Partition By()
-- ROW_NUMBER() OVER(PARTITION BY [] ORDER BY [])
SELECT * FROM (
  SELECT [Id],[CompetitionId],[Code],[Active],[Name],[ClientId],
  ROW_NUMBER() OVER(PARTITION BY Name ORDER BY Name ASC) AS test
  FROM [database.[dbo].[table]
  WHERE [Active] = 1) sub
ORDER BY test;