/*SELECT *
FROM app_store_apps*/
/*SELECT *
FROM play_store_apps*/

--Check Code Below For Error
SELECT name, rating, install_count, type
FROM play_store_apps 
WHERE rating >= 4.0
GROUP BY name, genres
ORDER BY install_count DESC

SELECT name, install_count, type, rating
FROM play_store_apps
ORDER BY install_count DESC
