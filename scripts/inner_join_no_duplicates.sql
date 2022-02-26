SELECT 
	DISTINCT a.name,
	(a.price + CAST(REPLACE(s.price,'$','') AS float)/2) as avg_price,
	ROUND((a.rating + s.avg_rating)/2,1) AS avg_rating,
	(CASE
		WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 0 AND ROUND((a.rating + s.avg_rating)/2,1) <= .2 THEN 1
	 	WHEN ROUND((a.rating + s.avg_rating)/2,1) >= .3 AND ROUND((a.rating + s.avg_rating)/2,1) <= .7 THEN 2
	 	WHEN ROUND((a.rating + s.avg_rating)/2,1) >= .8 AND ROUND((a.rating + s.avg_rating)/2,1) <= 1.2 THEN 3
	 	WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 1.3 AND ROUND((a.rating + s.avg_rating)/2,1) <= 1.7 THEN 4
	 	WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 1.8 AND ROUND((a.rating + s.avg_rating)/2,1) <= 2.2 THEN 5
	 	WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 2.3 AND ROUND((a.rating + s.avg_rating)/2,1) <= 2.7 THEN 6
	 	WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 2.8 AND ROUND((a.rating + s.avg_rating)/2,1) <= 3.2 THEN 7
	 	WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 3.3 AND ROUND((a.rating + s.avg_rating)/2,1) <= 3.7 THEN 8
	 	WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 3.8 AND ROUND((a.rating + s.avg_rating)/2,1) <= 4.2 THEN 9
	 	WHEN ROUND((a.rating + s.avg_rating)/2,1) >= 4.3 AND ROUND((a.rating + s.avg_rating)/2,1) <= 4.7THEN 10
	 	ELSE 11 END) AS longevity_in_years,
	(CASE
		WHEN (a.price + CAST(REPLACE(s.price,'$','') AS float)/2) = 0 THEN 48000 - 10000
	 	WHEN (a.price + CAST(REPLACE(s.price,'$','') AS float)/2) > 0 AND (a.price + CAST(REPLACE(s.price,'$','') AS float)/2) <= 1 THEN 48000 - 10000
		ELSE (48000 - ((a.price + CAST(REPLACE(s.price,'$','') AS float)/2) * 10000)) END) as profit
FROM app_store_apps AS a
INNER JOIN
	(SELECT name, 
	 price, 
	 SUM(review_count) AS review_count_tot, 
	 ROUND(AVG(rating),1) as avg_rating
	FROM play_store_apps
	GROUP BY name, price) AS s
	ON a.name = s.name
ORDER BY profit DESC
