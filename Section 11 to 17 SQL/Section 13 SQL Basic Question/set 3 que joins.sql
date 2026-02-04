USE practice_db;

-- Create the customers table
CREATE TABLE Customers (
	CustomersID INT Primary Key,
	CustomerName varchar(50),
	Country varchar(50)
);
-- Insert data into customers table
INSERT INTO Customers (CustomersID, CustomerName, Country)
VALUES
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'USA'),
(5, 'Eve', 'Australia');

-- Create the order table
create table orders (
	OrderID INT PRIMARY KEY,
	CustomerID INT,
	OrderDate DATE,
	ProductID INT,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomersID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ProductID)
VALUES 
(101, 1, '2024-08-01', 1001),
(102, 1, '2024-08-03', 1002),
(103, 2, '2024-08-04', 1001),
(104, 3, '2024-08-05', 1003),
(105, 5, '2024-08-06', 1004);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1001, 'Laptop', 1000),
(1002, 'Smartphone', 700),
(1003, 'Tablet', 500),
(1004, 'Headphones', 200),
(1005, 'Smartwatch', 300);


select * from Customers

select * from Orders

select * from Products

---- QUESTIONS:


--1) Write an SQL query to find the names of customers who have placed an order.
select distinct(CustomerName) from Customers c
inner join orders o
on c.CustomersID = o.CustomerID;

--2) Find the list of customers who have not placed any orders.
select distinct(CustomerName) from Customers C LEFT join orders O
ON C.CustomersID = O.CustomerID
Where O.OrderID is NULL


--3) List all orders along with the product name and price.
select distinct P.ProductName,P.Price from orders O JOIN Products P
ON O.ProductID = P.ProductID

--4) Find the names of customers and their orders, including customers who haven't placed any orders.
select distinct C.CustomerName, O.OrderID from Customers C LEFT JOIN orders O
ON C.CustomersID = O.CustomerID;


--5) Retrieve a list of products that have never been ordered.
select distinct P.ProductID, ProductName from Products P LEFT JOIN orders O
ON O.ProductID = P.ProductID
where O.OrderID is NULL;

select distinct * from Products p left join Orders o on p.ProductID = o.ProductID where o.OrderDate is null

--6) Find the total number of orders placed by each customer.
select customername,count(orderid) [Number of Orders] from Customers c inner join Orders o on c.CustomersID = o.CustomerID
group by customername
--OR
select customername,count(orderid) [Number of Orders] from Customers c LEFT join Orders o on c.CustomersID = o.CustomerID
group by customername


--7) Display the customers, the products they've ordered, and the order date. Include customers who haven't placed any orders.
select distinct CustomerName,p.ProductID,ProductName,OrderDate
from Customers c left join Orders o on c.CustomersID = o.CustomerID left join Products p on o.ProductID = p.ProductID
