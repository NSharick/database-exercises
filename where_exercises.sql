USE employees;

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');

#This query resulted in 709 rows of data.

SELECT * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

#When I first ran this query I only put "or" in between the names and it only pulled rows with the first name. Then I added "first_name =" after each "or" and I got the same number of rows from the query. 

SELECT * FROM employees WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M';

# When I first ran the query I didnt include parentheses and the results still included rows with gender as "F". After adding them I got all results that were "M". It resulted in 441 rows. 

SELECT * FROM employees WHERE last_name LIKE 'E%';

#There were 7330 rows with last name starting with "E".

SELECT * FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

#This query resulted in 30723 rows with last names starting or ending with "E". 30723 - 7330 = 23393 names end with an "E but do not start with an "E".

SELECT * FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E';
SELECT * FROM employees WHERE last_name LIKE '%E';

#899 last names started anded with an "E". 24292 employees last names end with an "e" regardless of whether they start with an "E".

SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' ORDER BY hire_date;

#This query returned 135214 rows/employees that were hired in the 90s.

SELECT * FROM employees WHERE birth_date LIKE '%-12-25';

#There were 842 employees who were born on Christmas.

SELECT * FROM employees WHERE birth_date LIKE '%-12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31';

#There were 362 employees that were hired in the 90s and wer born on christmas.

SELECT * FROM employees WHERE last_name LIKE '%q%';

#There were 1873 employees with a "q" in their last name. 

SELECT * FROM employees WHERE last_name LIKE '%q%';
SELECT * FROM employees WHERE last_name LIKE '%qu%';

# "LIKE '%q%'" resulted in 1873 employees and "LIKE '%qu%'" resulted in 1326 employees, so 1873-1326 = 547 employees with a "q" but not a "qu".
