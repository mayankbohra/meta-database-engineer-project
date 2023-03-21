DROP PROCEDURE IF EXISTS MaxQtyOrder;

CREATE PROCEDURE MaxQtyOrder()
	SELECT MAX(quantity) AS MaxQuantityInOrder
	FROM orders;

CALL MaxQtyOrder();

