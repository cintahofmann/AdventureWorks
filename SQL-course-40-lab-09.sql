--lab 09
--Challenge 01: Inserting Products
--1: Insert a product

SELECT * FROM SalesLT.Product;

INSERT INTO SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice,
	ProductCategoryID, SellStartDate)
VALUES
('LED Lights','LT-L123',2.56,12.99,37,GETDATE());

SELECT SCOPE_IDENTITY();

--2: Insert a new category with two products

SELECT * FROM SalesLT.ProductCategory;

INSERT INTO SalesLT.ProductCategory (ParentProductCategoryID, Name)
VALUES
(4,'Bells and Horns');

--ProductCategoryID 42
INSERT INTO SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice,
	ProductCategoryID, SellStartDate)
VALUES
('Bicycle Bell','BB-RING',2.47,4.99,42,GETDATE()),
('Bicycle Horn','BB-PARP',1.29,3.75,42,GETDATE());

SELECT c.Name As Category, p.Name AS Product
FROM SalesLT.Product AS p
JOIN SalesLT.ProductCategory as c ON p.ProductCategoryID = c.ProductCategoryID
WHERE p.ProductCategoryID = IDENT_CURRENT('SalesLT.ProductCategory');

SELECT * FROM SalesLT.Product;

--02: Updating Products
--1: Update product prices
SELECT * FROM SalesLT.Product;

UPDATE SalesLT.Product
SET ListPrice = (ListPrice * 1.1)
WHERE ProductCategoryID = 42;

--2: Discontinue Products
SELECT * FROM SalesLT.Product
WHERE ProductCategoryID = 37
ORDER BY ModifiedDate DESC;

UPDATE SalesLT.Product
SET DiscontinuedDate = GETDATE()
WHERE ProductCategoryID = 37 AND ModifiedDate < DATEADD(dd,-1,GETDATE());

--03: Deleting Products
--1: Delete a product category and its products
SELECT * FROM SalesLT.Product
WHERE ProductCategoryID = 42;

DELETE FROM SalesLT.Product
WHERE ProductCategoryID = 42;

SELECT * FROM SalesLT.ProductCategory
WHERE ProductCategoryID = 42;

DELETE FROM SalesLT.ProductCategory
WHERE ProductCategoryID = 42;