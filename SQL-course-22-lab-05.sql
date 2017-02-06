--Lab 05: Using functions and aggregating data
--Challenge 1: Retrieve product information
--1: Retrieve the name and approximate weight of each product
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight
FROM SalesLT.Product;

SELECT ProductID, Name, Weight
FROM SalesLT.Product;

--2: Retrieve the year and month in which products were first sold
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
	YEAR(SellStartDate) AS SellStartYear, DATENAME(mm, SellStartDate) AS SellStartMonth
FROM SalesLT.Product
WHERE Weight IS NOT NULL;

--3: Extract product types from product numbers
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
	YEAR(SellStartDate) AS SellStartYear, DATENAME(mm, SellStartDate) AS SellStartMonth,
	LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product
WHERE Weight IS NOT NULL;

--4: Retrieve only products with a numeric size
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
	YEAR(SellStartDate) AS SellStartYear, DATENAME(mm, SellStartDate) AS SellStartMonth,
	LEFT(ProductNumber, 2) AS ProductType, Size AS NumericSize
FROM SalesLT.Product
WHERE Weight IS NOT NULL AND ISNUMERIC(Size)=1;

--Challenge 02: Rank customers by revenue
--1: Retrieve companies ranked by sales totals
SELECT TOP(3) c.CompanyName, soh.TotalDue,
	RANK() OVER(ORDER BY TotalDue DESC) AS RankByAmount
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS soh
ON c.CustomerID=soh.CustomerID
ORDER BY RankByAmount;

--Challenge 03: Aggregate Product Sales
--1: Retrieve total sales by product
SELECT p.Name, SUM(sod.LineTotal) AS TotalRevenue

SELECT COUNT(p.Name) AS Name, COUNT(DISTINCT sod.LineTotal) AS TotalRevenue
FROM SalesLT.Product AS p
JOIN SalesLT.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
ORDER BY TotalRevenue DESC;
--gibt keine einzelne Liste mit Daten

SELECT p.Name, SUM(sod.LineTotal) AS TotalRevenue
FROM SalesLT.Product AS p
JOIN SalesLT.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
ORDER BY TotalRevenue DESC;
--SELECT column invalid because not contained in aggregate function

SELECT Name, SUM(LineTotal) AS TotalRevenue
FROM SalesLT.Product AS p
JOIN SalesLT.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
GROUP BY p.Name
ORDER BY TotalRevenue DESC;

--2: Filter the product sales list to include only products that cost over 1,000
SELECT Name, SUM(LineTotal) AS TotalRevenue
FROM SalesLT.Product AS p
JOIN SalesLT.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
WHERE LineTotal > 1000
GROUP BY p.Name
ORDER BY TotalRevenue DESC;

--3: Filter the product sales groups to include only total sales over 20,000
SELECT Name, SUM(LineTotal) AS TotalRevenue
FROM SalesLT.Product AS p
JOIN SalesLT.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
WHERE LineTotal > 1000
GROUP BY p.Name
HAVING SUM(LineTotal) > 20000
ORDER BY TotalRevenue DESC;