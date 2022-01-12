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
SELECT e.first_name, t.title 
FROM employees AS e
JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE e.first_name = 'Aamod' AND t.to_date = '9999-01-01';

#This query only gives the current title for current employees names Aamod.....


#3


#4


#5



#6
##########
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
WHERE salary >= (SELECT MAX(salary) - STDDEV(salary) FROM salaries WHERE to_date > NOW()) AND to_date > NOW();

#then I put it all together in the same way as the z-score example in the book by taking the code for the count of current salaries within 1 standard deviation of the max in () and dividing it by the code for the total count of current salaries in () and then multiplying that by 100.
SELECT
(SELECT COUNT(salary) AS sal_in_1
FROM salaries
WHERE salary >= (SELECT MAX(salary) - STDDEV(salary) FROM salaries WHERE to_date > NOW()) AND to_date > NOW())
/
(SELECT COUNT(salary) AS num_sal
FROM salaries
WHERE to_date > NOW()) * 100 AS percent_of_salaries;

