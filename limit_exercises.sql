USE employees;

SELECT DISTINCT title FROM titles;

#Senior Engineer, Staff Engineer, Senior Staff, Assistant Engineer, Technique Leader, and Manager

SELECT DISTINCT last_name FROM employees ORDER BY last_name DESC LIMIT 10;

#Zykh, Zyda, Zwicker, Zweizig, Zumaque, Zultner, Zucker, Zuberek, Zschoche, Zongker

SELECT *FROM employees WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%-12-25' ORDER BY hire_date LIMIT 5; 

#The first five names returned were Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, and Petter Stroustrup. 

SELECT * FROM employees WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%-12-25' ORDER BY hire_date LIMIT 5 OFFSET 45;

#The five names on the tenth page are Pranay Narwekar, Marjo Farrow, Ennio Karcich, Dines Lubachevsky, and Ipke Fontan.

#The tenth page of sets of five rows would be row 46 through row 50 so setting the LIMIT to 5 makes it five rows of data per page and setting the OFFSET at 45 would produce 5 rows of data starting at row 46 (The next row after the offset) which will result in page ten of this data set.

