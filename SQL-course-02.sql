SELECT SalesOrderID, COUNT(OrderQty)
FROM SalesLT.SalesOrderDetail
WHERE OrderQty > 1
GROUP BY SalesOrderID
ORDER BY SalesOrderID ASC;