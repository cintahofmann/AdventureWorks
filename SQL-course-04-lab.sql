--1st Challenge
SELECT * FROM SalesLT.Customer;

SELECT Title, FirstName, MiddleName, LastName, Suffix
	FROM SalesLT.Customer;

SELECT SalesPerson, Title + ' ' + LastName AS CustomerName, 
	Phone FROM SalesLT.Customer;

--2nd Challenge
--Retrieve a list of customer companies
SELECT CAST(CustomerID AS varchar(2)) + ': ' AS CustomerID,
	 CompanyName
FROM SalesLT.Customer;

--Retrieve a list of sales order revisions
SELECT * FROM SalesLT.SalesOrderHeader;

SELECT SalesOrderNumber + '(' + STR(RevisionNumber, 1) + ')' 
	AS SalesOrderRevisions, CONVERT(nvarchar(30), OrderDate, 102)
	AS OrderDate
FROM SalesLT.SalesOrderHeader;

--3rd Challenge
--Retrieve Customer contact names with middle names if known
SELECT * FROM SalesLT.Customer;

SELECT FirstName + ' ' + ISNULL(MiddleName + ' ', '') + 
	LastName AS CustomerName
FROM SalesLT.Customer;

--Retrieve primary contact details
UPDATE SalesLT.Customer
SET EmailAddress = NULL
WHERE CustomerID % 7 = 1;

SELECT CustomerID, COALESCE(EmailAddress, Phone) AS 
	PrimaryContact
FROM SalesLT.Customer;

--Retrieve shipping status
SELECT * FROM SalesLT.SalesOrderHeader;

UPDATE SalesLT.SalesOrderHeader
SET ShipDate = NULL
WHERE SalesOrderID > 71899;

SELECT SalesOrderID, OrderDate,
	CASE
		WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
		ELSE 'Shipped' 
	END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;