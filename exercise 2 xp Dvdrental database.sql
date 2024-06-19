-- 1. Select all columns from the "customer" table
SELECT * FROM customer;

-- 2. Display names with alias "full_name"
SELECT first_name AS full_name, last_name
FROM customer;

-- 3. Get all unique create dates
SELECT DISTINCT create_date
FROM customer;

-- 4. Get all customer details ordered by descending first name
SELECT * FROM customer
ORDER BY first_name DESC;

-- 5. Get film details ordered by ascending rental rate
SELECT film_id, title, description, release_year, rental_rate
FROM film
ORDER BY rental_rate ASC;

-- 6. Get address and phone number for customers in Texas
SELECT a.address, a.phone_number
FROM customer c
INNER JOIN address a ON c.customer_id = a.customer_id
WHERE a.district = 'Texas';

-- 7. Retrieve movie details for film ID 15 or 150
SELECT * FROM film
WHERE film_id IN (15, 150);

-- 8. Check if your favorite movie exists (replace '<your_favorite_movie_title>' with actual title)
SELECT film_id, title, description, length, rental_rate
FROM film
WHERE title = '<your_favorite_movie_title>';

-- 9. Find movies starting with the first two letters of your favorite movie (for typos)
SELECT film_id, title, description, length, rental_rate
FROM film
WHERE title LIKE '<first_two_letters_of_favorite_movie>%';

-- 10. Find the 10 cheapest movies
SELECT * FROM film
ORDER BY rental_rate ASC
LIMIT 10;

-- 11. Find the next 10 cheapest movies
SELECT * FROM film
ORDER BY rental_rate ASC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- 12. Join customer and payment tables
SELECT c.first_name, c.last_name, p.amount, p.payment_date
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
ORDER BY p.customer_id ASC;

-- 13. Find movies not in inventory
SELECT f.film_id, f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.inventory_id IS NULL;

-- 14. Find which city is in which country
SELECT city, country
FROM address;

-- 15. Customer's payment details by staff who sold them DVDs
SELECT c.customer_id, c.first_name, c.last_name, p.amount, p.payment_date, s.staff_id
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
INNER JOIN rental r ON p.rental_id = r.rental_id
INNER JOIN staff s ON r.staff_id = s.staff_id
ORDER BY s.staff_id ASC;
