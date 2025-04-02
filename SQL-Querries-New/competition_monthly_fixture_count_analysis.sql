-- COMPETITION BREAKDOWN BY FIXTURE COUNT BY MONTH AND YEARS
SELECT name,YEAR(StartTimeUTC) AS year,
    CASE MONTH(StartTimeUTC)
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February' 
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        WHEN 12 THEN 'December'
        ELSE '--'
	END AS months,SUM(fixture_count) AS fixture_count_pm
	FROM
   (SELECT t1.name,t3.StartTimeUTC,COUNT(t3.FixtureId) AS fixture_count
    FROM [database].[Competition] AS t1
    LEFT JOIN [database].[League] AS t2 ON t1.CompetitionId = t2.CompetitionId
    LEFT JOIN [database].[Fixture] AS t3 ON t2.LeagueId = t3.LeagueId
    WHERE t1.name IN ('English Premier League')
    GROUP BY t1.name,t3.StartTimeUTC) sub
GROUP BY name,YEAR(StartTimeUTC),MONTH(StartTimeUTC)
ORDER BY YEAR(StartTimeUTC) DESC,MONTH(StartTimeUTC);