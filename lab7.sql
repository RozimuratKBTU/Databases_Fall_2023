

drop table countries;
-- 1
create table Countries(
    name varchar(255),
    location varchar(255)
);

insert into Countries(name, location) VALUES
                                          ('NewYork', 'USA'),
                                          ('Almaty', 'Kaz'),
                                          ('Paris', 'FRA'),
                                          ('London', 'UK');




explain analyze
select * from Countries where name = 'London';

create index if not exists indx_name on Countries (name)
    where name = 'London';


drop index if exists indx_name;

INSERT INTO Countries (name, location)
SELECT
    'Country' || generate_series,
    'Location' || generate_series
FROM generate_series(1, 1000000);



select * from Countries;

drop table if exists Countries;

drop table employees;

-- 2
create table employees(
    firstname varchar(255),
    lastname varchar(255),
    salary int,
    department_id int unique
);

create unique  index indx_location on employees(firstname);

delete salary fro

drop index indx_location;



INSERT INTO employees (firstname, lastname, salary, department_id)
SELECT
    'FirstName' || generate_series,
    'LastName' || generate_series,
    (random() * 50000 + 50000)::INT,
    generate_series
FROM generate_series(1, 499);

select * from employees;

explain analyse
select * from employees
where firstname = 'FirstName332' and lastname = 'LastName332';


--3
create index indx_FLname on employees(firstname, lastname);

drop index if exists indx_FLname;


explain analyse
select * from employees
where salary > 30000 and salary < 70000;

CREATE INDEX index_salary ON employees(salary);

drop index if exists index_salary;

select * from employees;

-- 4

insert into employees(firstname, lastname, salary, department_id) VALUES ('Rozimurat', 'Mirpulatoc', 1000000, 99887766);


explain analyse
select * from employees
where substring(firstname from 1 for 4) = 'Rozi';

CREATE INDEX idx_employees_name_substr ON employees(substring(firstname from 1 for 4));

drop index idx_employees_name_substr;

create table departments(
    department_id int unique,
    budget int
);

-- 5

INSERT INTO departments (department_id, budget)
SELECT
    generate_series,
    (random() * 1000000 + 50000)::INT
FROM generate_series(1, 100);

select * from departments;

CREATE INDEX indx_employees_departments ON employees(department_id
                                            );
CREATE INDEX indx_departments_budget ON departments(budget);



explain analyse
select * from employees e
join departments d on e.department_id = d.department_id
where d.budget > 50000 and e.salary < 150000;

drop table if exists employees;


































--
--
-- drop table users;
-- CREATE TABLE users
-- (
--     id          serial PRIMARY KEY,
--     username    VARCHAR(255) NOT NULL,
--     email       VARCHAR(255) NOT NULL,
--     date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );
--
-- select *
-- from orders;
--
-- DO
-- $$
--     DECLARE
--         i INTEGER := 0;
--
--     BEGIN
--         WHILE i < 1000000
--             LOOP
--                 INSERT INTO users (username, email)
--                 VALUES (md5(random()::text || clock_timestamp()::text),
--                         md5(random()::text || clock_timestamp()::text) || '@example.com');
--                 i := i + 1;
--             END LOOP;
--     END
-- $$;
--
-- CREATE TABLE orders
-- (
--     order_id     serial PRIMARY KEY,
--     user_id      INT REFERENCES users (id),
--     product_name VARCHAR(255) NOT NULL,
--     order_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );
--
-- do
-- $$
--     declare
--         j integer := 0;
--     begin
--         while j <50000
--             loop
--             insert into orders(user_id, product_name)
--             values (floor(random() * 1000000 + 1) :: int, 'Product-' ||
--                                                           md5(random() :: text));
--             j := j+1;
--             end loop;
--     end;
--
--     $$
--
-- explain analyze
-- select * from orders
-- where user_id > 95458
-- order by user_id;
--
-- create index orders_user_id_index on orders(user_id desc nulls last);
--
-- select *
-- from orders;
--
-- create index orders_user_id_index on orders (user_id);
--
-- create index orders_user_id_hash_index on orders using hash(user_id);
--
-- explain analyze
-- select *
-- from orders
-- where user_id = 717534
--    or product_name = 'Product-9122b7f7ee1bb33f535f7bfa890b1378';
--
-- select *
-- from pg_index;

