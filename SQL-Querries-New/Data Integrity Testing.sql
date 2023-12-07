/****** FixAPIFeedProvidesMappings table  ******/
SELECT [FixUnqiueID],[SourceFixID],[Source],[SourceFixName]
FROM [DatabaseName].[dbo].[FixAPIFeedProvidesMappings]
WHERE [FixUnqiueID] = xxxxxx;

/***Distinct APIFeed Provider Sources***/
SELECT DISTINCT Source FROM [DatabaseName].[dbo].[FixAPIFeedProvidesMappings]

/****** Fix Information - FixFeedMapping ******/
SELECT t1.[FixUnqiueID],t6.[SourceFixID],t4.[Name] AS "HT",t4.[TUniqueID],t5.[Name] AS "AT",t5.[TUniqueID],t6.[SourceFixName], t1.[LeagueUniqueID],t2.[MasterAPIFeedProvSource],t6.[Source] AS "FixAPIFeedProvidesMappingsSourceReference", t2.[EndDate] AS [LeagueEndDate],t2.[CompId],t3.[Name] AS "CompsName",t2.[Active] AS [LeagueActive],t1.[TimestampUTC],t1.[APIFeedID],
t1.[Resolved],t1.[DisableAutoUpdates]
FROM [DatabaseName].[dbo].[Fix] AS t1 
FULL OUTER JOIN [DatabaseName].[dbo].[League] AS t2 ON t1.LeagueUniqueID = t2.LeagueUniqueID 
FULL OUTER JOIN [DatabaseName].[dbo].[Comps] AS t3 ON t2.CompId = t3.CompId 
FULL OUTER JOIN [DatabaseName].[dbo].[Teams] AS t4 ON t1.HTId = t4.TUniqueID 
FULL OUTER JOIN [DatabaseName].[dbo].[Teams] AS t5 ON t1.AwayTUniqueID = t5.TUniqueID 
FULL OUTER JOIN [DatabaseName].[dbo].[FixAPIFeedProvidesMappings] AS t6 ON t1.[FixUnqiueID] = t6.[FixUnqiueID]
WHERE t1.[TimestampUTC] BETWEEN '2023-10-20 00:00:00.000' AND '2023-10-22 00:00:00.000' AND t1.[LeagueUniqueID] = 900 AND t1.[FixUnqiueID] = xxxxxx ORDER BY t1.[TimestampUTC];

/****** League - FixFeedMapping ******/
SELECT t1.[FixUnqiueID],t6.[SourceFixID],t4.[Name] AS "HT",t4.[TUniqueID],t5.[Name] AS "AT",t5.[TUniqueID],t6.[SourceFixName], t1.[LeagueUniqueID],t2.[MasterAPIFeedProvSource],t6.[Source] AS "FixAPIFeedProvidesMappingsSourceReference", t2.[EndDate] AS [LeagueEndDate],t2.[CompId],t3.[Name] AS "CompsName",t2.[Active] AS [LeagueActive],t1.[TimestampUTC],t1.[APIFeedID],
t1.[Resolved],t1.[DisableAutoUpdates]
FROM [DatabaseName].[dbo].[Fix] AS t1 
FULL OUTER JOIN [DatabaseName].[dbo].[League] AS t2 ON t1.LeagueUniqueID = t2.LeagueUniqueID 
FULL OUTER JOIN [DatabaseName].[dbo].[Comps] AS t3 ON t2.CompId = t3.CompId 
FULL OUTER JOIN [DatabaseName].[dbo].[Teams] AS t4 ON t1.HTId = t4.TUniqueID 
FULL OUTER JOIN [DatabaseName].[dbo].[Teams] AS t5 ON t1.AwayTUniqueID = t5.TUniqueID 
FULL OUTER JOIN [DatabaseName].[dbo].[FixAPIFeedProvidesMappings] AS t6 ON t1.[FixUnqiueID] = t6.[FixUnqiueID]
WHERE t1.[TimestampUTC] BETWEEN '2023-11-20 00:00:00.000' AND '2023-11-26 00:00:00.000' AND t1.[LeagueUniqueID] = 900 ORDER BY t1.[TimestampUTC];

/****** Fix Information - FixFeedMapping ******/
SELECT t1.[FixUnqiueID],t6.[SourceFixID],t4.[Name] AS "HT",t4.[TUniqueID],t5.[Name] AS "AT",t5.[TUniqueID],t6.[SourceFixName], t1.[LeagueUniqueID],t2.[MasterAPIFeedProvSource],t6.[Source] AS "FixAPIFeedProvidesMappingsSourceReference", t2.[EndDate] AS [LeagueEndDate],t2.[CompId],t3.[Name] AS "CompsName",t2.[Active] AS [LeagueActive],t1.[TimestampUTC],t1.[APIFeedID],
t1.[Resolved],t1.[DisableAutoUpdates]
FROM [DatabaseName].[dbo].[Fix] AS t1 
FULL OUTER JOIN [DatabaseName].[dbo].[League] AS t2 ON t1.LeagueUniqueID = t2.LeagueUniqueID 
FULL OUTER JOIN [DatabaseName].[dbo].[Comps] AS t3 ON t2.CompId = t3.CompId 
FULL OUTER JOIN [DatabaseName].[dbo].[Teams] AS t4 ON t1.HTId = t4.TUniqueID 
FULL OUTER JOIN [DatabaseName].[dbo].[Teams] AS t5 ON t1.AwayTUniqueID = t5.TUniqueID 
FULL OUTER JOIN [DatabaseName].[dbo].[FixAPIFeedProvidesMappings] AS t6 ON t1.[FixUnqiueID] = t6.[FixUnqiueID]
WHERE t1.[TimestampUTC] BETWEEN '2023-10-20 00:00:00.000' AND '2023-10-22 00:00:00.000' AND t1.[LeagueUniqueID] = 900 AND t6.[Source] = 12 ORDER BY t1.[TimestampUTC];