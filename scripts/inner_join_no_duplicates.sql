SELECT 
	DISTINCT a.name,
	(a.price + CAST(REPLACE(s.price,'$','') AS float)/2) as avg_price,
	ROUND((a.rating + s.avg_rating)/2,1) AS avg_rating,
	(CAST(a.review_count as int) + s.review_count_tot)/2 AS combined_review_count
FROM app_store_apps as a
INNER JOIN
	(SELECT name, 
	 price, 
	 SUM(review_count) AS review_count_tot, 
	 ROUND(AVG(rating),1) as avg_rating
	FROM play_store_apps
	GROUP BY name, price) AS s
	ON a.name = s.name
WHERE ROUND((a.rating + s.avg_rating)/2,1) >= 4.5
ORDER BY combined_review_count DESC
LIMIT 15