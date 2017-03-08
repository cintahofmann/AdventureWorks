--Pivoting/Unpivoting data
SELECT * FROM SalesLT.ProductCategory
ORDER BY Name ASC;

SELECT * FROM SalesLT.vGetAllCategories;

--not right, but a start to understanding it
CREATE VIEW SalesLT.vExperiment
AS
SELECT h.SalesOrderID AS OrderID, p.ProductID, pc.Name AS Category, h.TotalDue AS Revenue
FROM SalesLT.SalesOrderHeader AS h
JOIN SalesLT.SalesOrderDetail AS d
ON h.SalesOrderID = d.SalesOrderID
JOIN SalesLT.Product AS p
ON d.ProductID = p.ProductID
JOIN SalesLT.ProductCategory AS pc
ON p.ProductCategoryID = pc.ProductCategoryID;

--see?
SELECT DISTINCT Category 
FROM SalesLT.vExperiment
ORDER BY Category ASC;

--so let's try anew
CREATE VIEW SalesLT.vBrainfart
AS
SELECT h.SalesOrderID AS OrderID, p.ProductID, vg.ParentProductCategoryName AS Category,
	h.TotalDue AS Revenue
FROM SalesLT.SalesOrderHeader AS h
JOIN SalesLT.SalesOrderDetail AS d
ON h.SalesOrderID = d.SalesOrderID
JOIN SalesLT.Product AS p
ON d.ProductID = p.ProductID
JOIN SalesLT.ProductCategory AS pc
ON p.ProductCategoryID = pc.ProductCategoryID
LEFT JOIN SalesLT.vGetAllCategories AS vg
ON pc.ProductCategoryID = vg.ProductCategoryID;

SELECT * FROM SalesLT.vBrainfart;

SELECT DISTINCT Category 
FROM SalesLT.vBrainfart;
--looking good!!! :-)

--so here we go with the pivot
SELECT OrderID, Bikes, Accessories, Clothing, Components
FROM
	(SELECT OrderID, Category, Revenue FROM SalesLT.vBrainfart) AS sales
PIVOT (SUM(Revenue) FOR Category IN([Bikes], [Accessories], [Clothing], 
	[Components])) AS pvt

--then unpivot
SELECT OrderID, Category, Revenue
FROM
	(SELECT OrderID, Bikes, Accessories, Clothing, Components 
	FROM SalesLT.vBrainfart) AS pvt
UNPIVOT (Revenue FOR Category IN([Bikes],[Accessories],[Clothing],[Components])) 
	AS unpvt;

--?