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
/*SELECT ROUND((FLOOR(YourNumber*2.0)/2.0), 1)*/
/*CAST(REPLACE(REPLACE(install_count,'+',''),',','')as float) as num_install*/

============================================================================================
--Exploring the data with these codes
=============================================================================================
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

========================================================================================
--Code From Teammates
=======================================================================================

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

=======================================================================================

========================================================================================
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
WHERE p.rating >= 4.5 AND a.rating > 4.5 
AND p.rating IS NOT NULL AND a.rating IS NOT NULL AND p.price IS NOT NULL AND a.price IS NOT NULL AND install_count IS NOT NULL
ORDER BY install_count DESC
-- 8 apps where selected from this query
-- This query contains most of the top apps we need.

=======================================================================================
Main Querey 
=======================================================================================
SELECT
	name AS app
	AVG(SUM(p.price + a.price)) AS avg_price
	SUM((avg_price) + 60000) - 12000 AS net_profit_yr
	AVG(SUM(p.rating + a.rating)) AS avg_rating
    years_of_longevity (Once calculation has been completed)
	years_of_longevity * net_profit_yr AS longterm_profit
=======================================================================================
--Subquerey & Case Statement
=======================================================================================
SELECT
	DISTINCT p.name AS app_name,
    TO_NUMBER(p.price, 'L99.99') AS play_price,
	a.price AS app_price,
    p.rating AS play_rating,
	a.rating AS app_rating,
		CASE WHEN p.price BETWEEN 0 AND 1 THEN 10000
		WHEN p.price > 1 THEN 'App Trader PS Purchase Price'
		WHEN a.price BETWEEN 0 AND 1 THEN 10000
		WHEN a.price > 1 THEN 'App Trader AS Purchase Price'
		ELSE 'Other' END AS non_app_trader_purchase
	FROM play_store_apps AS p
	JOIN app_store_apps AS a
	ON p.name = a.name
	WHERE p.rating >= 4.0 AND a.rating > 4.0 
	AND p.rating IS NOT NULL AND a.rating IS NOT NULL AND p.price IS NOT NULL AND a.price IS NOT NULL
	ORDER BY net_profit_yr DESC
	LIMIT 25
===============================================================================================

(CASE
			WHEN ROUND((FLOOR((p.rating + a.rating)*2.0)/2.0),1) BETWEEN 0 AND .2 THEN 1
	 		WHEN ROUND((FLOOR((p.rating + a.rating)*2.0)/2.0),1) BETWEEN .3 AND .7 THEN 2 
	 		WHEN ROUND((FLOOR((p.rating + a.rating)*2.0)/2.0),1) BETWEEN .8 AND 1.2 THEN 3
	 		WHEN ROUND((FLOOR((p.rating + a.rating)*2.0)/2.0),1) BETWEEN 1.3 AND 1.7 THEN 4
	 		WHEN ROUND((FLOOR((p.rating + a.rating)*2.0)/2.0),1) BETWEEN 1.8 AND 2.2 THEN 5
	 		WHEN ROUND((FLOOR((p.rating + a.rating)*2.0)/2.0),1) BETWEEN 2.3 AND 2.7 THEN 6
	 		WHEN ROUND((FLOOR((p.rating + a.rating)*2.0)/2.0),1) BETWEEN 2.8 AND 3.2 THEN 7
	 		WHEN ROUND((FLOOR((p.rating + a.rating)*2.0)/2.0),1) BETWEEN 3.3 AND 3.7 THEN 8
	 		WHEN ROUND((FLOOR((p.rating + a.rating)*2.0)/2.0),1) BETWEEN 3.8 AND 4.2 THEN 9
	 		WHEN ROUND((FLOOR((p.rating + a.rating)*2.0)/2.0),1) BETWEEN 4.3 AND 4.7 THEN 10
	 		ELSE 11 END) AS years_of_longevity,
			
			
--5000 * 12 (months) =  $60,000 in advertisment earnings per year
--1000 * 12 (months) =  $12,000  in marketing cost per year (If app is in both app and play store)
--(total purchase price (ps & app store)+ 60000) -12000 = yearly net profit

/*Work on finding way to add this to querey:
p.price * 10000 AS app_trader_ps_purchase,
a.price * 10000 AS app_trader_as_purchase,
Will need to CAST price as numeric or integer in order to calculate*/			
			
			
===============================================================================================
--Rob's Code
==============================================================================================

SELECT
	main.name AS app,
	main.avg_price,
	main.longevity_in_years * main.profit AS total_profit,
	main.profit as yearly_profit,
	main.avg_rating,
	main.longevity_in_years,
	main.content_rating
FROM
--========================================================================================================================================================
 -- Below this starts the subquery labeled main which includes an inner join of each table
 -- It should be noted the alias I used for the play_apps_store in the inner join is 's' instead 'p' this was an error I never corrected.
--========================================================================================================================================================
	(SELECT 
		DISTINCT a.name,
		(a.price + CAST(REPLACE(s.price,'$','') AS float)/2) as avg_price, 
		ROUND((a.rating + s.avg_rating)/2,2) AS avg_rating,
		a.content_rating,
--=======================================================================================================================================================
 -- The case statement below handles getting the longevity_in_years for each app.  I could not figure out how to round to the nearest .5.
 -- This was my work around
--=======================================================================================================================================================
		(CASE
			WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 0 AND ROUND((a.rating + s.avg_rating)/2,1) <= .2 THEN 1
	 												-- ^ Rating Nearest 0
	 		WHEN ROUND((a.rating + s.avg_rating)/2,1) >= .3 AND ROUND((a.rating + s.avg_rating)/2,1) <= .7 THEN 2 
	 												-- ^ Rating Nearest 0.5
	 		WHEN ROUND((a.rating + s.avg_rating)/2,1) >= .8 AND ROUND((a.rating + s.avg_rating)/2,1) <= 1.2 THEN 3
	 												-- ^ Rating Nearest 1
	 		WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 1.3 AND ROUND((a.rating + s.avg_rating)/2,1) <= 1.7 THEN 4
	 												-- ^ Rating Nearest 1.5
	 		WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 1.8 AND ROUND((a.rating + s.avg_rating)/2,1) <= 2.2 THEN 5
	 												-- ^ Rating Nearest 2
	 		WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 2.3 AND ROUND((a.rating + s.avg_rating)/2,1) <= 2.7 THEN 6
	 												-- ^ Rating Nearest 2.5
	 		WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 2.8 AND ROUND((a.rating + s.avg_rating)/2,1) <= 3.2 THEN 7
	 												-- ^ Rating Nearest 3
	 		WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 3.3 AND ROUND((a.rating + s.avg_rating)/2,1) <= 3.7 THEN 8
	 												-- ^ Rating Nearest 3.5
	 		WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 3.8 AND ROUND((a.rating + s.avg_rating)/2,1) <= 4.2 THEN 9
	 												-- ^ Rating Nearest 4
	 		WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 4.3 AND ROUND((a.rating + s.avg_rating)/2,1) <= 4.7 THEN 10
	 												-- ^ Rating Nearest 4.5
	 		ELSE 11 END) AS longevity_in_years,
	 												-- ^ Rating Nearest 5
--========================================================================================================================================================
 -- Below is the case statement that handles the yearly profit for each app based on the metrics from the assumptions.
 -- (5,000 X 12mo. = 60k - $12,000 advertising = 48k - 10k cost of app = 38k) for app price >=$0 and <=$1
 -- (5,000 X 12mo. = 60k - $12,000 advertising = 48k - cost of app) for any app > $1
--========================================================================================================================================================
		(CASE
			WHEN (a.price + CAST(REPLACE(s.price,'$','') AS float)/2) = 0 THEN 38000 
	 		WHEN (a.price + CAST(REPLACE(s.price,'$','') AS float)/2) > 0 AND (a.price + CAST(REPLACE(s.price,'$','') AS float)/2) <= 1 THEN 38000
			ELSE (48000 - ((a.price + CAST(REPLACE(s.price,'$','') AS float)/2) * 10000)) END) as profit
--========================================================================================================================================================
	FROM app_store_apps AS a -- here is the alias for the app_store app used to inner join the tables together
--========================================================================================================================================================
 -- The inner join below is what gets rid of the duplicates when you originally inner join the tables together. I believe it is because you have to aggregate some value (the review_count_tot) in the table. I think this works because of the group statement so any duplicate names get summed together to output the aggregate values (review_count_tot) wher the query is ran.
--========================================================================================================================================================
	INNER JOIN 
		(SELECT name, 
	 	price, 
	 	SUM(review_count) AS review_count_tot, 
	 	ROUND(AVG(rating),1) as avg_rating
	FROM play_store_apps
	GROUP BY name, price) AS s -- this is the alias used for the inner join of this table to the app_store_apps table               
	ON a.name = s.name) AS main          
--========================================================================================================================================================
 --the ') AS main' after the on clause is what closed the main subquery which allow it to be referenced by the outer query that is at the top of this script.
--=======================================================================================================================================================
ORDER BY total_profit DESC, avg_rating DESC

=================================================================================================================================
--Code After Being Filtered By Megan
===================================================================================================================================

SELECT
	main.name AS app,
	main.avg_price,
	main.longevity_in_years * main.profit AS total_profit,
	main.profit as yearly_profit,
	main.avg_rating,
	main.longevity_in_years,
	main.content_rating,
	main.num_install
FROM
	(SELECT 
		DISTINCT a.name,
	 	s.num_install,
		(a.price + CAST(REPLACE(s.price,'$','') AS float)/2) as avg_price, 
		ROUND((a.rating + s.avg_rating)/2,2) AS avg_rating,
		a.content_rating,
		(CASE	
-- 			MODIFIED WHAT ROB WROTE TO REDUCE UNNECESSARY WORK
	 		WHEN ROUND((a.rating + s.avg_rating)/2,1) between 0 AND 4.2 THEN '0'
	 												-- ^ Rating Nearest 4
	 		WHEN ROUND((a.rating + s.avg_rating)/2,1) between 4.3 AND 4.7 THEN 10
	 												-- ^ Rating Nearest 4.5
	 		ELSE 11 END) AS longevity_in_years,
	 												-- ^ Rating Nearest 5
		(CASE
			WHEN (a.price + CAST(REPLACE(s.price,'$','') AS float)/2) between 0 and 1 THEN 38000
			ELSE (48000 - ((a.price + CAST(REPLACE(s.price,'$','') AS float)/2) * 10000)) END) as profit
	FROM app_store_apps AS a -- here is the alias for the app_store app used to inner join the tables together
	INNER JOIN 
		(SELECT name, 
	 			price, 
		 		CAST(REPLACE(REPLACE(install_count,'+',''),',','')as float) as num_install,
	 			SUM(review_count) AS review_count_tot, 
	 			ROUND(AVG(rating),1) as avg_rating
			FROM play_store_apps
			GROUP BY name, price, CAST(REPLACE(REPLACE(install_count,'+',''),',','')as float)) AS s  /*alias used for the inner join of this table to the app_store_apps table*/
			ON a.name = s.name) AS main          
WHERE LONGEVITY_IN_YEARS <> 0 AND AVG_RATING >4.5
GROUP BY num_install, name, avg_price, longevity_in_years, profit, avg_rating, content_rating
ORDER BY total_profit DESC, avg_rating DESC