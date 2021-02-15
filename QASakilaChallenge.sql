-- 1
SELECT CONCAT(first_name, " ", last_name) AS full_name FROM sakila.actor;

-- 2
SELECT last_name FROM sakila.actor WHERE first_name = "John";

-- 3
SELECT * FROM sakila.actor WHERE last_name = "Neeson";

-- 4
SELECT * FROM sakila.actor WHERE actor_id % 10 = 0;

-- 5
SELECT description FROM sakila.film WHERE film_id = 100;

-- 6
SELECT title FROM sakila.film WHERE rating = "R";

-- 7
SELECT title FROM sakila.film WHERE rating != "R";

-- 8
SELECT title FROM sakila.film ORDER BY length ASC limit 10;

-- 9
SELECT title FROM sakila.film WHERE length = (SELECT MAX(length) FROM sakila.film);

-- 10
SELECT title FROM sakila.film WHERE special_features LIKE "%Deleted Scenes%";

-- 11
SELECT last_name FROM (
SELECT last_name, COUNT(last_name) as count_of_last_name FROM sakila.actor GROUP BY last_name HAVING count_of_last_name = 1 ORDER BY last_name DESC
) AS last_name_not_repeated;

-- 12
SELECT last_name, COUNT(last_name) as count_of_last_name FROM sakila.actor GROUP BY last_name HAVING count_of_last_name > 1 ORDER BY count_of_last_name DESC;

-- 13
SELECT CONCAT(first_name, " ", last_name) AS actor_in_most_films FROM sakila.actor WHERE actor_id = (SELECT actor_id FROM (
SELECT actor_id, COUNT(film_id) AS number_of_films FROM sakila.film_actor GROUP BY actor_id ORDER BY number_of_films DESC LIMIT 1) AS actor_id_with_most_films);

-- 14

-- 15
SELECT AVG(length) AS average_run_time_of_films FROM sakila.film;

-- 16
SELECT name, AVG(length) AS average_length_of_category FROM
sakila.film_category t1
JOIN
sakila.category t2
ON 
t2.category_id = t1.category_id
JOIN
sakila.film t3
ON
t3.film_id = t1.film_id
GROUP BY t1.category_id;

-- 17
SELECT * FROM sakila.film WHERE description LIKE '%Robot%';

-- 18
SELECT COUNT(*) FROM sakila.film WHERE release_year = 2010;

-- 19
SELECT title FROM sakila.film
WHERE film_id IN (
SELECT film_id FROM sakila.film_category WHERE
category_id =
( SELECT category_id FROM sakila.category WHERE name = "horror"));

-- 20
SELECT CONCAT( first_name, " ", last_name) AS staff_id_2 FROM sakila.staff WHERE staff_id = 2;

-- 21
SELECT title FROM sakila.film WHERE film_id IN (
SELECT film_id FROM sakila.film_actor
WHERE actor_id = (
SELECT actor_id FROM sakila.actor WHERE first_name = "Fred" AND last_name = "Costner"
));

-- 22
SELECT COUNT( DISTINCT country) FROM sakila.country;

-- 23
SELECT DISTINCT(name) FROM sakila.language ORDER BY name DESC;

-- 24
SELECT CONCAT(first_name, " ", last_name) AS full_name FROM sakila.actor WHERE last_name LIKE "%son" ORDER BY first_name ASC;

-- 25
SELECT name FROM sakila.category WHERE category_id =
(SELECT Category_id FROM ((SELECT category_id, COUNT(film_id) AS number_of_films FROM sakila.film_category GROUP BY category_id ORDER BY number_of_films DESC LIMIT 1)) AS cat_with_most_films);

