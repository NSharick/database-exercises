USE employees;

SELECT CONCAT(first_name, ' ' ,last_name) AS full_name FROM employees WHERE last_name Like 'E%E';

#NOTES - I had the order of the code off at first because I tried to put the CONCAT() and the AS at the end of the statement. They need to be in the first half of the statement because they are operating on the columns not the rows (SELECT = columns) (WHERE = rows).

SELECT UPPER(CONCAT(first_name, ' ' ,last_name)) AS full_name FROM employees WHERE last_name Like 'E%E';

#NOTES - UPPER needed to be outside the () for this code to run, it would not run with CONCAT on the outside and UPPER inside the first set.

SELECT DATEDIFF(NOW(), hire_date) FROM employees WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%-12-25';

SELECT CONCAT(first_name, ' ' ,last_name) AS full_name, DATEDIFF(NOW(), hire_date) AS days_at_co FROM employees WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%-12-25';

#This function resulted in a table with the number of days each employee has worked at the company.
#The second set of code combined the first exercise with this one so that sql would output a table with column headers and the employee's full name linked to the number of days at the company.

SELECT MIN(salary) FROM salaries;

# The smallest salary was 38623.

SELECT MAX(salary) FROM salaries;

#The largest salary was 158220.

SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS 'username', first_name, last_name, birth_date FROM employees;

#NOTES - LOWER / UPPER go first (outside the ()). Inside the CONCAT() the substrings go in order they need to be displayed seperated by commas, including the underscore inside single quotes. The code/names for each column of data to be in the output table need to be listed in order you want them to be displayed in the resulting table and seperated by commas. Substrings are written as SUBSTR(column with the data to be modified, start index, lenth of string).  