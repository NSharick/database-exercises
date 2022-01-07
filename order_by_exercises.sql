USE employees;

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;

#First row of results was "Irena Reutenauer" and last row of the results was "Vidya Simmen".

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name;

# First row of results was "Irena Action" and last row of the results was "Vidya Zweizig".

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name, first_name;

# First row of results was "Irena Action" and last row of the results was "Maya Zyda".

SELECT * FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E' ORDER BY emp_no;

#This query returned 899 employees. The first row was "10021, Ramzi Erde" and the last row was "499648, Tadahiro Erde".

SELECT * FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E' ORDER BY hire_date DESC;

#Resulted in 899 employees. Newest employee was "Teiji Eldridge" and the oldest employee was "Sergi Erde".

SELECT * FROM employees WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%-12-25' ORDER BY birth_date, hire_date DESC;

#Returned 362 employees. Oldest hired last was "Khun Bernini" and the youngest hired first was "Douadi Pettis"

