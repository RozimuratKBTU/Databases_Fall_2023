create database lab6
    with owner postgres;

create table locations(
    location_id serial primary key,
    street_address varchar(25),
    postal_code Varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table departments2(
    department_id serial primary key,
    department_name varchar(50) unique,
    budget integer,
    location_id INTEGER references locations
);

create table employees2(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references departments2
);

--3
select e.first_name, e.last_name, d.department_id, d.department_name
from employees2 e
join departments2 d on e.department_id = d.department_id;

--4

SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees2 e
JOIN departments2 d ON e.department_id = d.department_id
where d.department_id in(8,4);

--5
SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province
FROM employees2 e
JOIN departments2 d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

--6
select *
from departments2 d
left join employees2 e on d.department_id = e.department_id;

--7
select e.first_name, e.last_name, d.department_id, d.department_name
    from employees2 e
        left join departments2 d on e.employee_id = d.department_id;


update employees2
    set employee_id = 23
where first_name = 'Chris';



INSERT INTO locations (street_address, postal_code, city, state_province)
VALUES
    ('123 Main Street', '12345', 'New York', 'NY'),
    ('456 Elm Street', '67890', 'Los Angeles', 'CA'),
    ('789 Oak Avenue', '54321', 'Chicago', 'IL'),
    ('101 Pine Road', '98765', 'Houston', 'TX'),
    ('222 Maple Lane', '13579', 'San Francisco', 'CA'),
    ('333 Cedar Street', '54321', 'Miami', 'FL'),
    ('444 Birch Avenue', '98765', 'Dallas', 'TX'),
    ('555 Willow Place', '22222', 'Seattle', 'WA'),
    ('666 Redwood Road', '33333', 'Boston', 'MA'),
    ('777 Juniper Street', '44444', 'Philadelphia', 'PA');


INSERT INTO departments2 (department_name, budget, location_id)
VALUES
    ('HR', 50000, 1),
    ('Sales', 80000, 2),
    ('Marketing', 60000, 3),
    ('Finance', 70000, 4),
    ('IT', 90000, 5),
    ('Engineering', 85000, 6),
    ('Customer Support', 55000, 7),
    ('Operations', 75000, 8),
    ('Legal', 65000, 9),
    ('R&D', 95000, 10);


INSERT INTO employees2 (first_name, last_name, email, phone_number, salary, department_id)
VALUES
    ('John', 'Doe', 'john.doe@email.com', '555-123-4567', 60000, 1),
    ('Jane', 'Smith', 'jane.smith@email.com', '555-234-5678', 65000, 2),
    ('Mike', 'Johnson', 'mike.johnson@email.com', '555-345-6789', 70000, 3),
    ('Sarah', 'Williams', 'sarah.williams@email.com', '555-456-7890', 72000, 4),
    ('David', 'Brown', 'david.brown@email.com', '555-567-8901', 75000, 5),
    ('Emily', 'Wilson', 'emily.wilson@email.com', '555-678-9012', 78000, 6),
    ('Chris', 'Anderson', 'chris.anderson@email.com', '555-789-0123', 60000, 7),
    ('Anna', 'Martinez', 'anna.martinez@email.com', '555-890-1234', 62000, 8),
    ('Robert', 'Garcia', 'robert.garcia@email.com', '555-901-2345', 65000, 9),
    ('Linda', 'Jones', 'linda.jones@email.com', '555-012-3456', 67000, 10);


select e.first_name, d.department_name, l.street_address from employees2 e
join departments2 d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;





