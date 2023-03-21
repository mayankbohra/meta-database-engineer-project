DROP PROCEDURE IF EXISTS OrderCancel;

DELIMITER //

CREATE PROCEDURE OrderCancel(IN OrderID INT)
	BEGIN
		DELETE FROM orders
        WHERE order_id = OrderID;
        
        SELECT CONCAT("Order ", OrderID, " is cancelled") AS Confirmation;
    END//

DELIMITER ;
CALL OrderCancel(10);