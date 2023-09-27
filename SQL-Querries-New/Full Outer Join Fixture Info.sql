/****** Fixture AwayTeam HomeTeam League CompetitonName Date FeedId database retrieval (Full Outer Join) ******/
SELECT t1.[FixtureId],t4.[Name] AS "HomeTeam",t4.[TeamId],t5.[Name] AS "AwayTeam",t5.[TeamId], t1.[LeagueId],t2.[Source], t2.[EndDate] AS [LeagueEndDate],t2.[CompeID],t3.[Name] AS "CompetitionName",t2.[Active] AS [CompetitonLeagueActive],t1.[FixtureStartTimeUTC],t1.[FeedId],
t1.[FixturePaymentsSettled],t1.[DisableSchedueledStartTimeUpdates]
FROM [database_name].[dbo].[Fixture] AS t1 
FULL OUTER JOIN [database_name].[dbo].[League] AS t2 ON t1.LeagueId = t2.LeagueId 
FULL OUTER JOIN [database_name].[dbo].[Competition] AS t3 ON t2.CompeID = t3.CompeID 
FULL OUTER JOIN [database_name].[dbo].[Team] AS t4 ON t1.HomeTeamId = t4.TeamId 
FULL OUTER JOIN [database_name].[dbo].[Team] AS t5 ON t1.AwayTeamId = t5.TeamId 
WHERE t1.[FixtureStartTimeUTC] BETWEEN '2023-09-20 00:00:00.000' AND '2023-09-22 00:00:00.000' AND t1.[LeagueId] = 'xxx';

/****** Fixture & ExternalFixtureId Data  ******/
SELECT t1.[ClientId], t7.[Name],t1.[FixtureId],t4.[Name] AS [HomeTeam],t5.[Name] AS [AwayTeam],t1.[ExternalFixtureId],t3.[LeagueId],t3.[CompeID],t6.[Name] AS [Competition-Name], t2.[FixtureStartTimeUTC]
 FROM [database_name].[dbo].[ExternalFixtureId] AS t1 
 FULL OUTER JOIN [database_name].[dbo].[Fixture] AS t2 ON t1.[FixtureId] = t2.[FixtureId] 
 FULL OUTER JOIN [database_name].[dbo].[League] AS t3 ON t2.[LeagueId] = t3.[LeagueId] 
 FULL OUTER JOIN [database_name].[dbo].[Team] AS t4 ON t2.[HomeTeamId] = t4.[TeamId] 
 FULL OUTER JOIN [database_name].[dbo].[Team] AS t5 ON t2.[AwayTeamId] = t5.[TeamId]
 FULL OUTER JOIN [database_name].[dbo].[Competition] AS t6 ON t3.[CompeID] = t6.[CompeID]
 FULL OUTER JOIN [database_name].[dbo].[Clients] AS t7 ON t1.[ClientId] = t7.[ClientId]
 WHERE t1.[FixtureId] = 'xxxxxx';

/***** Fixture & Serivce Fixture Id Data *****/
SELECT t1.[FixtureId],t4.[Name] AS [HomeTeam],t5.[Name] AS [AwayTeam],t2.[FixtureStartTimeUTC],t1.[ServiceProviderFixtureId],t3.[LeagueId],t3.[CompeID],t6.[Name] AS [Competition-Name]
FROM [database_name].[dbo].[ServiceProvider] AS t1
FULL OUTER JOIN [database_name].[dbo].[Fixture] AS t2 ON t1.[FixtureId] = t2.[FixtureId] 
FULL OUTER JOIN [database_name].[dbo].[League] AS t3 ON t1.[LeagueId] = t3.[LeagueId]
FULL OUTER JOIN [database_name].[dbo].[Team] AS t4 ON t2.[HomeTeamId] = t4.[TeamId] 
FULL OUTER JOIN [database_name].[dbo].[Team] AS t5 ON t2.[AwayTeamId] = t5.[TeamId]
FULL OUTER JOIN [database_name].[dbo].[Competition] AS t6 ON t3.[CompeID] = t6.[CompeID]
WHERE t1.[FixtureId] = 'xxxxxx';