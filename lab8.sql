CREATE TABLE locations (
    location_id serial PRIMARY KEY,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

CREATE TABLE departments (
    department_id serial PRIMARY KEY,
    department_name varchar(50) UNIQUE,
    budget int,
    location_id int REFERENCES locations
);

CREATE TABLE employees (
    employee_id serial PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary int,
    manager_id int REFERENCES employees,
    department_id int REFERENCES departments

);

CREATE TABLE job_grades (
  grade char(1),
  lowest_salary int,
  highest_salary int
);

SELECT first_name, last_name, employees.department_id, city, state_province FROM locations
    JOIN departments on locations.location_id = departments.location_id
    JOIN employees on departments.department_id = employees.department_id WHERE last_name LIKE '%b%';

SELECT department_name, city, state_province FROM departments
    JOIN locations l on departments.location_id = l.location_id;

SELECT employees.first_name, manager.first_name FROM employees
    RIGHT JOIN (SELECT * FROM employees) as manager on employees.manager_id = manager.manager_id;

SELECT

SELECT first_name, last_name FROM locations
    JOIN departments on locations.location_id = departments.location_id
    JOIN employees on departments.department_id = employees.department_id WHERE city = 'London';