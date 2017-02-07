--Lab06: Using Subqueries and APPLY

--Challenge 01: Retrieve product price information
--1: Retrieve products whose list price is higher than the average unit price
SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE Listprice >
(SELECT AVG(UnitPrice)
FROM SalesLT.SalesOrderDetail)
ORDER BY ListPrice DESC;

--2: Retrieve products with a list price of $100 or more that have been sold for less
--than $100
SELECT ProductID, Name, ListPrice 
FROM SalesLT.Product
WHERE ProductID IN
(SELECT ProductID from SalesLT.SalesOrderDetail
 WHERE UnitPrice < 100.00)
AND ListPrice >= 100.00
ORDER BY ProductID;

--3: Retrieve the cost, list price, and average selling price for each product
SELECT ProductID, Name, StandardCost, ListPrice,
	(SELECT AVG(UnitPrice)
	 FROM SalesLT.SalesOrderDetail AS SOD
	 WHERE P.ProductID = SOD.ProductID) AS AvgSellingPrice
FROM SalesLT.Product AS P
ORDER BY P.ProductID;

--4: Retrieve products that have an average selling price that is lower than the cost
SELECT ProductID, Name, StandardCost, ListPrice,
(SELECT AVG(UnitPrice)
 FROM SalesLT.SalesOrderDetail AS SOD
 WHERE P.ProductID = SOD.ProductID) AS AvgSellingPrice
FROM SalesLT.Product AS P
WHERE StandardCost >
(SELECT AVG(UnitPrice)
 FROM SalesLT.SalesOrderDetail AS SOD
 WHERE P.ProductID = SOD.ProductID)
ORDER BY P.ProductID;

--Challenge02: Retrieve customer information
--1: Retrieve customer information for all sales orders
SELECT SOH.SalesOrderID, SOH.CustomerID, SOH.TotalDue,C.FirstName, C.LastName
FROM SalesLT.SalesOrderHeader AS SOH
CROSS APPLY dbo.ufnGetCustomerInformation(SOH.CustomerID) AS C
ORDER BY SOH.SalesOrderID;

--2: Retrieve customer address information
SELECT CA.CustomerID, C.FirstName, C.LastName, A.AddressLine1, A.City
FROM SalesLT.CustomerAddress AS CA
JOIN SalesLT.Address AS A
ON CA.AddressID = A.AddressID
CROSS APPLY dbo.ufnGetCustomerInformation(CA.CustomerID) AS C
ORDER BY CA.CustomerID;