##CASE EXERCISES##

USE employees;

#1 
SELECT emp_no, dept_no, from_date, to_date, 
	CASE 
	WHEN to_date > NOW() THEN 1
	ELSE 0
	END as 'is_current_employee'
FROM dept_emp;

#returns a 1 or a zero based on whether the to_date is in the future or in the past.


#2
#with this h, and z last names returned a null
SELECT first_name, last_name, 
	CASE
	WHEN last_name BETWEEN 'a' AND 'h' THEN 'A-H'
	WHEN last_name BETWEEN 'i' AND 'q' THEN 'I-Q'
	WHEN last_name BETWEEN 'r' AND 'z' THEN 'R-Z'
	END AS 'alpha_group'
FROM employees;

#with this h and q were in the wrong category and z returned null
SELECT first_name, last_name, 
	CASE
	WHEN last_name < 'h' THEN 'A-H'
	WHEN last_name < 'q' THEN 'I-Q'
	WHEN last_name < 'z' THEN 'R-Z'
	END AS 'alpha_group'
FROM employees;

#this also put the h and q names in the wrong column and z as null
SELECT first_name, last_name, 
	CASE
	WHEN last_name <= 'h' THEN 'A-H'
	WHEN last_name <= 'q' THEN 'I-Q'
	WHEN last_name <= 'z' THEN 'R-Z'
	END AS 'alpha_group'
FROM employees
ORDER BY last_name DESC;

#I first tried going one letter past the range for the <= value but you cany go past z for the third one. I found that I can add a second character to be evaluated in the grouping and got the correct results.
SELECT first_name, last_name, 
	CASE
	WHEN last_name <= 'hz' THEN 'A-H'
	WHEN last_name <= 'qz' THEN 'I-Q'
	WHEN last_name <= 'zz' THEN 'R-Z'
	END AS 'alpha_group'
FROM employees
ORDER BY last_name;

##BETTER OPTION###
SELECT first_name, last_name, 
	CASE
	WHEN LEFT(last_name, 1) <= 'h' THEN 'A-H'
	WHEN LEFT(last_name, 1) <= 'q' THEN 'I-Q'
	WHEN LEFT(last_name, 1) <= 'z' THEN 'R-Z'
	END AS 'alpha_group'
FROM employees
ORDER BY last_name;


#3
# this returns the birthdate with the oldest on top (1952-02-01)
SELECT birth_date FROM employees ORDER BY birth_date;

#this returns the birthdate with the youngest at the top (1965-02-01)
SELECT birth_date FROM employees ORDER BY birth_date DESC;

#This returns a table two columns, one for each decade with the count of emplyees born in that decade.
SELECT 
COUNT(CASE WHEN birth_date < '1960-01-01' THEN birth_date ELSE NULL END) AS '1950s', COUNT(CASE WHEN birth_date < '1970-01-01' AND birth_date >= '1960-01-01' THEN birth_date ELSE NULL END) AS '1960s'
FROM employees;


#4
#I initally attempted this exercise by writing a subquery to pull the average salary for each department group and named it with the group name, I was able to get the code to run but it produced a table with the department group names as the column headers and the average salary repeating for all the rows under the headers. 
#After rethinking I realized that I could group the departments in to department groups in rows using a case statement and was able to build out the code around it after getting that part to run 

#Grouping the department names into rows:
SELECT
CASE
WHEN dept_name IN ('Research', 'Development') THEN 'R&D'
WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
WHEN dept_name IN ('production', 'quality management') THEN 'Prod & QM'
WHEN dept_name IN ('finance', 'human resources') THEN 'Finance & HR'
WHEN dept_name IN ('Customer service') THEN 'Customer Service'
END AS department_group
FROM departments
GROUP BY department_group;

#adding the rest of the code to above to fullfill the exercise.
SELECT AVG(s.salary) AS avg_salary,
CASE
WHEN dept_name IN ('Research', 'Development') THEN 'R&D'
WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
WHEN dept_name IN ('production', 'quality management') THEN 'Prod & QM'
WHEN dept_name IN ('finance', 'human resources') THEN 'Finance & HR'
WHEN dept_name IN ('Customer service') THEN 'Customer Service'
END AS department_group
FROM departments AS d
JOIN dept_emp AS de USING (dept_no)
JOIN salaries AS s USING (emp_no)
GROUP BY department_group;






