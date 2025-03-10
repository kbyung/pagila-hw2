/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */
SELECT
    title
FROM film f
WHERE rating = 'G'
AND EXISTS (
    SELECT 1
    FROM unnest(f.special_features) AS sf(special_feature)
    WHERE sf.special_feature = 'Trailers'
);
