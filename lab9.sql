--1

create or replace function increase_value(in input_value int) returns int as $$
declare
    increased_value int;
begin
    increased_value := input_value + 10;
    return increased_value;
    end;
    $$ language plpgsql;

select increase_value(5);

--2
drop function compare_numbers;
create or replace function compare_numbers(in a integer, in b integer, out cc int)
as $$
declare
    result varchar;
begin
    if a > b then
        result := a;
    elsif a = b then
        result := a;
    else
        result := b;
    end if;
--     return result;
    cc := result;
end;
    $$ language plpgsql;

drop function compare_numbers;

select  compare_numbers(4,-3);

--3

create or replace function number_series(in n integer) returns setof integer
as $$
declare
    i integer  := 1;
begin

    while i <= n loop
        return next i;
        i := i+1;
    end loop;
end;
    $$language plpgsql;

select number_series(4);

-- SECOND METHOD;
create or replace function number_series_second_method(in n integer) returns setof integer
as $$
begin
    return query select generate_series(1,n);
end;
    $$ language plpgsql;

select number_series_second_method(4);

--4

drop function  find_employee2;

CREATE OR REPLACE FUNCTION find_employee2(employee_first_name TEXT)
RETURNS TABLE (
    employee_id   INTEGER,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    email         VARCHAR(50),
    phone_number  VARCHAR(20),
    salary        INTEGER,
    department_id INTEGER
) AS $$
BEGIN
    RETURN QUERY SELECT e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.salary, e.department_id
                 FROM employees2 AS e
                 WHERE e.first_name = employee_first_name;
END;
$$ LANGUAGE plpgsql;

select find_employee2('John');

select * from employees2;



--OTHER EXAMPLE
select * from customers;

create or replace function anuar(name text) returns table
(
    customer_id integer,
    cust_name   varchar(50),
    city        varchar(50),
    grade       integer,
    salesman_id integer
)
as $$
begin
    return query select * from customers
    where customers.cust_name = name;

end;
$$ language plpgsql;

select  anuar('Nick Rimando');


--5

select * from mock_data;

create or replace function products_list(name text) returns table
(
id INT,
	Phone_names VARCHAR(50),
	price VARCHAR(50)
)
as $$
begin
    return query select * from mock_data m
    where m.Phone_name = name;
end;
    $$ language plpgsql;

select  products_list('Vanilla Beans');

--6

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary DECIMAL(10, 2),
    base_salary DECIMAL(10, 2)
);

INSERT INTO Employee (EmployeeID, Name, Salary, base_salary) VALUES
    (1, 'John Doe', 50000.00, 50000.00),
    (2, 'Jane Smith', 60000.00, 60000.00),
    (3, 'Mark Johnson', 75000.00, 75000.00);

INSERT INTO Employee (EmployeeID, Name, Salary, base_salary) VALUES
    (4, 'Emily Davis', 55000.00, 55000.00),
    (5, 'Michael Brown', 62000.00, 62000.00),
    (6, 'Sophia Wilson', 68000.00, 68000.00);

create or replace function calculate_bonus(emp_id int)
returns decimal as $$
    declare
        base_salary decimal;
        bonus_amount decimal;
    begin
        select salary into base_salary
        from employee
        where employeeID = emp_id;

        bonus_amount := base_salary * 0.1;

        return bonus_amount;
    end;
    $$ language plpgsql;



create or replace function update_salary(emp_id int)
returns void
as $$
declare
    emp_bonus decimal;
    emp_base_salary decimal;
begin

    emp_bonus := calculate_bonus(emp_id);

    update employee
    set salary = salary + emp_bonus
    where employeeID = emp_id;
end;
    $$ language plpgsql

select update_salary(1);

select * from employee;


--7
CREATE OR REPLACE FUNCTION complex_calculation(
    IN param1 INTEGER,
    IN param2 VARCHAR,
    OUT final_result VARCHAR
)
AS $$
DECLARE
    num_result INTEGER;
    str_result VARCHAR;
    nested_num INTEGER;
    nested_str VARCHAR;
BEGIN
    -- Главный блок

    -- Первый подблок
    BEGIN
--         DECLARE nested_num INTEGER;

    nested_num := param1 * 2;
    num_result := nested_num + 10;
    END;

    -- Второй подблок
    BEGIN

        nested_str := CONCAT(param2 , '  Rozimurat ');
        str_result := nested_str;
    END;

    -- Комбинирование результатов
    final_result := CONCAT('Final result: ', num_result::VARCHAR, ' | ', str_result);
END;
$$ LANGUAGE plpgsql;

select complex_calculation(1,'Abylay');

