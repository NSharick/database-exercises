##SUBQUERIES EXERCISES##

#1
SELECT e.emp_no, e.hire_date
FROM employees AS e
JOIN dept_emp AS de 
ON e.emp_no = de.emp_no
WHERE hire_date = 
(SELECT hire_date FROM employees WHERE emp_no = 101010) AND de.to_date = '9999-01-01';

#this query returned 55 current employees that were hired on the same day as employee number 101010.

#2
SELECT t.title 
FROM employees AS e
JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE e.first_name = 'Aamod' AND t.to_date = '9999-01-01'
GROUP BY t.title
ORDER BY t.title;

SELECT DISTINCT title
FROM titles
WHERE emp_no IN (SELECT emp_no FROM employees JOIN dept_emp USING(emp_no) WHERE first_name = 'aamod' AND to_date > NOW()); 
#first set with only JOIN and second set with subquery both seem to give the same answers.

#3
#used this to find all the employees who are currently working at the company. (240124) 
SELECT emp_no FROM dept_emp WHERE to_date > NOW();

#used this to get a cound of unique employee numbers as listed in the employees table. (300024)
SELECT COUNT(emp_no) FROM employees;

#combine the two previous to count only employee numbers that are not included in the group of current employees.
SELECT COUNT(emp_no) FROM employees
WHERE emp_no NOT IN (SELECT emp_no FROM dept_emp WHERE to_date > NOW());
#returns 59900 employees who no longer work at the company

#4
#used this to pull the employee numbers for the current department managers
SELECT emp_no FROM dept_manager WHERE to_date > NOW();

#this returns a table with employee number fist and last name, and gender for all the employees who were in the previous query results (current managers) 
SELECT emp_no, first_name, last_name, gender
FROM employees
WHERE emp_no IN (SELECT emp_no FROM dept_manager WHERE to_date > NOW());

#this returns results with only female employees from the previous list and answers the exercise question. 
SELECT emp_no, first_name, last_name, gender
FROM employees
WHERE emp_no IN (SELECT emp_no FROM dept_manager WHERE to_date > NOW()) AND gender = 'F';

#5
#returns all the current salaries
SELECT salary FROM salaries WHERE to_date > NOW();

#returns the historical average salary
SELECT AVG(salary) FROM salaries;

#puts the previous two queries together to return a list of all the salaries that are greater than the company historical average but only includes a column for the salary. 
SELECT salary FROM salaries WHERE to_date > NOW() AND salary > (SELECT AVG(salary) FROM salaries);

#joined the employees table and the salaries table to make the employee name availabe and then added the sub query to get the final results for the exercise.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee_name, s.salary
FROM employees AS e
JOIN salaries AS s 
ON s.emp_no = e.emp_no 
WHERE to_date > NOW() AND salary > (SELECT AVG(salary) FROM salaries);

#6
#used what I felt confident with to find the number of total salaries and ordered to see max at top. (tot - 240124 max - 158220)
SELECT salary 
FROM salaries 
WHERE to_date = '9999-01-01'
ORDER BY salary DESC;

#re-wrote it to output a single number or 'count' of total salaries (240124)
SELECT COUNT(salary) AS num_sal
FROM salaries
WHERE to_date > NOW();

#Used this to find the current max salary and verify it ws pulling the correct value (158220)
SELECT MAX(salary) FROM salaries WHERE to_date > NOW();

#used this to find the salary which is 1 standard deviation below the max salary (140910.04066365326)
SELECT MAX(salary) - STDDEV(salary) FROM salaries WHERE to_date > NOW();

#used this to find the count of current salaries that are within 1 standard deviation from the max salary (83)
SELECT COUNT(salary) AS sal_in_1
FROM salaries
WHERE salary >= (SELECT MAX(salary) - STDDEV(salary) FROM salaries WHERE to_date > NOW()); AND to_date > NOW();

#then I put it all together in the same way as the z-score example in the book by taking the code for the count of current salaries within 1 standard deviation of the max in () and dividing it by the code for the total count of current salaries in () and then multiplying that by 100.
SELECT
(SELECT COUNT(salary) AS sal_in_1
FROM salaries
WHERE salary >= (SELECT MAX(salary) - STDDEV(salary) FROM salaries WHERE to_date > NOW()) AND to_date > NOW())
/
(SELECT COUNT(salary) AS num_sal
FROM salaries
WHERE to_date > NOW()) 
* 100 AS percent_of_salaries;

#BONUS #1



#BONUS #2



#BONUS #3


