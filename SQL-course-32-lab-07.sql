--Lab 07: Using table expressions
--Challenge 01: Retrieve product information

--1: Retrieve product model descriptions
SELECT * FROM SalesLT.Product;
--has ProductID, Name

SELECT * FROM SalesLT.vProductModelCatalogDescription;
--has ProductModelID, Model name, Summary

SELECT p.ProductID, p.Name AS ProductName, vp.Name AS ProductModelName, vp.Summary AS
	ProductModelSummary
FROM SalesLT.Product AS p
JOIN SalesLT.vProductModelCatalogDescription AS vp
ON p.ProductModelID = vp.ProductModelID;

--2: Create a table of distinct colors
DECLARE @Colors AS TABLE (Color varchar(15))

INSERT INTO @Colors
SELECT DISTINCT Color FROM SalesLT.Product

SELECT ProductID, Name, Color
FROM SalesLT.Product
WHERE Color IN (SELECT Color FROM @Colors);

--3: Retrieve product parent categories
SELECT C.ParentProductCategoryName AS ParentCategory,
       C.ProductCategoryName AS Category,
       P.ProductID, P.Name AS ProductName
FROM SalesLT.Product AS P
JOIN dbo.ufnGetAllCategories() AS C
ON P.ProductCategoryID = C.ProductCategoryID
ORDER BY ParentCategory, Category, ProductName;

SELECT * FROM dbo.ufnGetAllCategories();

--Challenge 02: Retrieve Customer Sales Revenue
--1: Retrieve sales revenue by customer and contact

SELECT CompanyName + ' ' + '(' + FirstName + ' ' + LastName + ')' AS CompanyContacts, 
	CAST(TotalRevenue AS decimal(10,2)) AS Revenue
FROM
	(SELECT oh.TotalDue AS TotalRevenue, c.CompanyName, c.FirstName, c.LastName
	FROM SalesLT.SalesOrderHeader AS oh
	JOIN SalesLT.Customer AS c
	ON oh.CustomerID = c.CustomerID) AS CompanyInfo
ORDER BY CompanyContacts;