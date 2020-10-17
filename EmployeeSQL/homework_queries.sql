--Q1.List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

--Q2.List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name,last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date asc;

--Q3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT d.dept_no, d.dept_name, dept_m.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_manager dept_m
ON d.dept_no = dept_m.dept_no
JOIN employees e
ON e.emp_no = dept_m.emp_no
ORDER BY dept_no asc;

--Q4.List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT dept_m.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
JOIN dept_manager dept_m
ON d.dept_no = dept_m.dept_no
JOIN employees e
ON dept_m.emp_no = e.emp_no
ORDER BY d.dept_name asc;

--Q5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT last_name, first_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name asc;

--Q6.List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_emp de
ON de.dept_no = d.dept_no
JOIN employees e
ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales'
ORDER BY de.emp_no asc;

--Q7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_emp de
ON de.dept_no = d.dept_no
JOIN employees e
ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.last_name asc;

--Q8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(emp_no)
FROM employees
GROUP BY last_name
ORDER BY count desc;