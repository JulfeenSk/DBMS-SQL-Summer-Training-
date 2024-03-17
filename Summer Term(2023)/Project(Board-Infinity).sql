/*
The HR database is a sample database that was originally created by
Microsoft and used as the basis for their tutorials in a variety of
database products for decades.
The HR sample database has seven tables:
1. The employees table stores the data of employees.
2. The jobs table stores the job data including job title and salary range.
3. The departments table stores department data.
4. The job_history table stores the job history of employees.
5. The locations table stores the location of the departments of the
company.
6. The countries table stores the data of countries where the company is
doing business.
7. The regions table stores the data of regions such as Asia, Europe,
America, and the Middle East and Africa. The countries are grouped into
regions.
Data Set Link - https://www.kaggle.com/datasets/sirajahmad/hrschema-mysql
*/
use hr;
-- Tasks and answers
/*1) Write a query to find the addresses (location_id, street_address, city,
state_province, country_name) of all the departments*/

-- ANS:
SELECT 
     l.location_id, 
     l.street_address, 
     l.city, 
     l.state_province,
     c.country_name
FROM departments d
JOIN locations l 
ON d.location_id = l.location_id
JOIN countries c 
ON l.country_id = c.country_id;

/*2) Write a query to find the name (first_name, last name), department ID
and name of all the employees*/

-- ANS:
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

/*3) Write a query to find the name (first_name, last_name), job,
department ID and name of the employees who works in London */
-- ANS:

SELECT e.first_name, e.last_name, j.job_title, e.department_id,d.department_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'London';

/* 4) Write a query to find the employee id, name (last_name) along with
their manager_id and name (last_name) */

-- ANS:
SELECT e.employee_id, e.last_name AS employee_last_name,
       e.manager_id, m.last_name AS manager_last_name
FROM employees e
LEFT JOIN employees m
 ON e.manager_id = m.employee_id;
 
/*5) Write a query to find the name (first_name, last_name) and hire date
of the employees who was hired after 'Jones'*/

-- ANS:
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > ( SELECT hire_date
 FROM employees
 WHERE last_name = 'Jones'
 );
 
/*6) Write a query to get the department name and number of employees
in the department*/

-- ANS:
SELECT d.department_name, COUNT(e.employee_id) AS num_employees
FROM departments d
 LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY
d.department_name;

/*7) Write a query to display department name, name (first_name,
last_name), hire date, salary of the manager for all managers whose
experience is more than 15 years */

-- ANS:
SELECT d.department_name, e.first_name, e.last_name,
 e.hire_date, e.salary
FROM employees e
 JOIN departments d ON e.department_id = d.department_id
WHERE e.employee_id IN (
 SELECT manager_id
 FROM employees
 WHERE hire_date <= DATE_SUB(CURDATE(), INTERVAL 15 YEAR)
 );

/*8) Write a query to find the name (first_name, last_name) and the
salary of the employees who have a higher salary than the employee
whose last_name='Bull'*/

-- ANS:
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (
 SELECT salary
 FROM employees
 WHERE last_name = 'Bull'
 );
 
/*9) Write a query to find the name (first_name, last_name) of all
employees who works in the IT department*/

-- ANS:
SELECT first_name, last_name
FROM employees
WHERE department_id = (
 SELECT department_id
 FROM departments
 WHERE department_name = 'IT'
 );
 
/*10) Write a query to find the name (first_name, last_name) of the
employees who have a manager and worked in a USA based
department*/

-- ANS:
SELECT e.first_name, e.last_name
FROM employees e
 JOIN departments d ON e.department_id = d.department_id
WHERE e.manager_id IS NOT NULL
 AND d.location_id IN (
 SELECT location_id
 FROM locations
 WHERE country_id =
 (
 SELECT country_id
 FROM countries
 WHERE country_name = 'United States of America'
 )
 );
 
/*11) Write a query to find the name (first_name, last_name), and salary
of the employees whose salary is greater than the average salary*/

-- ANS:
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (
 SELECT AVG(salary)
 FROM employees
 );
 
/*12) Write a query to find the name (first_name, last_name), and salary
of the employees whose salary is equal to the minimum salary for their
job grade*/

-- ANS:
SELECT e.first_name, e.last_name, e.salary
FROM employees e
 JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary = (
 SELECT MIN(salary)
 FROM employees
 WHERE job_id = e.job_id
 );
 
/*13) Write a query to find the name (first_name, last_name), and salary of
the employees who earns more than the average salary and works in any
of the IT departments */

-- ANS:
SELECT e.first_name, e.last_name, e.salary
FROM employees e
 JOIN departments d ON e.department_id = d.department_id
WHERE e.salary >
 (
 SELECT AVG(salary)
 FROM employees
 )
 AND d.department_name LIKE '%IT%';
 
/*14) Write a query to find the name (first_name, last_name), and salary
of the employees who earn the same salary as the minimum salary for all
departments.*/

-- ANS:
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary =
 (
 SELECT MIN(salary)
 FROM employees
 );
 
/*15) Write a query to find the name (first_name, last_name) and salary of
the employees who earn a salary that is higher than the salary of all the
Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the
lowest to highest*/

-- ANS:
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary >
 (
 SELECT MAX(salary)
 FROM employees
 WHERE job_id = 'SH_CLERK'
 )
ORDER BY e.salary ASC;


