--Display a list of products whose list price is higher than the hi

SELECT MAX(UnitPrice) AS MaxPrice
FROM SalesLT.SalesOrderDetail

SELECT * FROM SalesLT.Product
WHERE ListPrice > 1466.01

SELECT * FROM SalesLT.Product
WHERE ListPrice >
(SELECT MAX(UnitPrice) FROM SalesLT.SalesOrderDetail)
--bring me back all the details of the products table for any product that has a list
--price that's higher than whatever the maximum price of something we've ever sold is.