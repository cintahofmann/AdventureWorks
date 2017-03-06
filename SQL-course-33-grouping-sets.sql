--GROUPING SETS

SELECT DISTINCT CustomerID, SUM(TotalDue) AS TotalAmount
FROM SalesLT.SalesOrderHeader
GROUP BY
GROUPING SETS(CustomerID, ())
ORDER BY TotalAmount DESC;

SELECT * FROM SalesLT.SalesOrderHeader;

--ROLLUP
--first, create view
CREATE VIEW SalesLT.vCustomers
AS
SELECT a.AddressID, a.AddressLine1, a.AddressLine2, a.City, a.StateProvince, 
	a.CountryRegion, c.CustomerID, c.FirstName, c.LastName, c.CompanyName
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca
ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c
ON ca.CustomerID = c.CustomerID;
--then ROLLUP
SELECT StateProvince, City, COUNT(CustomerID) AS Customers
FROM SalesLT.vCustomers
GROUP BY ROLLUP(StateProvince, City)
ORDER BY StateProvince, City;

--CUBE
SELECT CustomerID, SalesOrderID, SUM(TotalDue) AS TotalAmount
FROM SalesLT.SalesOrderHeader
GROUP BY CUBE(CustomerID, SalesOrderID)
ORDER BY CustomerID, SalesOrderID;

--GROUPING_ID
SELECT GROUPING_ID(CustomerID) AS CustomerIDGroup, GROUPING_ID(SalesOrderID) AS
	SalesOrderIDGroup, CustomerID, SalesOrderID, SUM(TotalDue) AS TotalAmount
FROM SalesLT.SalesOrderHeader
GROUP BY CUBE(CustomerID, SalesOrderID)
ORDER BY CustomerID, SalesOrderID;