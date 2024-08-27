/***CTE-STATION_NAMES_associated-LONGITUDE_LATITUDE***/
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