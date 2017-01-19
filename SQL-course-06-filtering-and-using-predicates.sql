--List information about product model 6
SELECT Name, Color, Size
FROM SalesLT.Product
WHERE ProductModelID <> 6;

--List info about products that have a product number beginning FR
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'FR%';

--Filter previous query to ensure that product number contains
--two sets of two digits
SELECT Name, ListPrice, ProductNumber
FROM SalesLT.Product
WHERE ProductNumber LIKE 'FR-_[0-9][0-9]_-[0-9][0-9]';

--Find products that have a sell end date
SELECT Name, SellEndDate
FROM SalesLT.Product
WHERE SellEndDate IS NOT NULL;

--Find products that have a sell end date in 2006
SELECT Name, SellEndDate 
FROM SalesLT.Product
WHERE SellEndDate BETWEEN '2006/1/1' AND '2006/12/31';

--Find products that have a category ID of 5, 6, or 7
SELECT ProductCategoryID, Name, ListPrice
FROM SalesLT.Product
WHERE ProductCategoryID IN (5,6,7);

--Find products that have a category ID of 5,6,7 and sell end date
SELECT ProductCategoryID, Name, SellEndDate
FROM SalesLT.Product
WHERE ProductCategoryID IN (5,6,7) AND SellEndDate IS NULL;

--Find products that have a category ID of 5,6,7 or a product
--number that begins with FR
SELECT Name, ProductCategoryID, ProductNumber
FROM SalesLT.Product
WHERE ProductNumber LIKE 'FR%' OR ProductCategoryID IN (5,6,7);