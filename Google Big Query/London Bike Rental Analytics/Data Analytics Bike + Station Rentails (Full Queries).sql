/***CTE--BIKE-RENTAL-USAGE-DAYS-YEARS-DURATION***/
WITH dataset AS 
(
  SELECT bike_id,COUNT(DISTINCT(rental_id)) AS rentals,
  MIN(start_date) AS first_date,
  MAX(end_date) AS last_date,
  DATETIME_DIFF(MAX(end_date), MIN(start_date), DAY) AS days,
  SUM(duration) AS rental_time_seconds,AVG(duration) AS rental_time_avg
  FROM `bigquery-public-data.london_bicycles.cycle_hire`
  GROUP BY bike_id ORDER BY days DESC
)
SELECT rentals,bike_id,first_date,EXTRACT(ISOYEAR FROM first_date) AS first_year,last_date,EXTRACT(ISOYEAR FROM last_date) AS last_year,days,rental_time_seconds
FROM dataset ORDER BY rental_time_seconds DESC;


/***CTE--START_STATION_NAME_highest_average_minutes_rental_asscoiation***/
WITH tabx AS (
  SELECT ROW_NUMBER() OVER(PARTITION BY bike_id) AS row_index,bike_id,
  start_date,end_date,start_station_name,end_station_name,duration,
  DATETIME_DIFF(end_date, start_date, MINUTE) AS minutes,
  DATETIME_DIFF(end_date, start_date, HOUR) AS hours,
  DATETIME_DIFF(end_date, start_date, DAY) AS days
  FROM `bigquery-public-data.london_bicycles.cycle_hire` 
  ORDER BY start_date)
SELECT start_station_name,AVG(hours) AS average_rental_hours FROM tabx
GROUP BY start_station_name
ORDER BY average_rental_hours DESC;


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


/***CTE--STATION_NAMES_associated-LONGITUDE_LATITUDE***/
WITH tab1 AS (
  SELECT t1.start_station_name,t2.name,t2.latitude,t2.longitude,t1.duration
  FROM `bigquery-public-data.london_bicycles.cycle_hire` AS t1
  FULL OUTER JOIN `bigquery-public-data.london_bicycles.cycle_stations` AS t2 ON t1.start_station_name = t2.name
  ), tab2 AS (
  SELECT t1.end_station_name,t1.end_date,t2.name,t2.latitude,t2.longitude,t1.duration
  FROM `bigquery-public-data.london_bicycles.cycle_hire` AS t1
  FULL OUTER JOIN `bigquery-public-data.london_bicycles.cycle_stations` AS t2 ON t1.start_station_name = t2.name
)
SELECT DISTINCT(name),latitude,longitude FROM tab1
UNION ALL
SELECT DISTINCT(name),latitude,longitude FROM tab2