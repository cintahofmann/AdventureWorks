--WHILE statement
--DemoTable doesn't exist, so create a new one

CREATE TABLE SalesLT.DemoTable (
	DemoName varchar(15),
	DemoType varchar(15),
	DemoNumber varchar(4));

DECLARE @Counter int=1

WHILE @Counter <=5

BEGIN
	INSERT SalesLT.DemoTable(DemoType)
	VALUES ('ROW '+CONVERT(varchar(5),@Counter))
	SET @Counter=@Counter+1
END

SELECT DemoType FROM SalesLT.DemoTable;