--Demo: Creating UNION Queries
SELECT EmployeeName, 'Employee' AS Type
FROM SalesLT.Employee
UNION ALL
SELECT FirstName + ' ' + LastName, 'Customer' 
FROM SalesLT.Customer;
--(didn't go well with what had been suggested)

SELECT * FROM SalesLT.Employee;