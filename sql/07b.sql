/* * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
SELECT DISTINCT f.title
FROM film f
INNER JOIN inventory i USING (film_id)
LEFT JOIN rental r USING (inventory_id)
LEFT JOIN customer c USING (customer_id)
LEFT JOIN address a USING (address_id)
LEFT JOIN city ci USING (city_id)
LEFT JOIN country co ON ci.country_id = co.country_id
GROUP BY f.title
HAVING SUM(CASE WHEN co.country = 'United States' THEN 1 ELSE 0 END) = 0
ORDER BY f.title ASC;

