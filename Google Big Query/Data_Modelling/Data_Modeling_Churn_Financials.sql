--
--
-- DATA MODELING
-- CHURN & FINANCIAL METRICS (30 day subscription_date)
WITH user_data AS (
  SELECT
    -- DATE_TRUNC(DATE(subscriber_since_timestamp), MONTH) AS subscription_date -- start of the month
    DATE(subscriber_since_timestamp) AS subscription_date,
    subscriber_since_timestamp,
    subscriptions_cancelled
  FROM
    db_table_subscription_cancellations
  WHERE subscriber_since_timestamp BETWEEN '2024-01-01' AND '2025-12-31'
),
labeled_event AS (
  SELECT
    subscription_date,
    CASE
      WHEN subscriptions_cancelled IS NOT NULL
           AND DATE_DIFF(DATE(subscriptions_cancelled), DATE(subscriber_since_timestamp), DAY) <= 30
        THEN 1
      ELSE 0
    END AS churned_within_30_days,
    CASE
      WHEN subscriptions_cancelled IS NULL
           OR DATE_DIFF(DATE(subscriptions_cancelled), DATE(subscriber_since_timestamp), DAY) > 30
        THEN 1
      ELSE 0
    END AS retained_after_30_days
  FROM user_data
),
churn_stats AS (
  SELECT
    subscription_date,
    COUNT(*) AS total_subscribed,
    SUM(churned_within_30_days) AS churned_within_30_days,
    ROUND(SAFE_DIVIDE(SUM(churned_within_30_days), COUNT(*)) * 100, 2) AS churn_rate_30_day,
    SUM(retained_after_30_days) AS retained_after_30_days,
    ROUND(SAFE_DIVIDE(SUM(retained_after_30_days), COUNT(*)) * 100, 2) AS retention_rate_30_day
  FROM labeled_event
  GROUP BY subscription_date
),
churners_financials AS (
  SELECT
    DATE(subscriber_since_timestamp)  AS subscription_date,
    t1.uuid,
    t1.subscriber_since_timestamp,
    t1.mrr,
    t1.arr,
    t1.net_payments
  FROM 
    db_table_subscription_financials AS t1
  JOIN db_table_subscription_cancellations AS t2
    ON t1.subscription_external_id = t2.subscriptions_id
  WHERE t1.status = 'Cancelled'
),
financial_metrics AS (
  SELECT
    subscription_date,
    COUNT(uuid) AS churned_users,
    -- recuring revenue metrics
    -- ROUND(SUM(mrr),2) AS subscription_date_total_customer_projected_MRR, -- not invlusive in dataset
    -- ROUND(SUM(arr),2) AS subscription_date_total_customer_projected_ARR, -- not inclusive in dataset
    -- net
    ROUND(SUM(net_payments)/COUNT(uuid), 2) AS subscription_date_total_customer_ARPU,
    ROUND(SUM(net_payments), 2) AS subscription_date_total_customer_net_payments
  FROM churners_financials
  GROUP BY subscription_date
)
SELECT 
  cs.subscription_date,
  cs.total_subscribed,
  cs.churned_within_30_days,
  cs.churn_rate_30_day,
  cs.retained_after_30_days,
  cs.retention_rate_30_day,
  -- fm.subscription_date_total_customer_projected_MRR, -- not invlusive in dataset
  -- fm.subscription_date_total_customer_projected_ARR, -- not invlusive in dataset
  fm.subscription_date_total_customer_ARPU,
  fm.subscription_date_total_customer_net_payments
FROM churn_stats cs
LEFT JOIN financial_metrics fm
  ON cs.subscription_date = fm.subscription_date
ORDER BY cs.subscription_date;