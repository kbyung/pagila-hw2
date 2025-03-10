/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * NOTE:
 * This can be solved by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 * For this problem, you should use the NOT IN clause;
 * in problem 07b you will use the LEFT JOIN clause.
 *
 * NOTE:
 * This is the last problem that will require you to use a particular method to solve the query.
 * In future problems, you may choose whether to use the LEFT JOIN or NOT IN clause if they are more applicable.
 */
SELECT DISTINCT title
FROM film
INNER JOIN inventory USING (film_id)
WHERE title NOT IN (
    SELECT title 
    FROM film 
    INNER JOIN inventory USING (film_id)
    INNER JOIN rental USING (inventory_id)
    INNER JOIN customer USING (customer_id)
    INNER JOIN address USING (address_id)
    INNER JOIN city USING (city_id)
    INNER JOIN country USING (country_id)
    WHERE country = 'United States'
)
ORDER BY title ASC;

