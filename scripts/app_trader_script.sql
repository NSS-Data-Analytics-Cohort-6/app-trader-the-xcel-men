-- column name scratch pad
-- matching columns:
-- a.name, p.name
-- a.price, p.price
-- a.rating, p.rating
-- a.review_count, p.review_count
-- a.content_rating, p.content_rating

-- pseudo matches
-- a.primary_genre, p.genres
-- a.size_bytes, p.size

-- unmatched: 
-- a.currency  |  p.category, 
-- p.install_count, p.type

-- app_store_apps full data for reference
select *
from app_store_apps;

-- play_store_apps full data for reference
select *
from play_store_apps;

--group by test
SELECT *
FROM app_store_apps
GROUP BY content_rating

--https://www.youtube.com/watch?v=gRwgDEm8kKs
--link to data type change how-to ^
ALTER TABLE app_store_apps
ALTER COLUMN review_count SET DATA TYPE numeric;
--that didn't work I'm so frustrated

--attempting CAST(value AS datatype)
SELECT name, CAST(review_count AS decimal)
FROM app_store_apps;
--that worked, I guess I'll just do that every time

--starting to mess around
SELECT a.name, a.price AS a_price, p.price AS p_price, a.rating AS a_rating, p.rating AS p_rating, (a.rating - p.rating) AS rating_difference
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
ORDER BY rating_difference ASC;

--Rob's code... not sure why names are duplicating since it says COUNT DISTINCT
SELECT
	DISTINCT a.name,
	a.price,
	ROUND((a.rating + p.rating)/2,1) AS combined_rating,
	(CAST(a.review_count as int) + p.review_count)/2 AS combined_review_count
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE ROUND((a.rating + p.rating)/2,2) > 4.5
ORDER BY (CAST(a.review_count as int) + p.review_count)/2 DESC

--Megan's code... order by install_count didn't really work because install_count is a text data type AND it's a range (ex, 500,000+ not just 500,000)
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

--my own experimentation
SELECT DISTINCT a.name, 
