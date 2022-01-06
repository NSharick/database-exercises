USE employees;
SHOW TABLES;
DESCRIBE employees;
DESCRIBE departments;
DESCRIBE salaries;
DESCRIBE titles;
DESCRIBE dept_manager;
SHOW CREATE TABLE dept_manager;

# Int was used across all the tables as the primary key for employee number. For other data types used "employees" used string and date, "departments" used string, "salaries" used numeric and date, "titles" used string and date, "dept_manager" used string and date.

DESCRIBE dept_emp;

# The employees and departments tables are connected by the dept_emp table which allows for changes in department without a loss of historical data. 