--Call each customer once per product
SELECT p.Name, c.FirstName, c.LastName, c.Phone
FROM SalesLT.Product AS p
CROSS JOIN SalesLT.Customer AS c;