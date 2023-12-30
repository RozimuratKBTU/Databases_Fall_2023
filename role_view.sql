create database lab8
       with owner postgres;

select * from users;
select * from ORDERS;

create view users_view as
    select username, email
from users
where username like '2%2';
select * from users_view;

create view users_orders_view as
    select username, email, order_id, product_name
from users u
    join orders o on u.id = o.user_id
where username like '2%2'
and product_name like '%a';

select * from users_orders_view;


create or replace view users_child_view as
    select *, upper(username)
from users_view
where email like 'e%example.com'
with cascaded check option;

select * from users_child_view;

insert into users_child_view (username, email)
values ('2335d9b3d95fd81bcc6c558c6117ab32', 'e18a576cab7bd84bc199f8730c4856bc@example.com');


insert into users (username, email)
values ('2335d9b3d95fd81bcc6c558c6117ab32', 'e18a576cab7bd84bc199f8730c4856bc@example.com');

create or replace view users_view as
select username, email, date_joined
from users
where username like '2%2';

select *
from users_view;

--TODO:  We will finished View;
-- New Topic Roles

drop role new_role;
create role my_role;
create role new_role login;
create role new_role login password 'qwerty';
create role new_role superuser;

alter role new_role createdb nosuperuser nologin;

grant new_role to my_role;
grant my_role to new_role;

grant privileges    
