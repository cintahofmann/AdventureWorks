DECLARE @Discount INT = 0;
BEGIN TRY
	UPDATE SalesLT.Product
	SET ListPrice = ListPrice / @Discount
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE();
	THROW 50001, 'An error occurred',0;
END CATCH;