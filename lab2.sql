create database lab2;

create table countries
(
    country_id serial primary key,
    country_name varchar(230),
    region_id integer,
    population integer
);
INSERT INTO countries (country_name, population)
VALUES
    ('United States', 331002651),
    ('India', 1380004385),
    ('China', 1439323776),
    ('Brazil', 212559417),
    ('Russia', 145934462);



-- UPDATE countries
-- SET country_name = 'Kazakhstan'
-- WHERE country_name IS NULL;

alter table countries
alter column country_name set default 'Kazakhtan';

insert into countries(country_name)
values (default);

INSERT INTO countries DEFAULT VALUES;

insert into countries(region_id, population)
values('2', '564556');

select * from countries;

CREATE TABLE country_news AS
SELECT * FROM countries WHERE 1 = 0;

SELECT * FROM country_news;
-- 11
insert into country_news
    select * from countries;

-- 12

update countries
set region_id = 1
where region_id IS NULL;
-- 13
update countries set population = population * 1.1;
-- 14
delete from countries where population < 100000;

delete from countries_new where countries_id in (select countries_id from countries) returning *;

DELETE FROM countries;

alter table userss
alter column gg constraint  foreign key(region_id);

insert into countries(country_name)
values ('Russia');

select * from countries;
delete from countries_new returning *;

SELECT * FROM countries;

select * from  countries where population  <1380004385;



select * from countries_new;

drop table if exists countries_new;



