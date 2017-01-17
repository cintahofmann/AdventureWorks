-- NULL numbers = 0
SELECT Name, ISNULL(TRY_CAST(Size AS INTEGER),0) AS NumericSize
FROM SalesLT.Product;

-- NULL strings = black string
SELECT ProductNumber, ISNULL(Color, '') + ', ' + ISNULL(Size, '')
	AS ProductDetails
FROM SalesLT.Product;

-- Multi color = NULL
SELECT Name, NULLIF(Color, 'Multi') AS SingleColor
FROM SalesLT.Product;

-- find first non-null date
SELECT Name, COALESCE(DiscontinuedDate, SellEndDate, 
	SellStartDate) AS LastActivity
FROM SalesLT.Product;

-- Searched Case
SELECT Name,
		CASE
			WHEN SellEndDate IS NULL THEN 'On Sale'
			ELSE 'Discontinued'
		END AS SalesStatus
FROM SalesLT.Product;

--simple case
SELECT Name,
		CASE Size
			WHEN 'S' THEN 'Small'
			WHEN 'M' THEN 'Medium'
			WHEN 'L' THEN 'Large'
			WHEN 'XL' THEN 'Extra-Large'
			ELSE ISNULL(Size, 'n/a')
		END AS ProductSize
	FROM SalesLT.Product;