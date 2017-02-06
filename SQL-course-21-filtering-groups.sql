--Filtering groups
SELECT ProductID,SUM(sod.OrderQty) AS Quantity
FROM SalesLT.SalesOrderDetail AS sod
JOIN SalesLT.SalesOrderHeader AS soh
ON sod.SalesOrderID=soh.SalesOrderID
WHERE YEAR(soh.OrderDate)=2008
GROUP BY ProductID;
--how many of each product were sold in 2008
--now filter for qty > 50
SELECT ProductID,SUM(sod.OrderQty) AS Quantity
FROM SalesLT.SalesOrderDetail AS sod
JOIN SalesLT.SalesOrderHeader AS soh
ON sod.SalesOrderID=soh.SalesOrderID
WHERE YEAR(soh.OrderDate)=2008 AND SUM(sod.OrderQty)>50
GROUP BY ProductID;
--"AND SUM(sod.OrderQty)>50" doesn't work because an aggregate may not appear
--in a WHERE clause, needs a HAVING
--so instead:
SELECT ProductID,SUM(sod.OrderQty) AS Quantity
FROM SalesLT.SalesOrderDetail AS sod
JOIN SalesLT.SalesOrderHeader AS soh
ON sod.SalesOrderID=soh.SalesOrderID
WHERE YEAR(soh.OrderDate)=2008 
GROUP BY ProductID
HAVING SUM(sod.OrderQty)>50;