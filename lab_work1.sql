create database lab1
    with owner postgres;

create table userss(
    id serial primary key,
    firstname varchar(50) ,
    lastname varchar(50)
);

INSERT INTO userss (firstname, lastname)
VALUES
    ('John', 'Doe'),
    ('Jane', 'Smith'),
    ('Bob', 'Johnson');

alter table userss
add column isadmin int;

alter table userss
alter column isadmin set  data type  boolean
    using isadmin :: boolean;

alter table userss
alter column isadmin set default  false;

alter table userss
alter column id SET NOT NULL ;


ALTER TABLE userss
DROP CONSTRAINT id;


ALTER TABLE userss
ADD CONSTRAINT primary key(id, firstname);

--     constraint userss primary key(id, firstname);


select * from userss;

create table tasks(
    id serial primary key,
    name varchar(50),
    user_id int
);



drop table if exists tasks;


drop database if exists lab1;



ALTER TABLE userss add CONSTRAINT id;
ALTER TABLE table_name DROP PRIMARY KEY;