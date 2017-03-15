--Demo: Variables

--Search by city using a variable
DECLARE @City VARCHAR(20)='Toronto'
SET @City='Bellevue'

--GO doesn't work here, whole thing has to be executed as one otherwise it doesn't
--recognise '@City' down below

SELECT FirstName+' '+LastName AS [Name],AddressLine1 AS Address,City
FROM SalesLT.Customer AS C
JOIN SalesLT.CustomerAddress AS CA
ON C.CustomerID = CA.CustomerID
JOIN SalesLT.Address AS A
ON CA.AddressID = A.AddressID
WHERE City=@City

--Use a variable as an output
DECLARE @Result money
SELECT @Result=MAX(TotalDue)
FROM SalesLT.SalesOrderHeader

PRINT @Result