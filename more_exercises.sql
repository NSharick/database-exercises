#MORE EXERCISES#
#Extra MySQL Exercises#

#More drills with the Sakila database#

#1a
SELECT * FROM actor;
#1b
SELECT last_name FROM actor;
#1c
SELECT film_id, title, release_year FROM film;

#2a
SELECT DISTINCT last_name FROM actor;
#2b
SELECT DISTINCT postal_code FROM address;
#2c
SELECT DISTINCT rating FROM film;

#3a
SELECT title, description, rating, length FROM film WHERE length > 180;
#3b
SELECT payment_id, amount, payment_date FROM payment WHERE payment_date >= '2005-05-27';
#3c
SELECT payment_id, amount, payment_date FROM payment WHERE payment_date LIKE '2005-05-27%';
#3d
SELECT * FROM customer WHERE last_name LIKE 's%' AND first_name LIKE '%n';
#3e
SELECT * FROM customer WHERE active = 0 OR last_name LIKE 'M%';
#3f
SELECT * FROM category WHERE category_id > 4 AND name LIKE 'c%' OR name LIKE 's%' OR name LIKE 't%';
#3g
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update FROM staff WHERE password IS NOT NULL;
#3h
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update FROM staff WHERE password IS NULL;

#4a
SELECT phone, district FROM address WHERE district IN ('California', 'England', 'Tiapei', 'West Java');
#4b - use function - DATE(column name) to look at the date but not the added timestamp
SELECT payment_id, amount, payment_date FROM payment WHERE DATE(payment_date) IN ('2005-05-25', '2005-05-27', '2005-05-29');
#4c
SELECT * FROM film WHERE rating IN ('G', 'PG-13', 'NC-17');

#5a
SELECT * FROM payment WHERE payment_date BETWEEN '2005-05-25 00:00:00' AND '2005-05-26 23:59:59';
#5b
SELECT film_id, title, description FROM film WHERE LENGTH(description) BETWEEN 100 AND 120;

#6a
 



















USE employees;

SELECT emp_no, dept_no
FROM dept_manager
WHERE to_date = '9999-01-01';

#this code pulls the employee number for the current manager for each of the 9 departments.

SELECT emp_no, salary
FROM salaries
WHERE emp_no IN (110039, 110114, 110228, 110420, 110567, 110854, 111133, 111534, 111939) AND to_date = '9999-01-01';

#this code returns the average current salary for each of the 9 managers based on the employee numbers pulled from the dept_managers table with the first set of code.


#THIS FIRST EXERCISE STILL NEEDS WORK*********



USE world;

SELECT * FROM city
WHERE name = 'Santa Monica';

SELECT language, percentage
FROM countrylanguage
WHERE CountryCode = 'USA'
ORDER BY percentage;

#The first Command calls up the information for santa monica in the city table which includes the country the city is in, then the assoiciated country code can be used to pull the language percentages from the countrylanguage table using the second set of code.

SELECT region, COUNT(name) AS num_countries
FROM country
GROUP BY region
ORDER BY num_countries;

#returns how many countries are in each region based on the 'country' database.


#still more to go********
