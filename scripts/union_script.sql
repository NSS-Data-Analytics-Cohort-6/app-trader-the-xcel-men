
(SELECT name, CAST(price AS FLOAT), rating, CAST(review_count AS FLOAT)
FROM app_store_apps 
UNION
SELECT name, CAST(REPLACE(price, '$', '') AS float), rating, CAST(review_count AS FLOAT)
FROM play_store_apps) AS subquery

