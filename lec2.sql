create database lab1
    with owner postgres;

create table users2(
    id serial primary key,
    firstname varchar(50) ,
    lastname varchar(50)
);

INSERT INTO users2 (firstname, lastname)
VALUES
    ('John', 'Doe'),
    ('Jane', 'Smith'),
    ('Bob', 'Johnson');



alter table users2
add column isadmin int;

-- update users2 set isadmin = 0;
insert into  users2  (isadmin)
values (0);

UPDATE users2
SET isadmin = true
WHERE id = 2;

alter table users2s
    add constraint pk_u unique (id);

alter table users2
alter column isadmin set  data type  boolean
    using isadmin :: boolean;


alter table userss
alter column isadmin set default  false;

alter table users2
alter column id SET NOT NULL ;
--     constraint userss primary key(id, firstname);



alter table users2
alter column
select * from users2;

create table tasks(
    id serial primary key,
    name varchar(50),
    user_id int
);

ALTER TABLE users2
ADD CONSTRAINT pk_u PRIMARY KEY (id);


drop table if exists tasks;
drop database if exists lab1;


CREATE TABLE cos (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(255) DEFAULT 'Kazakhstan',
    region_id INT
);

select * from cos;





