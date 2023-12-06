/*  Creating the table for titles; setting primary key   */
CREATE TABLE titles (
    title_id VARCHAR(5) NOT NULL,
	title VARCHAR (30) NOT NULL,
    PRIMARY KEY (title_id)
);

/*  Verifying Titles table created as expected.  */
select * from titles;

/*  Creating the table for Employees; setting primary and foreign keys.   */
CREATE TABLE employees (
    employee_number INT NOT NULL,
	employee_title VARCHAR (5) NOT NULL,
	birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
	sex VARCHAR (1) NOT NULL,
	hire_date DATE NOT NULL,
    PRIMARY KEY (employee_number),
	FOREIGN KEY (employee_title) REFERENCES titles(title_id)
);

/*  Verifying Employees table created as expected.  */
select * from employees;

/*  Creating the table for Departments; setting primary key.   */
CREATE TABLE departments (
    department_id VARCHAR(4) NOT NULL,
	department_name VARCHAR (30) NOT NULL,
    PRIMARY KEY (department_id)
);

/*  Verifying Departments table created as expected.  */
select * from departments;

/*  Creating the table for Salaries; setting primary and foreign keys.   */
CREATE TABLE salaries (
    employee_id INT NOT NULL,
	salary FLOAT NOT NULL,
    PRIMARY KEY (employee_id, salary),
	FOREIGN KEY (employee_id) REFERENCES employees(employee_number)
);

/*  Verifying Salaries table created as expected.  */
select * from salaries;

/*  Creating the table for Department manager; setting primary and foreign keys.   */
CREATE TABLE department_manager (
    department_id VARCHAR(4) NOT NULL,
	employee_id INT NOT NULL,
    PRIMARY KEY (department_id, employee_id),
	FOREIGN KEY (employee_id) REFERENCES employees(employee_number),
	FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

/*  Verifying Department Manager table created as expected.  */
select * from department_manager;

/*  Creating the table for Department Employees; setting primary and foreign keys.   */
CREATE TABLE department_employees (
    employee_id INT NOT NULL,
	department_id VARCHAR(4) NOT NULL,
	PRIMARY KEY (employee_id, department_id),
	FOREIGN KEY (employee_id) REFERENCES employees(employee_number),
	FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

/*  Verifying Department Employees table created as expected.  */
select * from department_employees;


