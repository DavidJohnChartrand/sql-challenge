--datestyle set to match CSV files
SET datestyle TO postgres, mdy;
SHOW datestyle;

COPY departments(dept_no,dept_name)
	FROM'C:\Users\david\Desktop\git\sql-challenge\data\departments.csv'
	DELIMITER ','
	CSV HEADER;


COPY titles(title_id, title)
	FROM'C:\Users\david\Desktop\git\sql-challenge\data\titles.csv'
	DELIMITER ','
	CSV HEADER;

COPY employees (emp_no, emp_title, birth_date, first_name, last_name, sex, hire_date)
	FROM'C:\Users\david\Desktop\git\sql-challenge\data\employees.csv'
	DELIMITER ','
	CSV HEADER;

COPY dept_emp (emp_no , dept_no)
	FROM'C:\Users\david\Desktop\git\sql-challenge\data\dept_emp.csv'
	DELIMITER ','
	CSV HEADER;
	
COPY dept_manager(dept_no, emp_no)
	FROM'C:\Users\david\Desktop\git\sql-challenge\data\dept_manager.csv'
	DELIMITER ','
	CSV HEADER;

	
COPY salaries (emp_no, salary)
	FROM'C:\Users\david\Desktop\git\sql-challenge\data\salaries.csv'
	DELIMITER ','
	CSV HEADER;

SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no=salaries.emp_no;


SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date >= '01-01-1986';

SELECT employees.emp_no, employees.first_name, employees.last_name, dept_manager.dept_no, departments.dept_name
FROM employees
INNER JOIN dept_manager ON
employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON
dept_manager.dept_no=departments.dept_no;

SELECT employees.emp_no, employees.first_name, employees.last_name, dept_emp.dept_no, departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no=departments.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no=departments.dept_no
WHERE dept_name = 'Sales';

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no=departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';


SELECT last_name, COUNT(last_name) AS "Number of employees with last name"
FROM employees
GROUP BY last_name
ORDER BY "Number of employees with last name";