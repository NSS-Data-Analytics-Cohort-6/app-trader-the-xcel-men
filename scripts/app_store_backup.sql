/*SELECT *
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
SELECT p.name, p.price
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.rating > 4 AND p.rating > 4;

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
^Megans code


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

my code:
SELECT 
DISTINCT a.rating, p.name, p.price
FROM   app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE  a.rating IN (3.0, 3.5, 4.0, 4.5, 5.0)

robs code*/
 -- Below this is the outer query.  It references values from the much larger subquery (labeled 'main')
--=======================================================================================================================================================

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















