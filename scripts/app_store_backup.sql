SELECT *
FROM play_store_apps;
SELECT *
FROM app_store_apps;
SELECT price, currency
FROM app_store_apps
GROUP BY price, currency
ORDER BY AVG(price) DESC;
SELECT price, name
FROM play_store_apps
GROUP BY price 
