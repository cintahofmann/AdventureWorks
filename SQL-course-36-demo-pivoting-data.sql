--DEMO: Pivoting data
SELECT * FROM
(SELECT P.ProductID, PC.Name, ISNULL(P.Color,'Uncolored') AS Color
FROM SalesLT.ProductCategory AS PC
JOIN SalesLT.Product AS P
ON PC.ProductCategoryID=P.ProductCategoryID)
AS PPC
PIVOT(COUNT(ProductID) FOR Color IN([Red],[Blue],[Black],[Silver],[Yellow],[Grey],
	[Multi],[Uncolored])) AS ProductColors
ORDER BY Name;

--Unpivot
CREATE TABLE #ProductColorPivot
(Name varchar(50), Red int, Blue int, Black int, Silver int, Yellow int, Grey int,
	multi int, uncolored int)

INSERT INTO #ProductColorPivot
SELECT * FROM
(SELECT P.ProductID, PC.Name, ISNULL(P.Color,'Uncolored') AS Color
FROM SalesLT.ProductCategory AS PC
JOIN SalesLT.Product AS P
ON PC.ProductCategoryID=P.ProductCategoryID
) AS PPC
PIVOT(COUNT(ProductID) FOR Color IN([Red],[Blue],[Black],[Silver],[Yellow],[Grey],
	[Multi],[Uncolored])) AS ProductColors
ORDER BY Name;

SELECT Name, Color, ProductCount
FROM
(SELECT Name,
[Red],[Blue],[Black],[Silver],[Yellow],[Grey],[Multi],[Uncolored]
FROM #ProductColorPivot) pcp
UNPIVOT
(ProductCount FOR Color IN([Red],[Blue],[Black],[Silver],[Yellow],[Grey],
	[Multi],[Uncolored])) AS ProductCounts