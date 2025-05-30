-- PRODUCT MARKET ANALYTICS
-- Top 25 Products based on category, department and average_price
SELECT category,department,retail_price 
FROM `bigquery-public-data.thelook_ecommerce.products` 
LIMIT 25;

-- Category Percentage (Product Cost v Retail Price)
SELECT category,
    ROUND(AVG(cost),2) AS product_cost,
    ROUND(AVG(retail_price),2) AS average_retail_price,
    ROUND(ROUND(AVG(cost),2)/ROUND(AVG(retail_price),2),3) * 100/1 AS cost_v_retailprice_percentage
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY category
ORDER BY ROUND(AVG(retail_price),2) DESC;
