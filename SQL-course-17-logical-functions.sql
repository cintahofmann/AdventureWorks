--Video examples
SELECT ProductID, ListPrice, IIF(ListPrice > 50, 'high','low') AS PricePoint
FROM SalesLT.Product;

SELECT Name, Color, Size,
	CHOOSE(ProductCategoryID, 'Bikes','Components','Clothing','Accessories') AS
	Category
FROM SalesLT.Product;
--doesn't work because CategoryID would need to be 1, 2, 3, 4
SELECT ProductCategoryID FROM SalesLT.Product;

--DEMO Logical Functions
SELECT Name, Size AS NumericSize
FROM SalesLT.Product
WHERE ISNUMERIC(Size) = 1;
--1=boolean, true

SELECT Name, IIF(ProductCategoryID IN (5,6,7),'Bike','Other') ProductType
FROM SalesLT.Product;
--if it's 5,6,7, display bike, else 'other'

SELECT Name, IIF(ISNUMERIC(Size) =1, 'Numeric','Non-Numeric') SizeType
FROM SalesLT.Product;

SELECT prd.Name AS ProductName, cat.Name AS Category,
	CHOOSE (cat.ParentProductCategoryID,'Bikes','Components','Clothing',
	'Accessories') AS ProductType
FROM SalesLT.Product AS prd
JOIN SalesLT.ProductCategory as cat
ON prd.ProductCategoryID = cat.ProductCategoryID;