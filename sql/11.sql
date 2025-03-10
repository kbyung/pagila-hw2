/* * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature */
SELECT DISTINCT actor.first_name || ' ' || actor.last_name AS "Actor Name"  
FROM actor
WHERE EXISTS (
    SELECT
    1
    FROM
    film_actor 
    INNER JOIN film USING (film_id)
    WHERE film_actor.actor_id = actor.actor_id
    AND 'Behind the Scenes' = ANY(film.special_features)

)
ORDER BY "Actor Name" ASC;
