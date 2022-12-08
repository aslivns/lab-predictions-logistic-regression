SELECT * FROM rental; -- inventory_id
SELECT * FROM inventory;
SELECT * FROM film;
SELECT * FROM film_category; -- category_id
SELECT * FROM category; -- name
SELECT * FROM language;

select count(*), rating from film GROUP BY rating;

SELECT COUNT(*) AS count, f.title,
CASE 
WHEN DATE(rental_date)
BETWEEN '2005-05-01' AND '2005-05-31'
THEN True
ELSE False
END AS day_type
FROM rental r
INNER JOIN inventory i USING (inventory_id)
INNER JOIN film f USING (film_id)
INNER JOIN film_category fc USING (film_id)
INNER JOIN category c USING (category_id)
-- WHERE CONVERT(rental_date,DATE) BETWEEN '2005-05-01' AND '2005-05-31'
GROUP BY f.title;

