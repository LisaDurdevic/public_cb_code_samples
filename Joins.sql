/* JOINS */

/* --------------------------------------------------------------------------------- */
/* Create tables */
DROP TABLE job_history;
DROP TABLE employees;
DROP TABLE jobs;
DROP TABLE departments;
DROP TABLE locations;
DROP TABLE countries;
DROP TABLE regions;

CREATE TABLE regions (region_id int, region_name varchar(25), primary key (region_id));
CREATE TABLE countries(country_id char(2), country_name varchar(40), region_id int, primary key (country_id), foreign key (region_id) references regions(region_id));
CREATE TABLE locations(location_id int, street_address varchar(40), postal_code varchar(12), city varchar(30) NOT NULL, state_province varchar(25), country_id char(2), primary key (location_id), foreign key (country_id) references countries (country_id));
CREATE TABLE departments(department_id int, department_name varchar(30) NOT NULL, manager_id int, location_id, primary key (department_id), foreign key (location_id) references locations (location_id));
CREATE TABLE jobs(job_id varchar(10), job_title varchar(35) NOT NULL, min_salary int, max_salary int, primary key (job_id));
CREATE TABLE employees(employee_id int, first_name varchar(20), last_name varchar(20) NOT NULL, email varchar(25) NOT NULL, phone_number varchar(20), hire_date date NOT NULL, job_id varchar(10) NOT NULL, salary decimal(8,2), commission_pct decimal(2,2), manager_id int, department_id int, primary key (employee_id), foreign key (job_id) references jobs (job_id), foreign key (manager_id) references employees (employee_id), foreign key (department_id) references departments (department_id));
CREATE TABLE job_history(employee_id int, start_date date, end_date date NOT NULL, job_id varchar(10) NOT NULL, department_id int, primary key (employee_id, start_date), foreign key (employee_id) references employees (employee_id), foreign key (job_id) references jobs (job_id), foreign key (department_id) references departments (department_id));

/* --------------------------------------------------------------------------------- */
/* Insert Values */
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

INSERT INTO regions VALUES
       ( 1
       , 'Europe'
       );
INSERT INTO regions VALUES
       ( 2
       , 'Americas'
       );
INSERT INTO regions VALUES
       ( 3
       , 'Asia'
       );
INSERT INTO regions VALUES
       ( 4
       , 'Middle East and Africa'
       );
INSERT INTO countries VALUES
       ( 'US'
       , 'United States of America'
       , 2
       );
INSERT INTO countries VALUES
       ( 'CA'
       , 'Canada'
       , 2
       );
INSERT INTO countries VALUES
       ( 'UK'
       , 'United Kingdom'
       , 1
       );
INSERT INTO countries VALUES
       ( 'DE'
       , 'Germany'
       , 1
       );
INSERT INTO locations VALUES
       ( 1400
       , '2014 Jabberwocky Rd'
       , '26192'
       , 'Southlake'
       , 'Texas'
       , 'US'
       );
INSERT INTO locations VALUES
       ( 1500
       , '2011 Interiors Blvd'
       , '99236'
       , 'South San Francisco'
       , 'California'
       , 'US'
       );
INSERT INTO locations VALUES
       ( 1700
       , '2004 Charade Rd'
       , '98199'
       , 'Seattle'
       , 'Washington'
       , 'US'
       );
INSERT INTO locations VALUES
       ( 1800
       , '147 Spadina Ave'
       , 'M5V 2L7'
       , 'Toronto'
       , 'Ontario'
       , 'CA'
       );
INSERT INTO locations VALUES
       ( 2500
       , 'Magdalen Centre, The Oxford Science Park'
       , 'OX9 9ZB'
       , 'Oxford'
       , 'Oxford'
       , 'UK'
       );

INSERT INTO departments VALUES
       ( 10
       , 'Administration'
       , 200
       , 1700
       );
INSERT INTO departments VALUES
       ( 20
       , 'Marketing'
       , 201
       , 1800
       );
INSERT INTO departments VALUES
       ( 50
       , 'Shipping'
       , 121
       , 1500
       );
INSERT INTO departments VALUES
       ( 60
       , 'IT'
       , 103
       , 1400
       );
INSERT INTO departments VALUES
       ( 80
       , 'Sales'
       , 145
       , 2500
       );
INSERT INTO departments VALUES
       ( 90
       , 'Executive'
       , 100
       , 1700
       );
INSERT INTO departments VALUES
       ( 110
       , 'Accounting'
       , 205
       , 1700
       );
INSERT INTO departments VALUES
       ( 190
       , 'Contracting'
       , NULL
       , 1700
       );

INSERT INTO jobs VALUES
       ( 'AD_PRES'
       , 'President'
       , 20000
       , 40000
       );
INSERT INTO jobs VALUES
       ( 'AD_VP'
       , 'Administration Vice President'
       , 15000
       , 30000
       );
INSERT INTO jobs VALUES
       ( 'AD_ASST'
       , 'Administration Assistant'
       , 3000
       , 6000
       );
INSERT INTO jobs VALUES
       ( 'AC_MGR'
       , 'Accounting Manager'
       , 8200
       , 16000
       );
INSERT INTO jobs VALUES
       ( 'AC_ACCOUNT'
       , 'Public Accountant'
       , 4200
       , 9000
       );
INSERT INTO jobs VALUES
       ( 'SA_MAN'
       , 'Sales Manager'
       , 10000
       , 20000
       );
INSERT INTO jobs VALUES
       ( 'SA_REP'
       , 'Sales Representative'
       , 6000
       , 12000
       );
INSERT INTO jobs VALUES
       ( 'ST_MAN'
       , 'Stock Manager'
       , 5500
       , 8500
       );
INSERT INTO jobs VALUES
       ( 'ST_CLERK'
       , 'Stock Clerk'
       , 2000
       , 5000
       );
INSERT INTO jobs VALUES
       ( 'SH_CLERK'
       , 'Shipping Clerk'
       , 2500
       , 5500
       );
INSERT INTO jobs VALUES
       ( 'IT_PROG'
       , 'Programmer'
       , 4000
       , 10000
       );
INSERT INTO jobs VALUES
       ( 'MK_MAN'
       , 'Marketing Manager'
       , 9000
       , 15000
       );
INSERT INTO jobs VALUES
       ( 'MK_REP'
       , 'Marketing Representative'
       , 4000
       , 9000
       );

INSERT INTO employees VALUES
       ( 100
       , 'Steven'
       , 'King'
       , 'SKING'
       , '515.123.4567'
       , '17061987'
       , 'AD_PRES'
       , 24000
       , NULL
       , NULL
       , 90
       );
INSERT INTO employees VALUES
       ( 101
       , 'Neena'
       , 'Kochhar'
       , 'NKOCHHAR'
       , '515.123.4568'
       , '21091989'
       , 'AD_VP'
       , 17000
       , NULL
       , 100
       , 90
       );
INSERT INTO employees VALUES
       ( 102
       , 'Lex'
       , 'De Haan'
       , 'LDEHAAN'
       , '515.123.4569'
       , '13011993'
       , 'AD_VP'
       , 17000
       , NULL
       , 100
       , 90
       );
INSERT INTO employees VALUES
       ( 103
       , 'Alexander'
       , 'Hunold'
       , 'AHUNOLD'
       , '590.423.4567'
       , '03011990'
       , 'IT_PROG'
       , 9000
       , NULL
       , 102
       , 60
       );

INSERT INTO employees VALUES
       ( 104
       , 'Bruce'
       , 'Ernst'
       , 'BERNST'
       , '590.423.4568'
       , '21051991'
       , 'IT_PROG'
       , 6000
       , NULL
       , 103
       , 60
       );
INSERT INTO employees VALUES
       ( 107
       , 'Diana'
       , 'Lorentz'
       , 'DLORENTZ'
       , '590.423.5567'
       , '07021999'
       , 'IT_PROG'
       , 4200
       , NULL
       , 103
       , 60
       );
INSERT INTO employees VALUES
       ( 124
       , 'Kevin'
       , 'Mourgos'
       , 'KMOURGOS'
       , '650.123.5234'
       , '16111999'
       , 'ST_MAN'
       , 5800
       , NULL
       , 100
       , 50
       );
INSERT INTO employees VALUES
       ( 141
       , 'Trenna'
       , 'Rajs'
       , 'TRAJS'
       , '650.121.8009'
       , '17101995'
       , 'ST_CLERK'
       , 3500
       , NULL
       , 124
       , 50
       );
INSERT INTO employees VALUES
       ( 142
       , 'Curtis'
       , 'Davies'
       , 'CDAVIES'
       , '650.121.2994'
       , '29011997'
       , 'ST_CLERK'
       , 3100
       , NULL
       , 124
       , 50
       );
INSERT INTO employees VALUES
       ( 143
       , 'Randall'
       , 'Matos'
       , 'RMATOS'
       , '650.121.2874'
       , '15031998'
       , 'ST_CLERK'
       , 2600
       , NULL
       , 124
       , 50
       );
INSERT INTO employees VALUES
       ( 144
       , 'Peter'
       , 'Vargas'
       , 'PVARGAS'
       , '650.121.2004'
       , '09071998'
       , 'ST_CLERK'
       , 2500
       , NULL
       , 124
       , 50
       );
INSERT INTO employees VALUES
       ( 149
       , 'Eleni'
       , 'Zlotkey'
       , 'EZLOTKEY'
       , '011.44.1344.429018'
       , '29012000'
       , 'SA_MAN'
       , 10500
       , .2
       , 100
       , 80
       );
INSERT INTO employees VALUES
       ( 174
       , 'Ellen'
       , 'Abel'
       , 'EABEL'
       , '011.44.1644.429267'
       , '11051996'
       , 'SA_REP'
       , 11000
       , .30
       , 149
       , 80
       );
INSERT INTO employees VALUES
       ( 176
       , 'Jonathon'
       , 'Taylor'
       , 'JTAYLOR'
       , '011.44.1644.429265'
       , '24031998'
       , 'SA_REP'
       , 8600
       , .20
       , 149
       , 80
       );
INSERT INTO employees VALUES
       ( 178
       , 'Kimberely'
       , 'Grant'
       , 'KGRANT'
       , '011.44.1644.429263'
       , '24051999'
       , 'SA_REP'
       , 7000
       , .15
       , 149
       , NULL
       );
INSERT INTO employees VALUES
       ( 200
       , 'Jennifer'
       , 'Whalen'
       , 'JWHALEN'
       , '515.123.4444'
       , '17091987'
       , 'AD_ASST'
       , 4400
       , NULL
       , 101
       , 10
       );
INSERT INTO employees VALUES
       ( 201
       , 'Michael'
       , 'Hartstein'
       , 'MHARTSTE'
       , '515.123.5555'
       , '17021996'
       , 'MK_MAN'
       , 13000
       , NULL
       , 100
       , 20
       );
INSERT INTO employees VALUES
       ( 202
       , 'Pat'
       , 'Fay'
       , 'PFAY'
       , '603.123.6666'
       , '17081997'
       , 'MK_REP'
       , 6000
       , NULL
       , 201
       , 20
       );
INSERT INTO employees VALUES
       ( 205
       , 'Shelley'
       , 'Higgins'
       , 'SHIGGINS'
       , '515.123.8080'
       , '07061997'
       , 'AC_MGR'
       , 12000
       , NULL
       , 101
       , 110
       );
INSERT INTO employees VALUES
       ( 206
       , 'William'
       , 'Gietz'
       , 'WGIETZ'
       , '515.123.8181'
       , '07061997'
       , 'AC_ACCOUNT'
       , 8300
       , NULL
       , 205
       , 110
       );

INSERT INTO job_history
VALUES (102
      , '13011993'
      , '24061998'
      , 'IT_PROG'
      , 60);
INSERT INTO job_history
VALUES (101
      , '21091989'
      , '27101993'
      , 'AC_ACCOUNT'
      , 110);
INSERT INTO job_history
VALUES (101
      , '28101993'
      , '15031997'
      , 'AC_MGR'
      , 110);
INSERT INTO job_history
VALUES (201
      , '17021996'
      , '19121999'
      , 'MK_REP'
      , 20);
INSERT INTO job_history
VALUES  (200
       , '17091987'
       , '17061993'
       , 'AD_ASST'
       , 90
       );
INSERT INTO job_history
VALUES  (176
       , '24031998'
       , '31121998'
       , 'SA_REP'
       , 80
       );
INSERT INTO job_history
VALUES  (176
       , '01011999'
       , '31121999'
       , 'SA_MAN'
       , 80
       );
INSERT INTO job_history
VALUES  (200
       , '01061994'
       , '31121998'
       , 'AC_ACCOUNT'
       , 90
       );

commit;

/* --------------------------------------------------------------------------------- */
/* SELECT */
/* --------------------------------------------------------------------------------- */

/* 1 ---------------------------------------------- */
SELECT employee_id, last_name, job_id, hire_date startdate
FROM employees
ORDER BY employee_id;

/* 2 ---------------------------------------------- */
SELECT DISTINCT job_id
FROM employees
ORDER BY job_id;

/* 3 ---------------------------------------------- */
SELECT last_name, salary
FROM employees
WHERE salary > 12000
ORDER BY last_name;

/* 4 ---------------------------------------------- */
SELECT last_name, department_id
FROM employees
WHERE employee_id = 176;

/* 5 ---------------------------------------------- */
SELECT last_name, job_id, hire_date
FROM employees
ORDER BY hire_date;

/* 6 ---------------------------------------------- */
SELECT last_name, department_id
FROM employees
WHERE department_id = 20
ORDER BY last_name;

/* 7 ---------------------------------------------- */
SELECT 
    last_name "Employee", 
    salary "Monthly salary", 
    commission_pct *100 "Commission %"
FROM employees
WHERE commission_pct = 0.2
ORDER BY last_name;

/* --------------------------------------------------------------------------------- */
/* JOINS */
/* --------------------------------------------------------------------------------- */

/* 1 ---------------------------------------------- */
SELECT  
    j.job_id id, 
    j.min_salary min,
    j.max_salary max,
    s.salary sum
FROM jobs j,
    (SELECT job_id, sum(salary) salary
        FROM employees
        GROUP BY job_id) s
WHERE s.job_id (+) = j.job_id
ORDER BY s.salary DESC;

/* 2 ---------------------------------------------- */
SELECT ROUND(AVG(salary)) avg_sal
FROM employees;


/* 3 ---------------------------------------------- */
SELECT first_name, last_name, department_name
FROM employees 
    INNER JOIN departments
    USING (department_id);

/* 4 ---------------------------------------------- */
SELECT department_name, postal_code, city, state_province, street_address
FROM departments 
    NATURAL JOIN locations
ORDER BY department_name, state_province;

/* 5 ---------------------------------------------- */
SELECT department_name, postal_code, city, state_province, street_address, country_name
FROM departments 
    NATURAL JOIN locations
    NATURAL JOIN countries
ORDER BY department_name, state_province;

/* 6 ---------------------------------------------- */
SELECT department_name, first_name || ' ' || last_name manager, postal_code, city, state_province, street_address, country_name
FROM departments 
    NATURAL JOIN locations
    NATURAL JOIN countries
    LEFT OUTER JOIN employees
    ON (employees.employee_id = departments.manager_id)
ORDER BY department_name, state_province;

/* 7 ---------------------------------------------- */
SELECT 
    (e.first_name || ' ' || e.last_name) name,
    e.job_title job,
    e.salary,
    d.department_name
FROM departments d 
    INNER JOIN (
        SELECT *
        FROM employees 
            INNER JOIN jobs
            USING (job_id)) e
    USING (department_id);

/* 8 ---------------------------------------------- */
SELECT
    (m.first_name || ' ' || m.last_name) manager,
    (e.first_name || ' ' || e.last_name) subordinate
FROM employees e,
    employees m
WHERE e.manager_id (+) =  m.employee_id
ORDER BY manager;