--DEMO: Aggregate Functions
SELECT COUNT(*) AS Products, COUNT(DISTINCT ProductCategoryID) AS Categories,
	AVG(ListPrice) AS AveragePrice
FROM SalesLT.Product;

SELECT COUNT(DISTINCT p.ProductID) BikeModels, AVG(p.ListPrice) AveragePrice
FROM SalesLT.Product AS p
JOIN SalesLT.ProductCategory AS c
ON p.ProductCategoryID = c.ProductCategoryID
WHERE c.Name LIKE '%Bikes';