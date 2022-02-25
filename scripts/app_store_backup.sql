/*SELECT *
FROM app_store_apps*/
/*SELECT *
FROM play_store_apps*/
/*SELECT name,
genres,
install_count
FROM play_store_apps
where install_count = '1,000,000,000+'
group by name, genres, install_count
order by genres desc;*/
/*CAST(REPLACE(REPLACE(p.install_count,'+',''),',','') as float)*/

SELECT name,
genres,
install_count
FROM play_store_apps
where install_count = '1,000,000,000+'
group by name, genres, install_count
order by genres desc;

--Check Code Below For Error
SELECT name, rating, install_count, type
FROM play_store_apps 
WHERE rating >= 4.0
GROUP BY name genres
ORDER BY install_count DESC

SELECT name, install_count, type, rating
FROM play_store_apps
ORDER BY install_count DESC

SELECT name, review_count, rating, price
FROM app_store_apps
WHERE rating >= 4.0
ORDER BY rating DESC

SELECT name, review_count, rating, price
FROM app_store_apps
WHERE rating >= 4.0
ORDER BY price DESC

SELECT name, review_count, rating, price
FROM app_store_apps
WHERE rating >= 4.0
ORDER BY review_count DESC

--Megan Grim's code
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

--Rob Schulteis code
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

--The currency for all the apps in the app store is USD
SELECT DISTINCT currency
FROM app_store_apps
.
--primary_genre is the best way to classify which apps are games after adding the category column to Megan's code
SELECT
	DISTINCT p.name AS app_name,
	p.rating AS play_rating,
	a.rating AS app_rating,
	TO_NUMBER(p.price, 'L99.99') AS play_price,
	a.price AS app_price,
	install_count,
	p.category,
	a.primary_genre,
	p.genres
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
ON p.name = a.name
WHERE p.rating > 4.0 AND a.rating > 4.0
ORDER BY install_count DESC
LIMIT 15



SELECT
	DISTINCT p.name AS app_name,
	p.rating AS play_rating,
	a.rating AS app_rating,
	TO_NUMBER(p.price, 'L99.99') AS play_price,
	a.price AS app_price,
	install_count,
	a.primary_genre
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
ON p.name = a.name
WHERE p.rating > 4.5 AND a.rating > 4.5 AND primary_genre = 'Games'
ORDER BY install_count DESC
/*This code gives us 3 games: Cytus, Egg,Inc., and PewDiePie's Tuber Simulator*/

SELECT
	DISTINCT p.name AS app_name,
	p.rating AS play_rating,
	a.rating AS app_rating,
	TO_NUMBER(p.price, 'L99.99') AS play_price,
	a.price AS app_price,
	install_count,
	p.category,
	a.primary_genre
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
ON p.name = a.name
WHERE p.rating > 4.0 AND a.rating > 4.0 AND primary_genre = 'Social Networking' 
OR p.category = 'DATING'
ORDER BY install_count DESC
/* 7 apps are produced from this query. None of them are categorized as dating apps*/

SELECT
	DISTINCT p.name AS app_name,
	p.rating AS play_rating,
	a.rating AS app_rating,
	TO_NUMBER(p.price, 'L99.99') AS play_price,
	a.price AS app_price,
	install_count,
	p.category,
	a.primary_genre
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
ON p.name = a.name
WHERE p.rating > 4.0 AND a.rating > 4.0 AND primary_genre = 'Finance' 
OR p.category = 'FINANCE'
ORDER BY install_count DESC
/*6 apps are produced from this query.*/

SELECT
	DISTINCT p.name AS app_name,
	p.rating AS play_rating,
	a.rating AS app_rating,
	TO_NUMBER(p.price, 'L99.99') AS play_price,
	a.price AS app_price,
	install_count,
	p.category,
	a.primary_genre
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
ON p.name = a.name
WHERE p.rating > 4.0 AND a.rating > 4.0 AND primary_genre = 'Education' 
OR p.category = 'EDUCATION'
ORDER BY install_count DESC
/*11 apps are produced from this query.*/

SELECT
	DISTINCT p.name AS app_name,
	p.rating AS play_rating,
	a.rating AS app_rating,
	TO_NUMBER(p.price, 'L99.99') AS play_price,
	a.price AS app_price,
	install_count,
	p.category,
	a.primary_genre
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
ON p.name = a.name
WHERE p.rating > 4.0 AND a.rating > 4.0 AND primary_genre = 'Entertainment' 
OR p.category = 'ENTERTAINMENT'
ORDER BY install_count DESC
/*21 apps are produced from this query.*/

SELECT
	DISTINCT p.name AS app_name,
	p.rating AS play_rating,
	a.rating AS app_rating,
	TO_NUMBER(p.price, 'L99.99') AS play_price,
	a.price AS app_price,
	install_count,
	p.category,
	a.primary_genre
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
ON p.name = a.name
WHERE p.rating > 4.0 AND a.rating > 4.0 AND primary_genre = 'Sports' 
OR p.category = 'SPORTS'
ORDER BY install_count DESC
/* 17 apps are produced from this query.*/