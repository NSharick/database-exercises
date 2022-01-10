USE employees;
 
SELECT DISTINCT title FROM titles;

#This query resulted in 7 unique job titles: senior engineer, staff, engineeer, senior staff, assistant engineer, techinque leader, manager. 

SELECT last_name 
FROM employees
WHERE last_name LIKE "e%e"
GROUP BY last_name;

#This query resulted in 5 unique last names starting and ending with "e": erde, eldridge, etalle, erie, and erbe. 

SELECT first_name, last_name 
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY first_name, last_name

#This query returned 846 unique combinations of first and last names of employees whose last name started and ended with an "e". 
#NOTE: adding [ORDER BY last_name] after the 'group by' statement helped organize the results into a more useful table, but it would depend on the question the data is being pulled for.

SELECT last_name 
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

#This query returned three unique last names that had a 'q' but did not have a 'qu': chleq, lindqvist, and qiwen.
#NOTE: remember that the GROUP BY and ORDER BY go after the where statement. 

SELECT last_name, COUNT(*) AS same_last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

#This query returned chleq - 189, lindqvist - 190, and qiwen - 168. 
#NOTE: Dont forget the ',' between the column (last_name) and the new column you are creating (COUNT(*) AS...) when adding a 'COUNT' command to the SELECT statement.

SELECT first_name, gender, COUNT(*) AS same_first_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;

#This query returned vidya/m - 151, irena/m - 144, irena/f 97, maya/f - 90, vidya/f - 81, and maya/m - 146. 
#NOTE: since we were looking for a count of occurences of the first name sorted by gender, we need to pull the first_name and gender columns as well as create the 'count' column in the select statement, then include both points of reference (first_name, gender) in the 'group by' statement.

SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS 'username', COUNT(*) AS occurrences FROM employees GROUP BY username;

#This query resulted in a table with a column for unique usernames and then a column for how many times each username occurred in the list. There were duplicates in the results as seen in numbers larger than '1' in the second column. The table resulted in 285872 rows with a unique username. 

SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS 'username', COUNT(*) AS occurrences FROM employees GROUP BY username HAVING occurrences > 1;

#Bonus: adding 'having occurrences > 1' gave me results of only unique usernames that occurred more than once (had a duplicate) and produced 13251 rows of usernames that had a duplicate. 

#More Practice Exercises for Aggregate Functions ---

SELECT emp_no, AVG(salary) FROM salaries
GROUP BY emp_no ORDER BY emp_no;

#Returned average salary by employee number sorted by employee number.

SELECT dept_no, COUNT(emp_no) AS emp_per_dept
FROM dept_emp
WHERE to_date = '9999-01-01'
GROUP BY dept_no;

#This query returned a table with 9 rows representing 1 for each department. I added the where statement to single out "current" department based on the observation that some to_dates were set at "9999-01-01" which I guessed meant they were still in that department. 

SELECT emp_no, COUNT(salary)
FROM salaries
GROUP BY emp_no;

#Returns how many different salaries each employee has had acroos their time at the company.

SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no;

#Returns the max salary for each employee sorted by employee number.

SELECT emp_no, MIN(salary)
FROM salaries
GROUP BY emp_no;

# Returns the min salary for each employee sorted by employee number. 

SELECT emp_no, STDDEV(salary)
FROM salaries
GROUP BY emp_no;

# Returns the standard deviation of salary per employee sorted by employee number.

SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no
HAVING MAX(salary) >150000;

#Returns the max salary for each employee who had a max salary above 150000.

SELECT emp_no, AVG(salary) 
FROM salaries
GROUP BY emp_no 
HAVING AVG(salary) BETWEEN 80000 and 90000;

#Returns the average salary for each employee who had an average salary between 80 and 90K.


