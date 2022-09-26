-- Creating tables for PH-EmployeeDB (PER MODULE)
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE employees (
     emp_no INT NOT NULL,
	 birth_date DATE NOT NULL,
	 first_name VARCHAR NOT NULL,
	 last_name VARCHAR NOT NULL,
	 gender VARCHAR NOT NULL,
	 hire_date DATE NOT NULL,
 	 PRIMARY KEY (emp_no)
);
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);
CREATE TABLE dept_Emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);	
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);

--CHALLENGE ASSIGNMENT
-- joining employees and titles tables,filter on birth date (1952-1955) then order by emp_no
-- creating table retirement_titles
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	titles.title,
	titles.from_date, 
	titles.to_date
INTO retirement_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY employees.emp_no;


-- Use Dictinct ON with Order by to remove duplicate rows by emp_no and to_date descending
-- creating table uniquie_titles
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- retrieve the count of titles from the unique_titles table and order by descending count
SELECT COUNT (title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY (count) DESC;

--combine employees and dept_emp tables and JOIN into a preliminary table: pre_table
SELECT  employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.birth_date,
	dept_emp.from_date,
	dept_emp.to_date
INTO pre_table
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
ORDER BY emp_no, to_date DESC;

--drop table if needed
DROP TABLE pre_table;

-- now combine titles and pre_table to get mentorship_eligibility table and filter to 
-- employees that were born in 1965
SELECT DISTINCT ON (pre_table.emp_no)
	pre_table.emp_no,
	pre_table.first_name,
	pre_table.last_name,
	pre_table.birth_date,
	pre_table.from_date,
	pre_table.to_date,
	titles.title
INTO mentorship_eligibility
FROM pre_table
LEFT JOIN titles
ON pre_table.emp_no = titles.emp_no
WHERE pre_table.to_date = '9999-01-01' AND birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY pre_table.emp_no;

--drop table if needed
DROP TABLE mentorship_eligibility;

--Results were as Challenge presented with one exception: emp_no 10291 Dipayan Seghrouchni
-- was shown on the Challenge assignment with a currenrt title of 'Staff'.  My review
-- of the titles.csv file did not support that result.  It should be 'Senior Staff'.




