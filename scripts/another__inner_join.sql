SELECT DISTINCT u.name AS unique_name, u.avg_price, u.avg_rating, u.combined_review_count
	FROM 
	(SELECT DISTINCT p.name, 
	 (a.price + CAST(REPLACE(p.price,'$','') AS float)/2) as avg_price,
	 ROUND((a.rating + p.rating)/2,1) AS avg_rating,
	 (CAST(a.review_count as int) + p.review_count) AS combined_review_count
	FROM play_store_apps as p
	INNER JOIN app_store_apps as a
		ON p.name = a.name) AS u
	WHERE u.avg_rating >= 4.0 
	ORDER BY u.combined_review_count DESC

	
