create table Cats(
    name varchar(40),
    shop_id int
);

create table shops(
    shopname varchar(40),
    id int
);

insert into cats(name, shop_id)
values ('Vicont', 10), ('Zuza', null);

insert into shops(shopname, id)
values ('Murzilla', 3), ('Cats & Dogs', 4);

select name, shopname, shop_id, id as dd from cats c
 right join shops s on c.shop_id = s.id
where c.shop_id is null ;

