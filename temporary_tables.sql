## TEMPORARY TABLES ##


#1
#pull the data from the other databases into the temporary table using the full file path of the other database (eg. employees.employees.first_name)
CREATE TEMPORARY TABLE employees_with_departments (
SELECT employees.employees.first_name, employees.employees.last_name, employees.departments.dept_name 
FROM employees.employees
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
);

#review the contents of the temporary table I created
SELECT * FROM employees_with_departments;

#add a column for full_name
ALTER TABLE employees_with_departments ADD full_name VARCHAR (100);

#check what happened
SELECT * FROM employees_with_departments;

#update the data values in the temp table.
UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

#check what happened
SELECT * FROM employees_with_departments;

#drop first name column
ALTER TABLE employees_with_departments DROP COLUMN first_name;

#check what happened
SELECT * FROM employees_with_departments;

#drop last name column
ALTER TABLE employees_with_departments DROP COLUMN last_name;

#check what happened
SELECT * FROM employees_with_departments;

#delete the whole temp table
DROP TABLE employees_with_departments;

#you can get the same results by combining the first and last name when creating the table. 
CREATE TEMPORARY TABLE employees_with_departments (
SELECT CONCAT(employees.employees.first_name, ' ', employees.employees.last_name) AS full_name, employees.departments.dept_name 
FROM employees.employees
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
);


#2
#pull the data for the payment table from the sakila database
CREATE TEMPORARY TABLE sakila_temp (
SELECT * FROM sakila.payment);

#check what happened
SELECT * FROM sakila_temp;

#add a column for the new amount structure
ALTER TABLE sakila_temp ADD cents_amount INT UNSIGNED NOT NULL;

#update new column with data values
UPDATE sakila_temp SET cents_amount = amount * 100; 

#check what happened
SELECT * FROM sakila_temp;

