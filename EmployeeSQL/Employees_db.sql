-- Create the tables
CREATE TABLE departments (
	dept_no VARCHAR(5) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR (25) NOT NULL
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(5) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary FLOAT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

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

