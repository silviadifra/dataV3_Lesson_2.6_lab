
USE sakila;

-- 1 

SELECT last_name, COUNT(last_name)
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;
-- 2

SELECT last_name, COUNT(last_name)
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;
-- 3
SELECT staff_id, COUNT(staff_id)
FROM sakila.rental
GROUP BY staff_id;

-- 4
select * from sakila.film;

SELECT release_year, COUNT(release_year)
FROM sakila.film
GROUP BY release_year;

-- 5
SELECT rating, COUNT(rating)
FROM sakila.film
GROUP BY rating;

-- 6 What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
-- aggregate by several columns
SELECT rating, round(avg(length),2) AS mean_duration
FROM sakila.film
GROUP BY rating;
-- 7 Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, round(avg(length),2) AS mean_duration
FROM sakila.film
GROUP BY rating
having mean_duration > 120;

-- 8 Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

-- ????
SELECT *, length, title,  rank() OVER (PARTITION BY length) as 'rank'
FROM sakila.film
WHERE (length IS NOT NULL) AND (length <> '  ')
GROUP BY length, title;
