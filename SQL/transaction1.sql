delimiter //

DROP PROCEDURE IF EXISTS pay;//

CREATE PROCEDURE pay ()
	BEGIN
		DECLARE exit handler for sqlexception BEGIN ROLLBACK; END;
		DECLARE exit handler for sqlwarning BEGIN ROLLBACK; END;
        SET @CustomerID = 2;
		SET @ProductID = 2;
		SET @Items = 2;
		SET @VariantSize = 'M';
        START TRANSACTION;
			SELECT * FROM customer WHERE id = @CustomerID;
			SELECT @variantID:=id , @price:=price FROM variant WHERE product_id = @ProductID AND size = @VariantSize AND variant.item > 0;
			INSERT INTO orders SET customer_id = @CustomerID, product_id = @ProductID, variant_id = @variantID, items = @Items, total_price = @price*@Items;
			UPDATE customer SET money = money - @price WHERE id = @CustomerID;
		COMMIT;
	END;
// 




