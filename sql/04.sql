/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */
    SELECT title
    FROM film 
    INNER JOIN inventory USING (film_id)
    INNER JOIN rental USING (inventory_id)
    INNER JOIN customer USING (customer_id)
    WHERE customer.customer_id=1
    GROUP BY title
    HAVING COUNT(*) > 1;

