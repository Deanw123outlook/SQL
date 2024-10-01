-- VERSION 
-- Protocol version specified in block header
with dataset AS (
  SELECT version,COUNT(version) AS version_count,MIN(timestamp) AS first_date FROM
  `bigquery-public-data.crypto_bitcoin.blocks`
  GROUP BY version ORDER BY version_count DESC
)
SELECT version,version_count,EXTRACT(ISOYEAR FROM first_date) AS year,EXTRACT(MONTH FROM first_date) AS month FROM dataset
ORDER BY year,month ASC;


-- VERSION + SIZE
-- Protocol version specified in block header
-- The size of block data in bytes
with dataset AS (
  SELECT version,COUNT(version) AS version_count,AVG(size) as average_size,MIN(timestamp) AS first_date FROM
  `bigquery-public-data.crypto_bitcoin.blocks`
  GROUP BY version ORDER BY version_count,average_size DESC
)
SELECT version,version_count,ROUND(average_size,2) AS avg_size_bytes,EXTRACT(ISOYEAR FROM first_date) AS year,EXTRACT(MONTH FROM first_date) AS month FROM dataset
ORDER BY year,month ASC;




