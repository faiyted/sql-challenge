-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no,
       e.last_name,
       e.first_name,
       e.sex,
       s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name,
       e.last_name,
       e.hire_date
FROM employees e
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, em.last_name, em.first_name
FROM departments d
JOIN dept_manager dm 
ON d.dept_no = dm.dept_no
JOIN employees em
ON dm.emp_no = em.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept.emp_no, em.last_name, em.first_name , d.dept_name
from dept_emp dept
JOIN employees em
on dept.emp_no = em.emp_no
JOIN departments d
on dept.dept_no = d.dept_no

-- -- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept.emp_no, em.last_name, em.first_name, d.dept_name
FROM dept_emp dept
JOIN employees em
ON dept.emp_no = em.emp_no
JOIN departments d
ON dept.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'

-- 7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept.emp_no, em.last_name, em.first_name, d.dept_name
FROM dept_emp dept
JOIN employees em
ON dept.emp_no = em.emp_no
JOIN departments d
ON dept.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'

-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;