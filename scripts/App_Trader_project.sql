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
	DISTINCT p.name AS app_name, 
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
LIMIT 15;
/*Gave top 15 apps with rating, price, and install count. Ordered by App PRICE*/

SELECT  
	DISTINCT p.name AS app_name, 
	p.rating AS play_rating, 
	a.rating AS app_rating,
	TO_NUMBER(p.price, 'L99.99') AS play_price,
	a.price AS app_price,
	install_count,
	a.primary_genre,
	p.genres
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
ON p.name = a.name
WHERE p.rating > 4.0 AND a.rating > 4.0
ORDER BY install_count DESC
LIMIT 15;

-- SELECT
-- 	p.name AS app_name,
-- 	p.primary_genre,
-- 	p.rating AS play_rating, 
-- 	a.rating AS app_rating,
-- FROM play_store_apps AS p
-- INNER JOIN app_store_apps AS a
-- ON p.name = a.name
-- WHERE p.rating > 4.0 AND a.rating > 4.0
-- ORDER BY play_rating DESC
-- LIMIT 15;

SELECT name,
genres,
install_count
FROM play_store_apps
where install_count = '5,000,000+'
group by name, genres, install_count
order by genres desc;

SELECT name,
genres,
install_count
FROM play_store_apps
where install_count = '1,000,000,000+'
group by name, genres, install_count
order by genres desc;
/*only 20 apps over 1B and most are Google. Doubtful they would be able to purchase these. Subway Surfers game is possible*/

SELECT 
	DISTINCT install_count
FROM play_store_apps
ORDER BY install_count;
-- 0
-- 0+
-- 1,000,000,000+
-- 1,000,000+
-- 1,000+
-- 1+
-- 10,000,000+
-- 10,000+
-- 10+
-- 100,000,000+
-- 100,000+
-- 100+
-- 5,000,000+
-- 5,000+
-- 5+
-- 50,000,000+
-- 50,000+
-- 50+
-- 500,000,000+
-- 500,000+
-- 500+

-- SELECT
-- 	a.name,
-- 	a.price,
-- 	ROUND((a.rating + p.rating)/2,2) AS combined_rating,
-- 	(CAST(a.review_count as int) + p.review_count)/2 AS combined_review_count
-- FROM app_store_apps AS a
-- INNER JOIN play_store_apps AS p
-- ON a.name = p.name
-- WHERE ROUND((a.rating + p.rating)/2,2) >= 4.5
-- ORDER BY combined_review_count DESC;

/*ROBS CODE WITH DUPLICATES. WHY?
SELECT
	p.name,
	(a.price + CAST(REPLACE(p.price,'$','') AS float)/2) as avg_price,
	ROUND((a.rating + p.rating)/2,1) AS combined_rating,
	(CAST(a.review_count as int) + p.review_count)/2 AS combined_review_count,
	CAST(REPLACE(REPLACE(p.install_count,'+',''),',','') as float) AS install_count
FROM app_store_apps AS a
 INNER JOIN
 (SELECT 
	  DISTINCT name as name,
	  rating, 
	  review_count, 
	  install_count, 
	  price
 	FROM play_store_apps) AS p
ON a.name = p.name
WHERE ROUND((a.rating + p.rating)/2,2) >= 4.0
	AND CAST(REPLACE(REPLACE(p.install_count,'+',''),',','') as float) >= 100000000
ORDER BY combined_review_count DESC, install_count DESC*/

