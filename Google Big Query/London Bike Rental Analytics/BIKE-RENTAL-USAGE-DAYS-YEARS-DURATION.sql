/***BIKE-RENTAL-USAGE-DAYS-YEARS-DURATION***/
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