SELECT SalesLT.Customer.FirstName, SalesLT.Customer.LastName,
	SalesLT.Address.AddressLine1, SalesLT.Address.City, 
	SalesLT.Address.StateProvince
FROM SalesLT.Customer
INNER JOIN SalesLT.CustomerAddress 
	ON SalesLT.Customer.CustomerID=SalesLT.CustomerAddress.CustomerID
INNER JOIN SalesLT.Address
	ON SalesLT.CustomerAddress.AddressID=SalesLT.Address.AddressID
WHERE SalesLT.Address.StateProvince='Washington'
ORDER BY SalesLT.Address.City;