--Basic inner join
SELECT SalesLT.Product.Name AS ProductName, SalesLT.ProductCategory.Name
	AS Category
FROM SalesLT.Product
INNER JOIN SalesLT.ProductCategory
ON SalesLT.Product.ProductCategoryID =
	SalesLT.ProductCategory.ProductCategoryID;

--Table aliases
SELECT p.Name AS ProductName, c.Name AS Category
FROM SalesLT.Product AS p
JOIN SalesLT.ProductCategory AS c
ON p.ProductCategoryID = c.ProductCategoryID;

--Joining more than 2 tables
SELECT oh.OrderDate, oh.SalesOrderNumber, p.Name AS ProductName, 
	od.OrderQty, od.UnitPrice, od.LineTotal
FROM SalesLT.SalesOrderHeader AS oh
JOIN SalesLT.SalesOrderDetail AS od
ON od.SalesOrderID = oh.SalesOrderID
JOIN SalesLT.Product AS p
ON od.ProductID = p.ProductID
ORDER BY oh.OrderDate, oh.SalesOrderID, od.SalesOrderDetailID;

--Multiple join predicates
SELECT oh.OrderDate, oh.SalesOrderNumber, p.Name AS ProductName, 
	od.OrderQty, od.UnitPrice, od.LineTotal
FROM SalesLT.SalesOrderHeader AS oh
JOIN SalesLT.SalesOrderDetail AS od
ON od.SalesOrderID = oh.SalesOrderID
JOIN SalesLT.Product AS p
ON od.ProductID = p.ProductID AND od.UnitPrice < p.ListPrice
--Note multiple predicates
ORDER BY oh.OrderDate, oh.SalesOrderID, od.SalesOrderDetailID;

SELECT p.Name AS ProductName, UnitPrice, ListPrice
FROM SalesLT.SalesOrderDetail AS od
JOIN SalesLT.Product AS p
ON od.ProductID = p.ProductID
ORDER BY p.ProductID;