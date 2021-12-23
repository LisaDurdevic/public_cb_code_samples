SELECT employee_id, last_name, job_id, hire_date startdate FROM employees ORDER BY employee_id;

SELECT DISTINCT job_id FROM employees ORDER BY job_id;

SELECT employee_id "Emp #", last_name "Employee", job_id "Job", hire_date "Hire Date" FROM employees ORDER BY employee_id;

SELECT last_name "Employee", salary "Salary" FROM employees WHERE salary > 12000 ORDER BY salary;

SELECT last_name "Employee", department_id "Department" FROM employees WHERE employee_id = 176;

SELECT employee_id "Emp #", last_name "Employee", job_id "Job", hire_date "Hire Date" FROM employees ORDER BY hire_date;

SELECT last_name "Employee", department_id "Department" FROM employees WHERE department_id = 20 ORDER BY last_name;

SELECT last_name "Employee", salary "Monthly Salary", commission_pct "Commission" FROM employees WHERE commission_pct = 0.2;