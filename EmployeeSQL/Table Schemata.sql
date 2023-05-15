--create Table Schemata
--be mindful of creation order for PK/FK

--titles table
CREATE TABLE titles (
  title_id VARCHAR(10) PRIMARY KEY,
  title VARCHAR(50)
);

--populate table
COPY titles FROM 'Resources/titles.csv' WITH CSV HEADER;

--departments table
CREATE TABLE departments (
  dept_no VARCHAR(10) PRIMARY KEY,
  dept_name VARCHAR(50)
);

--populate table
COPY departments FROM 'Resources/departments.csv' WITH CSV HEADER;

--employees tables
CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR(10) REFERENCES titles(title_id),
  birth_date DATE,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  sex CHAR(1),
  hire_date DATE
);

--populate table
COPY employees FROM 'Resources/employees.csv' WITH CSV HEADER;

--salaries table
CREATE TABLE salaries (
  emp_no INT,
  salary INT,
  PRIMARY KEY (emp_no, salary),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--populate table
COPY salaries FROM 'Resources/salaries.csv' WITH CSV HEADER;

--dept_manager table
CREATE TABLE dept_manager (
  dept_no VARCHAR(10),
  emp_no INT,
  PRIMARY KEY (dept_no, emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--populate table
COPY dept_manager FROM 'Resources/dept_manager.csv' WITH CSV HEADER;

--dept_emp table
CREATE TABLE dept_emp (
  emp_no INT,
  dept_no VARCHAR(10),
  PRIMARY KEY (emp_no, dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--populate table
COPY dept_emp FROM 'Resources/dept_emp.csv' WITH CSV HEADER;