/***CTE--JOURNEY_START_STATION-FIRST-YEAR-RENTALS-associations***/
WITH data_1 AS 
(
  SELECT start_station_name,COUNT(DISTINCT(rental_id)) AS rentals,
  MIN(start_date) AS first_date,
  MAX(end_date) AS last_date,
  DATETIME_DIFF(MAX(end_date), MIN(start_date), DAY) AS days,
  SUM(duration) AS rental_time_seconds,AVG(duration) AS rental_time_avg
  FROM `bigquery-public-data.london_bicycles.cycle_hire`
  GROUP BY start_station_name ORDER BY days DESC
),data_2 AS (
  SELECT start_station_name,rentals,first_date,EXTRACT(ISOYEAR FROM first_date) AS first_year,
  last_date,EXTRACT(ISOYEAR FROM last_date) AS last_year,days,rental_time_seconds
  FROM data_1 ORDER BY rental_time_seconds DESC)
SELECT first_year,start_station_name,rentals FROM data_2
ORDER BY first_year,rentals;


/***CTE--JOURNEY_END_STATION-FIRST-YEAR-RENTALS-associations***/
WITH data_3 AS 
(
  SELECT end_station_name,COUNT(DISTINCT(rental_id)) AS rentals,
  MIN(start_date) AS first_date,
  MAX(end_date) AS last_date,
  DATETIME_DIFF(MAX(end_date), MIN(start_date), DAY) AS days,
  SUM(duration) AS rental_time_seconds,AVG(duration) AS rental_time_avg
  FROM `bigquery-public-data.london_bicycles.cycle_hire`
  GROUP BY end_station_name ORDER BY days DESC
),data_4 AS (
  SELECT end_station_name,rentals,first_date,EXTRACT(ISOYEAR FROM first_date) AS first_year,
  last_date,EXTRACT(ISOYEAR FROM last_date) AS last_year,days,rental_time_seconds
  FROM data_3 ORDER BY rental_time_seconds DESC)
SELECT first_year,end_station_name,rentals FROM data_4
ORDER BY rentals ASC;