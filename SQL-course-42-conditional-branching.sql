--Simple logical test
IF 'Yes' = 'No'
PRINT 'True'
ELSE 
PRINT 'False';

--Change code based on a condition
UPDATE SalesLT.Product
SET DiscontinuedDate = GETDATE()
WHERE ProductID=1;

IF @@ROWCOUNT<1
BEGIN
	PRINT 'Product was not found'
END
ELSE
BEGIN
	PRINT 'Product updated'
END