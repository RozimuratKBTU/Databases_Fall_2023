create database endterm
       with owner postgres;

-- Создание таблицы
CREATE TABLE account (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    balance DECIMAL(15, 2)
);

-- Вставка нескольких элементов
INSERT INTO account (name, balance) VALUES
('Аккаунт 1', 1000.00),
('Аккаунт 2', 500.50),
('Аккаунт 3', 750.25);

select * from account;

begin;
update account set balance = balance - 50 where id = 1;
rollback;
commit;
select * from account;

begin;
UPDATE account SET balance = balance + 30 WHERE id = 1;
savepoint my_save2;
rollback to savepoint my_save2;

rollback;
commit;
select * from account;


begin transaction isolation level serializable;
UPDATE account SET balance = balance - 20 WHERE id = 3;
commit;
select * from account;
begin transaction isolation level serializable;
UPDATE account SET balance = balance - 20 WHERE id = 3;
commit;


-- Create a table
CREATE TABLE test_table (
    id SERIAL PRIMARY KEY,
    value VARCHAR(50)
);

-- Insert some initial data
INSERT INTO test_table (value) VALUES ('Initial value');


BEGIN;
UPDATE test_table SET value = 'Updated by T2' WHERE id = 1;
COMMIT;
select * from test_table;


BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT * FROM test_table WHERE id = 1 FOR UPDATE;

UPDATE test_table SET value = 'New e' WHERE id = 1;
COMMIT;

UPDATE test_table SET value = 'Another Value' WHERE id = 1;
select * from  test_table;
commit;
rollback;



CREATE TABLE employees4 (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

INSERT INTO employees4 (name, age) VALUES ('Alice', 30);
INSERT INTO employees4 (name, age) VALUES ('Bob', 25);

CREATE VIEW young_employees AS
SELECT * FROM employees4 WHERE age < 30
WITH CHECK OPTION;

-- Эта операция будет выполнена успешно, так как новый сотрудник (id = 3) удовлетворяет условию представления
INSERT INTO young_employees (name, age) VALUES ('Charlie', 28);

-- А вот эта операция будет отклонена, так как новый сотрудник (id = 4) не удовлетворяет условию представления (его возраст 35 лет)
INSERT INTO young_employees (name, age) VALUES ('David', 35);
















