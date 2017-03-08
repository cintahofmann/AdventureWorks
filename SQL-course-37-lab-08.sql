--Lab 08
--Challenge 01: Retrieve Regional Sales Totals
--1: Retrieve totals for country/region and state/province

SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca
ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c
ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader AS soh
ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince;

--2: Indicate the grouping level in the results

SELECT a.CountryRegion, a.StateProvince,
IIF(GROUPING_ID(a.CountryRegion) = 1 AND GROUPING_ID(a.StateProvince) = 1, 'Total', 
	IIF(GROUPING_ID(a.StateProvince) = 1, a.CountryRegion + ' Subtotal', 
	a.StateProvince + ' Subtotal')) AS Level, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca
ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c
ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh
ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince;
--???

--3: Add a grouping leve for cities
SELECT a.CountryRegion, a.StateProvince, a.City,
CHOOSE (1 + GROUPING_ID(a.CountryRegion) + GROUPING_ID(a.StateProvince) + GROUPING_ID(a.City), a.City + ' Subtotal', a.StateProvince + ' Subtotal', a.CountryRegion + ' Subtotal', 'Total') AS Level,
SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca
ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c
ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh
ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince, a.City)
ORDER BY a.CountryRegion, a.StateProvince, a.City;

--02: Retrieve Customer Sales Revenue by Category
--1: Retrieve customer sales revenue for each parent category
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

SELECT OrderID, Bikes, Accessories, Clothing, Components
FROM
	(SELECT OrderID, Category, Revenue FROM SalesLT.vBrainfart) AS sales
PIVOT (SUM(Revenue) FOR Category IN([Bikes], [Accessories], [Clothing], 
	[Components])) AS pvt

SELECT * FROM
(SELECT cat.ParentProductCategoryName, cust.CompanyName, sod.LineTotal
 FROM SalesLT.SalesOrderDetail AS sod
 JOIN SalesLT.SalesOrderHeader AS soh ON sod.SalesOrderID = soh.SalesOrderID
 JOIN SalesLT.Customer AS cust ON soh.CustomerID = cust.CustomerID
 JOIN SalesLT.Product AS prod ON sod.ProductID = prod.ProductID
 JOIN SalesLT.vGetAllCategories AS cat ON prod.ProductcategoryID = cat.ProductCategoryID) 
	AS catsales
PIVOT (SUM(LineTotal) FOR ParentProductCategoryName IN ([Accessories], [Bikes], 
	[Clothing], [Components])) AS pivotedsales
ORDER BY CompanyName;