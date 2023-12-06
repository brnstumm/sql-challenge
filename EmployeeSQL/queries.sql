/*  List the employee number, last name, first name, sex, and salary of each employee.   */
Select employee_number, last_name, first_name, sex, salary
from employees e
join salaries s 
	on e.employee_number = s.employee_id;
	
/*  List the first name, last name, and hire date for the employees who were hired in 1986.  */
select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';

/*  List the manager of each department along with their department number, 
	department name, employee number, last name, and first name.   */
select d.department_id, d.department_name, employee_number, last_name, first_name
from employees e
inner join titles t on t.title_id = e.employee_title
inner join department_manager dm on dm.employee_id = e.employee_number
inner join departments d on d.department_id = dm.department_id
where t.title = 'Manager';

/*  List the department number for each employee along with that employee’s employee number,
	last name, first name, and department name.   */
select d.department_id, employee_number, last_name, first_name, d.department_name
from employees e
inner join department_employees de on de.employee_id = e.employee_number
inner join departments d on d.department_id = de.department_id
group by d.department_id, employee_number, last_name, first_name, d.department_name;

/*  List first name, last name, and sex of each employee whose first name is
	Hercules and whose last name begins with the letter B.   */
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
	and last_name like 'B%';
	
/*  List each employee in the Sales department, including their employee number,
	last name, and first name.   */	
select employee_number, last_name, first_name
from employees e
inner join department_employees de on de.employee_id = e.employee_number
inner join departments d on d.department_id = de.department_id
where department_name = 'Sales';


/*  List each employee in the Sales and Development departments, 
	including their employee number, last name, first name, and department name.   */
select employee_number, last_name, first_name, department_name
from employees e
inner join department_employees de on de.employee_id = e.employee_number
inner join departments d on d.department_id = de.department_id
where department_name = 'Sales'
	or department_name = 'Development';

/*  List the frequency counts, in descending order, of all the employee last names 
	(that is, how many employees share each last name).   */
select count (distinct employee_number), last_name
from employees
group by last_name
order by count(employee_number) desc;



