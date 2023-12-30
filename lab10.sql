create database lab10
       with owner postgres;

CREATE TABLE Books (
  book_id INT PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255),
  price DECIMAL(10, 2),
  quantity INT
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  book_id INT,
  customer_id INT,
  order_date DATE,
  quantity INT,
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
);

INSERT INTO Books (book_id, title, author, price, quantity) VALUES
(1, 'Database 101', 'A. Smith', 40.00, 10),
(2, 'Learn SQL', 'B. Johnson', 35.00, 15),
(3, 'Advanced DB', 'C. Lee', 50.00, 5);
INSERT INTO Books (book_id, title, author, price, quantity) VALUES
(4, 'SQL Fundamentals', 'D. Brown', 30.00, 8),
(5, 'Database Design', 'E. Davis', 45.00, 12),
(6, 'Mastering SQL', 'F. Garcia', 55.00, 7);

INSERT INTO Customers (customer_id, name, email) VALUES
(101, 'John Doe', 'johndoe@example.com'),
(102, 'Jane Doe', 'janedoe@example.com');
INSERT INTO Customers (customer_id, name, email) VALUES
(103, 'Alice Smith', 'alicesmith@example.com'),
(104, 'Bob Johnson', 'bobjohnson@example.com');


INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
VALUES (2, 1, 101, '2022-12-12', 2);
INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
VALUES
(3, 2, 101, '2023-01-15', 3),
(4, 3, 102, '2023-02-20', 5),
(5, 1, 102, '2023-03-10', 1);

INSERT INTO Orders (order_id,book_id, customer_id, order_date, quantity)
VALUES (1,3, 102, '2023-11-10', 10)
select * from orders;

-- 1
BEGIN TRANSACTION;
UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 2;
COMMIT;
select * from books;


-- task 2
begin;
do $$
    <<first_block>>
begin
declare
    available_quantity integer;
begin select quantity into available_quantity
      from Books where book_id = 3;
if available_quantity < 10 then raise exception 'Insufficient';
end if;
end;
update Books
set quantity = quantity - 10 where book_id = 3;
end first_block $$;
commit;
select * from Books;











--3
-- FIRST SESSION
-- Start a transaction at READ COMMITTED isolation level

START TRANSACTION ISOLATION LEVEL READ COMMITTED;


-- Update the price of a book in the Books table
UPDATE Books
SET price = 45.00
WHERE book_id = 1;

-- Commit the transaction
COMMIT;

-- Start another transaction at READ COMMITTED isolation level
START TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Read the price of the same book
SELECT price
FROM Books
WHERE book_id = 1;

-- Commit the transaction
COMMIT;

SELECT * FROM BOOKS;


--4


-- Step 1: Start a transaction and update a customer's email
BEGIN TRANSACTION;
UPDATE Customers
SET email = 'JOHNemail@example.com'
WHERE customer_id = 102;

-- Step 2: Commit the transaction
COMMIT;

-- Step 3: Check the Customers table for the update
SELECT * FROM Customers WHERE customer_id = 102;






