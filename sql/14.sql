/*
 * Create a report that shows the total revenue per month and year.
 *
 * HINT:
 * This query is very similar to the previous problem,
 * but requires an additional JOIN.
 */
SELECT
    EXTRACT (YEAR FROM rental_date) "Year",
    EXTRACT (MONTH FROM rental_date) "Month",
    SUM (payment.amount) "Total Revenue"
FROM    
    rental
INNER JOIN payment USING (rental_id)
GROUP BY
    ROLLUP (
        EXTRACT (YEAR FROM rental_date),
        EXTRACT (MONTH FROM rental_date)
    )       
ORDER BY "Year" ASC, "Month" ASC;

