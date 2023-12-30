create function sqr_in(in a numeric) returns numeric
as $$
begin
    return a*a;
end
$$ language plpgsql immutable ;

drop function  fmt;

select  sqr_in(2);

create function fmt(in phone text, out code text, out num text)
as $$
    begin
        if phone ~ '^[0-9]*$' and length(phone) = 10 then
            code := substr(phone,1,3);
            num := substr(phone,4);
        else
            code := NULL;
            num := NULL;
        end if;
    end;
    $$ language plpgsql immutable;


SELECT fmt('8122345497');

DO $$
    declare
        code text := (fmt('4952345497')).code;
    begin
        case code
            when '495', '499' then
                raise notice '% - Moscow' , code;
            when '812' then
                raise notice '% - Saint ', code;
            else
            raise notice '% - boshqa' , code;
        end case;
    end;
    $$;

create function reverse_while(line text) returns text
as $$
declare
    line_length constant int := length(line);
    i int := 1;
    retval text := '';
begin
    while i <= line_length
    loop
        retval := substr(line, i, 1) || retval;
        end loop;
    if i == 5
        break;
    end if;
        return retval;
end;
    $$ language plpgsql immutable strict;

select reverse_while('rozi');

do $$
declare
    s integer := 0;
begin
    for i in 1..100 loop
        s := s + i;
        continue when mod(i,10) != 0;
        raise notice 'i = %, s = %', i , s ;
    end loop;
end;

$$

create or replace function square(inout a numeric)
as $$
begin
    a := a*a;
end;
    $$ language plpgsql;

select square(4);

create or replace function sum_avg(
    variadic list numeric[],
    out total numeric,
    out average numeric
)
as $$
begin
    select into total sum(list[i])
    from generate_subscripts(list, 1) g(i);

      select into average avg(list[i])
    from generate_subscripts(list, 1) g(i);

end;
    $$language plpgsql;



select sum_avg(1,3,3,4);

create or replace function get_sum(a integer,
                                   b integer,
                                   out sum integer)
as
$$
begin
    sum = a + b;
end;
$$
    language plpgsql;

select get_sum(2,4);


create or replace function  get_rental_duration (p_customer_id integer)
    returns integer as $$
declare
    rental_duration integer;
begin
    select into rental_duration sum(extract(day from return_date - rental_date))
    from customers
    where salesman_id = customer_id;

    return rental_duration;
end;
    $$ language plpgsql;

select *
from get_rental_duration(12 );




create function log_actor_last_name()
    returns trigger
as
$$
begin
    if old.last_name <> new.last_name then
        insert into actor_audits (actor_id, last_name, changed_on)
        VALUES (old.actor_id, old.last_name, now());
    end if;
    return new;
end;
$$
    language plpgsql;


create trigger boxes_update_trigger
    before update
    on boxes
    for each row
execute procedure log_actor_last_name();






CREATE TABLE employees_tt (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    last_updated TIMESTAMP
);

INSERT INTO employees_tt (name, salary, last_updated) VALUES
('Alice', 55000.00, '2023-11-20 09:00:00'),
('Bob', 60000.00, '2023-11-18 15:30:00'),
('Charlie', 48000.00, '2023-11-19 12:45:00');

create or replace function update_last_updated()
                  returns trigger AS $$
                begin
                  new.last_updated = NOW();
                  return new;
                  end;
                  $$ language plpgsql;

create trigger update_employee
    before update on employees_tt
    for each row
    execute function update_last_updated();

update employees_tt set salary = 60000.00 where id = 3;

select * from employees_tt;





/*,fmvkmv

 */
do $$
DECLARE
    x int := 1;
BEGIN
    <<outer_block>>
    LOOP
        RAISE NOTICE 'Outer loop: %', x;
        x := x + 1;

        <<inner_block>>
        FOR i IN 1..3 LOOP
            RAISE NOTICE 'Inner loop: %', i;
            IF i = 2 THEN
                EXIT inner_block;
            END IF;
        END LOOP inner_block;

         -- Добавлен выход из внешнего блока после завершения внутреннего блока
    END LOOP outer_block;
END;
$$ language plpgsql;












