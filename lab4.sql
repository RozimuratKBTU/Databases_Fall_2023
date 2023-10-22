create table employee3 (
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gender VARCHAR(50),
	email VARCHAR(50),
	date_of_birth DATE,
	country_of_birth VARCHAR(50)
);

select * from employee3 order by (first_name, last_name) desc;
select country_of_birth from employee3 order by country_of_birth asc  fetch first  5 row only;
select country_of_birth from
employee3
          where country_of_birth  like 'A%' between ;

select * from employee3 where date_of_birth  between '2022-10-01' and '2023-12-01';

select country_of_birth, count(*)
from employee3 group by count
having count(*) < 10;






create database lab4;

CREATE TABLE  warehouses (
    code INTEGER,
    location CHARACTER VARYING(255),
    capacity INTEGER
);

INSERT INTO warehouses (code, location, capacity)
VALUES
    (1, 'New York', 7),
    (2, 'Chicago', 3),
    (3, 'Chicago', 4),
    (4, 'Los Angeles',2),
    (5,'San Francisco',8);

select * from warehouses;


create table boxes(
    code character(4),
    contents character varying(255),
    value real,
    warehouse integer
);

insert into boxes (code, contents, value, warehouse)
VALUES ('F3R4', 'Scissors', 170,3),
       ('WRT3','Scissors', 190, 4),
       ('QG3H', 'Rocks', 200, 1),
       ('WJN6','Papers',75,1),
       ('RY6U', 'Papers',50,3),
       ('RJ6F', 'Papers', 175, 2),
       ('P2T6','Scissors', 125, 1),
       ('P2T6', 'Scissors', 150, 2),
       ('TU55', 'Papers', 90, 5);

SELECT * FROM  BOXES;

--5
SELECT *
FROM Boxes
WHERE warehouse in (3,5,2);

-- 6
select distinct contents from boxes ;

--7

select w.code, count(b.code) from warehouses w
left join boxes b on w.code = b.warehouse
group by w.code;

--second method
select code ,
    (select count(*) from boxes where warehouse = warehouses.code)
     from warehouses;

--8

-- select count(*) as code from warehouses where code > 2;

select * from warehouses;

select w.code , count(b.code)  from warehouses w
join boxes b on w.code = b.warehouse group by  w.code having count(b.code) > 2;

--9
insert into warehouses(code, location, capacity)
values (6, 'New York', 3);

select warehouse from boxes where watehouse = 3 ;

--10
insert into boxes(code, contents, value, warehouse)
values ('H5RT', 'Papers', 200,2);

--11
update boxes
set value = value * 0.85
where code = (select code from boxes offset 2 limit 1 )

select * from boxes;

--12
delete from boxes
where value < 150;

--13

delete from boxes
where warehouse in (select code from warehouses where location = 'New York' )

returning * ;














