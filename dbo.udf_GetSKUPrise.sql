CREATE FUNCTION udf_GetSKUPrice (@ID_SKU INT )
    RETURNS DECIMAL(18, 2)
	BEGIN
        DECLARE @Value INT, @Quantity INT, @price DEC(18,2)
        SELECT @Value = (SELECT Value FROM dbo.Basket WHERE  ID_SKU = @ID_SKU)
		SELECT @Quantity = (SELECT Quantity FROM dbo.Basket WHERE  ID_SKU = @ID_SKU)
        SET @price= @Value/@Quantity
        RETURN @price
		END
