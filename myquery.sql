SELECT f.film_id, r.inventory_id, r.rental_id, r.rental_date,  f.title, f.language_id, f.rental_duration, f.rental_rate, f.length, f.replacement_cost, f.rating, f.special_features, c.name,
SUM(CASE 
WHEN YEAR(rental_date) = 2005 AND MONTH(rental_date) = 5
THEN 1
ELSE 0
END) AS day_type
FROM rental r
INNER JOIN inventory i USING (inventory_id)
RIGHT JOIN film f USING (film_id)
INNER JOIN film_category fc USING (film_id)
INNER JOIN category c USING (category_id)
GROUP BY f.title;




/*SELECT * FROM rental; -- inventory_id
SELECT * FROM inventory;
SELECT * FROM film;
SELECT * FROM film_category; -- category_id
SELECT * FROM category; -- name
SELECT * FROM language;

select count(*), rating from film GROUP BY rating;

SELECT f.film_id, r.inventory_id, r.rental_id, r.rental_date,  f.title, f.language_id, f.rental_duration, f.rental_rate, f.length, f.replacement_cost, f.rating, f.special_features, c.name,
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
GROUP BY f.title;

-- WHERE CONVERT(rental_date,DATE) BETWEEN '2005-05-01' AND '2005-05-31' */



