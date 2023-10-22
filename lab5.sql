create database lab5
with owner postgres;

create table customers(
    customer_id int primary key check(customer_id >= 1000 and customer_id <= 9999),
    cust_name varchar(400),
    city varchar(50),
    grade integer check(grade >= 100 and grade <= 999),
    salesman_id integer check(salesman_id >= 1000 and salesman_id <= 9999)
);

insert into customers(customer_id, cust_name , city, grade , salesman_id )
values (3009, 'Geoff Camero', 'Berlin', 100, 5003),
        (3008, 'Julian Green', 'London', 300, 5002);

select * from orders;

create table orders(
    ord_no int primary key check(ord_no >= 70000 and ord_no <= 79999),
    purch_amt float,
    ord_date varchar(50),
    customer_id integer check(customer_id >= 1000 and customer_id <= 9999),
    salesman_id integer check(salesman_id >= 1000 and salesman_id <= 9999)
);

insert into orders(ord_no, purch_amt , ord_date, customer_id , salesman_id )
values (70008, 5760, '2012-09-10 ', 3002, 5001);

create table salesman(
    salesman_id int primary key check(salesman_id >= 1000 and salesman_id <= 9999),
    name varchar(47),
    city varchar(50),
    comission float check(comission>= 0 and comission < 1)

);

insert into salesman(salesman_id, name , city , comission )
values (5007, 'Paul Adam','Rome', 0.13);

--3
select sum(purch_amt) as purchase_amount from orders ;

--4
select avg(purch_amt) as average_purchase from orders ;

--5
select count(*) as amount_of_cus
from customers
where cust_name is not null;

--6
select min(purch_amt) as min_purchase
from orders;

--7
select * from customers
where cust_name LIKE '%n';

--8
select zakaz.* from orders zakaz
join customers klient on zakaz.customer_id = klient.customer_id
where klient.city = 'New York';

--second method

select *
from orders
where customer_id in (select customer_id from customers where city = 'New York');

--9


select * from orders;

select * from customers;

--9
select *
from customers
where customer_id in (select customer_id from orders where purch_amt> 100);


--10
SELECT SUM(grade) AS total_grade
FROM customers;

--11
select * from customers
where cust_name is not null;

---12
select max(grade) from customers;






