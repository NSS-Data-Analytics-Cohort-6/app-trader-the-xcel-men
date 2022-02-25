SELECT 
	DISTINCT a.name,
	(a.price + CAST(REPLACE(p.price,'$','') AS float)/2) as avg_price,
	ROUND((a.rating + p.rating)/2,1) AS avg_rating,
	(CAST(a.review_count as int) + p.review_count)/2 AS combined_review_count,
	CAST(REPLACE(REPLACE(p.install_count,'+',''),',','') as float) AS install_count
FROM app_store_apps AS a
 INNER JOIN 
 (SELECT DISTINCT name,rating, review_count, install_count, price
 	FROM play_store_apps) AS p
ON a.name = p.name
WHERE ROUND((a.rating + p.rating)/2,2) >= 4.0 
	AND CAST(REPLACE(REPLACE(p.install_count,'+',''),',','') as float) >= 100000000
ORDER BY combined_review_count DESC, install_count DESC

