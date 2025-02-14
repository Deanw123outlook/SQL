-- TIME SERIES ANALYSIS
-- TOTAL CRIMES RECORDED BY BLOCK/S PER HOUR (OVERTIME)
WITH data AS (
  SELECT date,EXTRACT(HOUR FROM date) AS hour,block,primary_type FROM `bigquery-public-data.chicago_crime.crime`
  )
SELECT hour,COUNT(primary_type) AS crime_type_count,block,
ROW_NUMBER() OVER(PARTITION BY block ORDER BY hour)
FROM data WHERE primary_type = 'BATTERY' AND block IN ('0000X W TERMINAL ST','063XX S DR MARTIN LUTHER KING JR DR','001XX N STATE ST')
GROUP BY hour,block ORDER BY hour;


--
--
BEGIN
DECLARE a,b,c STRING;
SET (a,b,c) = ('0000X W TERMINAL ST','063XX S DR MARTIN LUTHER KING JR DR','001XX N STATE ST');
-- TIME SERIES ANALYSIS
-- TOTAL CRIMES RECORDED BY BLOCK/S PER HOUR (OVERTIME)
WITH data AS (
  SELECT date,EXTRACT(HOUR FROM date) AS hour,block,primary_type FROM `bigquery-public-data.chicago_crime.crime`
  )
SELECT hour,COUNT(primary_type) AS crime_type_count,block,
ROW_NUMBER() OVER(PARTITION BY block ORDER BY hour)
FROM data WHERE primary_type = 'BATTERY' AND block IN (a,b,c)
GROUP BY hour,block ORDER BY hour;
END
--
--


-- TIME SERIES ANALYSIS
-- TOTAL CRIMES RECORDED BY BLOCK/S PER MONTH (OVERTIME)
WITH data AS (
  SELECT date,EXTRACT(ISOYEAR FROM date) AS year,EXTRACT(MONTH FROM date) AS month,EXTRACT(ISOWEEK FROM date) AS week,
  primary_type,block FROM `bigquery-public-data.chicago_crime.crime`
  WHERE primary_type = 'BATTERY' AND block IN ('0000X W TERMINAL ST','063XX S DR MARTIN LUTHER KING JR DR','001XX N STATE ST'))
SELECT month,block,COUNT(primary_type) AS total_crime_count,
CASE
   WHEN month = 1 THEN 'January'
   WHEN month = 2 THEN 'Febuary'
   WHEN month = 3 THEN 'March'
   WHEN month = 4 THEN 'April'
   WHEN month = 5 THEN 'May'
   WHEN month = 6 THEN 'June'
   WHEN month = 7 THEN 'July'
   WHEN month = 8 THEN 'August'
   WHEN month = 9 THEN 'September'
   WHEN month = 10 THEN 'October'
   WHEN month = 11 THEN 'November'
   WHEN month = 12 THEN 'December'
   ELSE '--'
   END AS month_name,ROW_NUMBER() OVER(PARTITION BY block ORDER BY month) AS ranking
 FROM data WHERE year = 2024 
 GROUP BY month,block ORDER BY month ASC;