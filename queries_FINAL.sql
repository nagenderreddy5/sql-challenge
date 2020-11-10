--1. Filtering the following details of each employee: employee number, last name, first name, sex, and salary.
	
SELECT employee.emp_no, employee.last_name, employee.first_name, employee.sex, salaries.salary
FROM salaries
INNER JOIN employee
ON (employee.emp_no = salaries.emp_no);


--2. Filtering list  of employees who were hired in 1986 by first name, last name, and hire date.

SELECT  first_name, last_name, hire_date
FROM employee
	WHERE (hire_date BETWEEN '1986-01-01' AND '1986-12-31');

--3. List the manager of each department with the following information: department number, department name,
--the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments AS d
   INNER JOIN dept_manager AS dm
   ON (d.dept_no=dm.dept_no)
   INNER JOIN
   employee AS e
   ON (dm.emp_no = e.emp_no);
   
   
  

--4. Filter the follwing information of each employee of the department: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee AS e
   INNER JOIN
   dept_employee AS de
   ON (e.emp_no = de.emp_no)
   INNER JOIN
   departments AS d
   ON (d.dept_no = de.dept_no);

--5. Filter the employess information by first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT  first_name, last_name, sex
	FROM employee
	WHERE (first_name = 'Hercules' AND last_name LIKE 'B%');

--6. Filter all employees info in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee AS e
   INNER JOIN
   dept_employee AS de
   ON (e.emp_no = de.emp_no)
   INNER JOIN
   departments AS d
   ON (de.dept_no = d.dept_no)
   WHERE (d.dept_name = 'Sales');
   
--7. Filter all employees info in the Sales and Development departments, by their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee AS e
   INNER JOIN
   dept_employee AS de
   ON (e.emp_no = de.emp_no)
   INNER JOIN
   departments AS d
   ON (de.dept_no = d.dept_no)
   WHERE (d.dept_name IN ('Sales', 'Development'));
   
--8. In descending order, frequency of employee last names count, i.e., how many employees share each last name.
SELECT e.last_name, COUNT(*)
FROM employee as e
GROUP BY e.last_name
ORDER BY COUNT(e.last_name) DESC;
