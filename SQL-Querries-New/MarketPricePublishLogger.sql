-- MarketPricePublishLogger Time Seconds
SELECT [Id],[FixtureId],[ClientId],[InstanceId],[Match],[Output],[ErrorMessages],[PublishedSource],[Status],[CreatedBy],[CreatedDate],[FinishedDate],DATEDIFF(SECOND,[CreatedDate],[FinishedDate]) PublishTimeTakenSeconds
  FROM [scl_prod].[dbo].[MarketPricePublishLogger]
  WHERE [FixtureId] IN (073935,076166,076147,076151) ORDER BY PublishTimeTakenSeconds DESC;
  
-- MarketPricePublishLogger Time Minutes
SELECT [Id],[FixtureId],[ClientId],[InstanceId],[Match],[Output],[ErrorMessages],[PublishedSource],[Status],[CreatedBy],[CreatedDate],[FinishedDate],DATEDIFF(MINUTE,[CreatedDate],[FinishedDate]) PublishTimeTakenMinutes
  FROM [scl_prod].[dbo].[MarketPricePublishLogger]
  WHERE [FixtureId] IN (073935,076166,076147,076151) ORDER BY PublishTimeTakenMinutes DESC;
  
  
-- Fixture Publishing Time Seconds 
SELECT [Id],[FixtureId],[ClientId],[InstanceId],[Match],[Output],[ErrorMessages],[PublishedSource],[Status],[CreatedBy],[CreatedDate],[FinishedDate],DATEDIFF(SECOND,[CreatedDate],[FinishedDate]) PublishTimeTakenSeconds
  FROM [scl_prod].[dbo].[MarketPricePublishLogger]
  WHERE [CreatedDate] >= '2025-01-15 15:30:00.000' ORDER BY CreatedDate DESC;
  
  
-- STATIC AVERAGE + STATIC STANDARD DEVIATION
WITH publishes AS (SELECT [Id],[FixtureId],[ClientId],[InstanceId],[Match],[Output],[ErrorMessages],[PublishedSource],[Status],[CreatedBy],[CreatedDate],[FinishedDate],DATEDIFF(SECOND,[CreatedDate],[FinishedDate]) PublishTimeTakenSeconds
  FROM [scl_prod].[dbo].[MarketPricePublishLogger]
  WHERE [CreatedDate] >= '2025-02-24 13:30:00.000')
SELECT AVG(PublishTimeTakenSeconds) AS average,STDEV(PublishTimeTakenSeconds) AS standard_deviation FROM publishes;


-- CTE Simple Moving Average (Publishing Logs)
WITH publishes AS (
  SELECT [id][fixtureid],[CreatedDate],[FinishedDate],DATEDIFF(SECOND,[CreatedDate],[FinishedDate]) PublishTimeTakenSeconds
  FROM [scl_prod].[dbo].[MarketPricePublishLogger]
  WHERE [CreatedDate] >= '2025-02-06 12:30:00.000')
SELECT *, AVG(PublishTimeTakenSeconds) OVER(ORDER BY CreatedDate ROWS BETWEEN 20 PRECEDING AND CURRENT ROW)
AS PublishTimeTakenSecondsSMA
FROM publishes ORDER BY CreatedDate DESC;

-- CTE Moving Standard Deviation (STDEV) Sample Population(Publishing Logs)
WITH publishes AS (
  SELECT [id][fixtureid],[CreatedDate],[FinishedDate],DATEDIFF(SECOND,[CreatedDate],[FinishedDate]) PublishTimeTakenSeconds
  FROM [scl_prod].[dbo].[MarketPricePublishLogger]
  WHERE [CreatedDate] >= '2025-02-20 14:00:00.000')
SELECT *, STDEV(PublishTimeTakenSeconds) OVER(ORDER BY CreatedDate ROWS BETWEEN 3 PRECEDING AND CURRENT ROW)
AS PublishTimeTakenSeconds_std
FROM publishes ORDER BY CreatedDate DESC;

-- Python Visualization
-- CTE Moving Standard Deviation (Publishing Logs)
WITH publishes AS (
  SELECT [id],[fixtureid],[CreatedDate],[FinishedDate],DATEDIFF(SECOND,[CreatedDate],[FinishedDate]) PublishTimeTakenSeconds
  FROM [scl_prod].[dbo].[MarketPricePublishLogger]
  WHERE [CreatedDate] >= '2025-02-20 14:00:00.000'), publishes_x2 AS (
    SELECT *, STDEV(PublishTimeTakenSeconds) OVER(ORDER BY CreatedDate ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS PublishTimeTakenSeconds_std,
	   AVG(PublishTimeTakenSeconds) OVER(ORDER BY CreatedDate ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS PublishTimeTakenSeconds_sma
       FROM publishes)
SELECT [PublishTimeTakenSeconds],PublishTimeTakenSeconds_sma,ROUND(PublishTimeTakenSeconds_std,2) 
AS PublishTimeTakenSeconds_std_rounded FROM publishes_x2 ORDER BY CreatedDate DESC;


-- DATETIME COMPARISONS
--
BEGIN
DECLARE @vara DATETIME,@varb DATETIME,@varc DATETIME;
SET @vara = '2025-02-26 08:00:00.000';
SET @varb = '2025-02-26 10:00:00.000';
SET @varc = '2025-02-26 11:00:00.000';
-- STATIC AVERAGE + STATIC STANDARD DEVIATION
WITH publishes AS (SELECT [Id],[FixtureId],[ClientId],[InstanceId],[Match],[Output],[ErrorMessages],[PublishedSource],[Status],[CreatedBy],[CreatedDate],[FinishedDate],DATEDIFF(SECOND,[CreatedDate],[FinishedDate]) PublishTimeTakenSeconds
  FROM [scl_prod].[dbo].[MarketPricePublishLogger]
  WHERE [CreatedDate] >= @vara)
SELECT @vara,AVG(PublishTimeTakenSeconds) AS static_average,STDEV(PublishTimeTakenSeconds) AS static_standard_deviation FROM publishes;
-- STATIC AVERAGE + STATIC STANDARD DEVIATION
WITH publishes AS (SELECT [Id],[FixtureId],[ClientId],[InstanceId],[Match],[Output],[ErrorMessages],[PublishedSource],[Status],[CreatedBy],[CreatedDate],[FinishedDate],DATEDIFF(SECOND,[CreatedDate],[FinishedDate]) PublishTimeTakenSeconds
  FROM [scl_prod].[dbo].[MarketPricePublishLogger]
  WHERE [CreatedDate] >= @varb)
SELECT @varb,AVG(PublishTimeTakenSeconds) AS static_average,STDEV(PublishTimeTakenSeconds) AS static_standard_deviation FROM publishes;
-- STATIC AVERAGE + STATIC STANDARD DEVIATION
WITH publishes AS (SELECT [Id],[FixtureId],[ClientId],[InstanceId],[Match],[Output],[ErrorMessages],[PublishedSource],[Status],[CreatedBy],[CreatedDate],[FinishedDate],DATEDIFF(SECOND,[CreatedDate],[FinishedDate]) PublishTimeTakenSeconds
  FROM [scl_prod].[dbo].[MarketPricePublishLogger]
  WHERE [CreatedDate] >= @varc)
SELECT @varc,AVG(PublishTimeTakenSeconds) AS static_average,STDEV(PublishTimeTakenSeconds) AS static_standard_deviation FROM publishes;
END

