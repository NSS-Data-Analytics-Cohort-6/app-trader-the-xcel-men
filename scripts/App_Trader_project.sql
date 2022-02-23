SELECT price
FROM play_store_apps
WHERE price <> '0';

SELECT *
from play_store_apps as p
inner join app_store_apps as a
on p.name = a.name;

SELECT name, rating, price
FROM play_store_apps;

SELECT name, rating, price
FROM app_store_apps;

SELECT  
	a.name AS app_name, 
	p.rating AS play_rating, 
	a.rating AS app_rating,
	TO_NUMBER(p.price, 'L99.99') AS play_price,
	a.price AS app_price,
	install_count
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
ON p.name = a.name
WHERE p.rating > 4.0 AND a.rating > 4.0
ORDER BY app_price DESC
LIMIT 15