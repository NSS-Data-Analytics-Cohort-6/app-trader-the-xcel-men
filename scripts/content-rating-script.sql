SELECT 
	content_rating,
	primary_genre,
	AVG(rating) OVER() as tot_avg_rating,
	AVG(AVG(rating)) OVER(PARTITION BY content_rating ORDER BY rating DESC) AS avg_rating_cont_rating,
	AVG(AVG(rating)) OVER(PARTITION BY primary_genre ORDER BY rating DESC) AS avg_rating_genre_rating,
	COUNT(*) AS app_count
	FROM app_store_apps
	GROUP BY GROUPING SETS ((content_rating),(primary_genre), (rating))
	
/*SELECT 
	content_rating,
	primary_genre,
	AVG(rating) OVER() as tot_avg_rating,
	AVG(AVG(rating)) OVER(PARTITION BY content_rating ORDER BY rating DESC) AS avg_rating_cont_rating,
	AVG(AVG(rating)) OVER(PARTITION BY primary_genre ORDER BY rating DESC) AS avg_rating_genre_rating,
	COUNT(*) AS app_count
	FROM app_store_apps
	GROUP BY GROUPING SETS ((content_rating, primary_genre, rating),(content_rating), (primary_genre), (rating), ())*/