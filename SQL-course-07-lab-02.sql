--Lab #2
--Challenge 1: Retrieve Data for Transportation Reports

--1 Retrieve a list of cities
SELECT DISTINCT City, StateProvince
FROM SalesLT.Address;

--2 Retrieve the heaviest products
SELECT * FROM SalesLT.Product;

SELECT TOP 10 WITH TIES Name, Weight
FROM SalesLT.Product
WHERE Weight IS NOT NULL
ORDER BY Weight DESC;

--3: Retrieve the heaviest 100 products not including the 
--heaviest 10
SELECT Name, Weight
FROM SalesLT.Product
ORDER BY Weight DESC
OFFSET 10 ROWS
FETCH FIRST 100 ROWS ONLY;

--Challenge 2: Retrieve Product Data
--1: Retrieve product details for product model 1
SELECT Name, Color, Size
FROM SalesLT.Product
WHERE ProductModelID = 1;

--2: Filter products by color and size
SELECT ProductID, Name, Color, Size
FROM SalesLT.Product
WHERE Color IN ('Black', 'Red', 'White') AND 
	SIZE IN ('S', 'M');

--3: Filter products by product number
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%';

--4: Retrieve specific products by product number
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';