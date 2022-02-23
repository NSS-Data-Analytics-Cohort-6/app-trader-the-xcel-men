SELECT 
	DISTINCT a.name,
	a.price,
	ROUND((a.rating + p.rating)/2,2) AS combined_rating,
	(CAST(a.review_count as float) + p.review_count) AS combined_rating
FROM app_store_apps AS a
LEFT JOIN play_store_apps AS p
ON a.name = p.name
WHERE ROUND((a.rating + p.rating)/2,2) > 4.5
ORDER BY (CAST(a.review_count as float) + p.review_count) DESC