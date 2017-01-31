--Demo: Creating INTERSECT and EXCEPT Queries
SELECT SalesOrderID
FROM SalesLT.SalesOrderHeader
INTERSECT
SELECT SalesOrderID
FROM SalesLT.SalesOrderDetail
ORDER BY SalesOrderID DESC;

--because video example does not work:

SELECT FirstName, LastName
FROM SalesLT.Customers
INTERSECT
SELECT FirstName, LastName
FROM SalesLT.Employees;

--Except queries
SELECT CustomerID
FROM SalesLT.Customer
EXCEPT
SELECT CustomerID
FROM SalesLT.SalesOrderHeader
ORDER BY CustomerID DESC;

--original Demo:
SELECT FirstName, LastName
FROM SalesLT.Customers
EXCEPT 
SELECT FirstName, LastName
FROM SalesLT.Employees;

--obviously does not work :-) because this course is up to date :-)