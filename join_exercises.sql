##JOIN EXERCISES##

#Join Examples Database 
USE join_example_db;

#2
#JOIN/INNER JOIN#
SELECT *
FROM users
JOIN roles ON users.role_id = roles.id;

#LEFT JOIN#

SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

#RIGHT JOIN#

SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

#3 
#Aggregate functions with a join query#

SELECT roles.name, COUNT(users.role_id)
FROM users
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY roles.name;

#this query results in a table showing the name of each of the roles from the roles table in the first column and the number of users with each role in the second column. 


#Employees Database#
#1
USE employees;

#2
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ' , e.last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_emp AS de
ON de.emp_no = e.emp_no
JOIN departments AS d 
ON d.dept_no = de.dept_no
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01'
ORDER BY d.dept_name;

#This query returns a table showing the department names in the first column and the name of the department manager in the second column by using associative table joins. 

#3 
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ' , e.last_name) AS 'Manager Name'
FROM employees AS e
JOIN dept_emp AS de
ON de.emp_no = e.emp_no
JOIN departments AS d 
ON d.dept_no = de.dept_no
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F'
ORDER BY d.dept_name;

#This query builds on the previous query to return the department name and the manager name for departments that are managed by women. This was done by adding the 'e.gender = F' to the WHERE statement. 

#4
SELECT t.title, COUNT(t.title) AS 'Count'
FROM titles AS t
JOIN dept_emp AS de 
ON de.emp_no = t.emp_no
WHERE de.dept_no = 'd009' AND t.to_date = '9999-01-01' AND de.to_date = '9999-01-01'
GROUP BY t.title
ORDER BY t.title;

#This query returned a table with the count of employees by title from the customer service department (d009). #NOTES emp_no connected the titles table and the dept_emp table and dept_no connected the departments and the dept_emp table. To get the correct numbers to match the exercise in the book I had to make sure the to_date was 9999-01-01 in both tables in the WHERE statemtent.

#5
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ' , e.last_name) AS 'Name', s.salary AS 'Salary'
FROM employees AS e
JOIN dept_emp AS de
ON de.emp_no = e.emp_no
JOIN departments AS d 
ON d.dept_no = de.dept_no
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
JOIN salaries AS s
ON s.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY d.dept_name;

#this query added a 'salary' column to the table results from exercise two in this seciton. to do this I needed to add a salary column to the SELECT statement join the salaries table to the other tables and add a salary to_date to the where statement to make sure it was returning current salaries. 

#6
SELECT de.dept_no, d.dept_name, COUNT(de.emp_no) AS 'num_employees'
FROM departments AS d
JOIN dept_emp AS de 
ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_no
ORDER BY d.dept_no;

#this query returns a table with the department number, the department name and the number of employees that work in each department. this one was challenging at first to get the SELECT and the ORDER/GROUP BY  statements to line up bu the error message did help point it out. 

#7
SELECT d.dept_name, AVG(s.salary) AS average_salary
FROM salaries AS s
JOIN dept_emp AS de
ON de.emp_no = s.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01' 
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

#this query returns a table with only the department name and average salary for the department with the highest average salary. NOTE: you can not use ORDER BY with a function or with a title in quotes so the alias for "AVG(s.salary)" had to be "average_salary" so that it didnt need quotes.

#8
SELECT e.first_name, e.last_name
FROM employees AS e
JOIN dept_emp AS de
ON de.emp_no = e.emp_no 
JOIN salaries AS s 
ON s.emp_no = de.emp_no
WHERE de.dept_no = 'd001' AND s.to_date = '9999-01-01' 
ORDER BY s.salary DESC
LIMIT 1; 

#this query returned a table with only the employee with the highest salary in the marketing department (d001). even though the actual salary was not included in the results table i sorted by the salary in decendng order so that the highest result would be on top and I could limit one. 

#9
SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON de.emp_no = e.emp_no
JOIN departments AS d 
ON d.dept_no = de.dept_no
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
JOIN salaries AS s
ON s.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY s.salary DESC
LIMIT 1;

#this query builds on the one form exercise #5 by removing the CONCAT(), ordering by s.salary DESC and limiting to 1 to return only the highest paid manager.

#10
SELECT d.dept_name, ROUND(AVG(s.salary), 0) AS average_salary
FROM salaries AS s
JOIN dept_emp AS de
ON de.emp_no = s.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no 
GROUP BY d.dept_name
ORDER BY average_salary DESC;

#this query built on the one from exercise 7 starting by removing the limit 1 and the WHERE statement from #7 so that it included "All salary information". Adding the ROUND() to t the AVG(s.salary) returns the rounded results that the exercise was asking for. 

#BONUS#11
SELECT CONCAT(e.first_name, ' ' , e.last_name) AS "Employee Name", d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ' , e.last_name) AS "Manager Name"
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
ORDER BY d.dept_name, e.emp_no;

#### still needs work for the "manager name" column. this returns a table with the correct number of rows and the correct first entry based on the exercise example but I dont know how to add the managers name to the last column, it currently just repeats the employees name. 

#BONUS#12
SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON de.emp_no = e.emp_no 
JOIN salaries AS s 
ON s.emp_no = de.emp_no
JOIN departments AS d 
ON d.dept_no = de.dept_no
WHERE s.to_date = '9999-01-01' 
ORDER BY d.dept_name, s.salary DESC;

#### still needs work, this will return firstname, lastname, salary, and deptname, sorted by dept name then salary decending but I dont know how to pull just the top from each department.

