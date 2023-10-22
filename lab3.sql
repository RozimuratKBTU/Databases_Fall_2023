create table category(
    id serial primary key,
    name varchar(200)
);

insert into category (name)
values ('Category 1'),
       ('Category 2'),
       ('Category 3'),
       ('Category 4');


select * from category;

alter sequence category_id_seq  --id начинается на этого число
    restart with 10;

alter sequence category_id_seq  -- increment сделает
    increment 3;

select nextval('category_id_seq'); --показывает следуюший инкремент б ну смотря чего
select currval('category_id_seq');

create table test_char(
    vchar_test varchar(10),
    char_test char(10)
);

insert into test_char(vchar_test, char_test)
values ('qwerty1234', 'qwerty1234');

select * from test_char;

insert into test_char (vchar_test, char_test)
VALUES ('qwerty', 'qwerty');


create table products(
    product_id int ,
    price decimal(10,2),
    title varchar(200),
    quantity int not null,
    category_id int not null,
    primary key(product_id)
);

insert into products(price, title, quantity, category_id)
values ( null,100.00, 'Product 1', 7, 1);

insert into products(price, title)
values(100, 'Product 2');

insert into products default
values;

insert into products(title, price, quantity, category_id)

select title, price, quantity, category_id
from products
where product_id = 1;

INSERT INTO products (product_id,price, title, quantity, category_id)
VALUES (1, 3,'Product 1', 7, 2);

update products
set title='New Product 1',
    quantity=0,
    category_id=1
where title is null;

select * from products;

update products
set (title, quantity, category_id) = (select 'New Product 1', quantity, category_id
                                      from products where product_id = 1)
where quantity is null;

update category
set name = 'Coke Category'
where id in (select category_id from products where title = 'Product 1');

select * from category;

update category as c
set name = 'Coke Category'
from products as p
where p.title = 'Coke'
and p.category_id = c.id;

delete from category as c
using products p
where p.title = 'Coke'
and p.category_id = c.id;

alter table products
    add constraint products_category_fkey
        foreign key (category_id)
references category (id) on delete set null;

select * from products;

select *
from category;

delete from products
where category_id = 2
returning *;

