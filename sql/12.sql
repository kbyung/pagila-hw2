/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */
SELECT f1.title
FROM (
    SELECT title
    FROM film
    WHERE 'Behind the Scenes' = ANY(special_features)
) AS f1
INNER JOIN (
    SELECT title
    FROM film
    WHERE 'Trailers' = ANY(special_features)
) AS f2
ON f1.title = f2.title
ORDER BY f1.title ASC;
