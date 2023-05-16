--create Table Schemata
--be mindful of creation order for PK/FK

--titles table
CREATE TABLE titles (
  title_id VARCHAR(10) PRIMARY KEY NOT NULL,
  title VARCHAR(50)
);

--departments table
CREATE TABLE departments (
  dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
  dept_name VARCHAR(50)
);

--employees tables
CREATE TABLE employees (
  emp_no INT PRIMARY KEY NOT NULL,
  emp_title_id VARCHAR(10) REFERENCES titles(title_id),
  birth_date DATE,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  sex CHAR(1),
  hire_date DATE
);

--salaries table
CREATE TABLE salaries (
  emp_no INT,
  salary INT,
  PRIMARY KEY (emp_no, salary),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--dept_manager table
CREATE TABLE dept_manager (
  dept_no VARCHAR(10),
  emp_no INT,
  PRIMARY KEY (dept_no, emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--dept_emp table
CREATE TABLE dept_emp (
  emp_no INT,
  dept_no VARCHAR(10),
  PRIMARY KEY (emp_no, dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);