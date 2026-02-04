USE practice_db;

select * from Customers;
select * from orders;
select * from Products;


-- 1) Identify pairs of customers who live in the same country
-- SELF JOIN
SELECT 
	c1.CustomerName AS Customer1,
    c2.CustomerName AS Customer2,
    c1.Country
FROM Customers c1
JOIN Customers c2
	ON c1.Country = c2.Country
	AND c1.CustomersID < c2.CustomersID;

-- 2) Find the customer who has spent the most on their orders
SELECT 
    c.CustomerName,
    SUM(p.Price) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomersID = o.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 1;

-- 3) Find customers who have ordered more than one type of products
SELECT 
    c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomersID = o.CustomerID
GROUP BY c.CustomerName
HAVING COUNT(DISTINCT o.ProductID) > 1;

-- 4) List all products and their corresponding orders, using a RIGHT JOIN, including products that have never been ordered.
SELECT 
    p.ProductID,
    p.ProductName,
    o.OrderID,
    o.OrderDate
FROM Orders o
RIGHT JOIN Products p
    ON o.ProductID = p.ProductID;

-- 5) Retrieve all orders placed by customers from the USA.
SELECT 
    o.*
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomersID
WHERE c.Country = 'USA';

-- 6) Find the names of customers who have ordered a product priced above $500.
SELECT DISTINCT
    c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomersID = o.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
WHERE p.Price > 500;

-- 7) Find customers who have ordered the same product more than once.
SELECT 
    c.CustomerName,
    o.ProductID
FROM Customers c
JOIN Orders o ON c.CustomersID = o.CustomerID
GROUP BY c.CustomerName, o.ProductID
HAVING COUNT(o.OrderID) > 1;