#MORE EXERCISES#

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
