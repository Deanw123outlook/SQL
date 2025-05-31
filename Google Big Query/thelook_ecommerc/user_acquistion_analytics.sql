-- MARKET ANALTICS 
-- (Time Series Analysis User Aquisition)

--
-- Time Series Analysis Yearly Aquisition
SELECT 
      EXTRACT(ISOYEAR FROM created_at) AS year,
      COUNT(*) user_aquisition
FROM  `bigquery-public-data.thelook_ecommerce.users`
GROUP BY EXTRACT(ISOYEAR FROM created_at)
ORDER BY EXTRACT(ISOYEAR FROM created_at);


--
-- Time Series Analysis Monthly Aquisition
SELECT 
      EXTRACT(MONTH FROM created_at) AS month,
      FORMAT_DATE('%b', created_at) AS month_syntax,
      COUNT(*) user_aquisition
FROM  `bigquery-public-data.thelook_ecommerce.users`
GROUP BY EXTRACT(MONTH FROM created_at),FORMAT_DATE('%b', created_at)
ORDER BY EXTRACT(MONTH FROM created_at);



--
-- Time Series Analysis Weekly Aquisition
SELECT 
      EXTRACT(DAYOFWEEK FROM t1.created_at) AS weekday,
      COUNT(t1.created_at) AS user_aquisition,
FROM  `bigquery-public-data.thelook_ecommerce.users` AS t1
GROUP BY EXTRACT(DAYOFWEEK FROM t1.created_at)
ORDER BY EXTRACT(DAYOFWEEK FROM t1.created_at);

-- Time Series Analysis Weekly Aquisition (ordered by Monday)
SELECT
    FORMAT_DATE('%A', t1.created_at) AS day,
    COUNT(t1.created_at) AS user_aquisition
FROM
    `bigquery-public-data`.thelook_ecommerce.users AS t1
GROUP BY
    day
ORDER BY
    CASE day
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END;


--
-- Time Series Analysis Daily Aquisition
SELECT 
      EXTRACT(DAY FROM t1.created_at) AS day,
      COUNT(t1.created_at) AS user_aquisition,
FROM  `bigquery-public-data.thelook_ecommerce.users` AS t1
GROUP BY EXTRACT(DAY FROM t1.created_at)
ORDER BY EXTRACT(DAY FROM t1.created_at);

-- Time Series Analysis (Daily Aquisition % Total Aquistion Events)
SELECT
    daily_aq.date,
    daily_aq.user_aquisition,
    ROUND((daily_aq.user_aquisition * 100.0 / total_aq.total_user_count),2) AS percentage_of_total
FROM
    ( -- Subquery 1: Calculate daily user acquisition
        SELECT
            EXTRACT(DAY FROM created_at) AS date,
            COUNT(created_at) AS user_aquisition
        FROM `bigquery-public-data`.thelook_ecommerce.users
        GROUP BY date
    ) AS daily_aq
INNER JOIN
    ( -- Subquery 2: Calculate total user acquisition
        SELECT
            COUNT(created_at) AS total_user_count
        FROM `bigquery-public-data`.thelook_ecommerce.users
    ) AS total_aq
ON 1=1 -- CROSS JOIN, making total_aq.total_user_count available to every row of daily_aq
ORDER BY daily_aq.date;







