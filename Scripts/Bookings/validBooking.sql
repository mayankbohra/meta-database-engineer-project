DROP PROCEDURE IF EXISTS validBooking;

DELIMITER //

CREATE PROCEDURE validBooking(IN bookingDate DATE, IN tableNumber INT, IN customerID INT)
BEGIN
	DECLARE bookingCount INT DEFAULT 0;
    START TRANSACTION;
    
    SELECT COUNT(*) INTO bookingCount
    FROM bookings
    WHERE date = bookingDate AND table_number = tableNumber;
    
    INSERT INTO bookings(date, table_number, customer_id) VALUES(bookingDate, tableNumber, customerID);
    
    IF bookingCount <> 0 THEN
		SELECT CONCAT("Table ", tableNumber, " is already booked") AS "Booking Status";
        ROLLBACK;
	ELSE
		COMMIT;
	END IF;
END//

DELIMITER ;
CALL validBooking("2023-03-25",5,6)