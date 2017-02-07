--Demo: Using correlated subqueries
--For each customr list all sales on the last day they made a sale

SELECT CustomerID, SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader AS SO1
ORDER BY CustomerID, OrderDate

SELECT CustomerID, SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader AS SO1
WHERE OrderDate = 
(SELECT MAX(OrderDate)
FROM SalesLT.SalesOrderHeader)

SELECT CustomerID, SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader AS SO1
WHERE OrderDate = 
(SELECT MAX(OrderDate)
FROM SalesLT.SalesOrderHeader AS SO2
WHERE SO2.CustomerID = SO1.CustomerID)
ORDER BY CustomerID