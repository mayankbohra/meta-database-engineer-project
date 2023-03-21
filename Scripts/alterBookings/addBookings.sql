DROP PROCEDURE IF EXISTS addBooking

DELIMITER //

CREATE PROCEDURE addBooking(IN bookingID INT, IN customerID INT, IN tableNumber INT, IN bookingDate DATE)
	BEGIN
		INSERT INTO bookings (booking_id, date, table_number, customer_id)
        VALUES (bookingID, customerID, tableNumber, bookingDate);
        
        SELECT "New bookings added successfully" AS "Confirmation";
	END //

DELIMITER ;
CALL addBooking(4, 5, 7, "2023-04-01");
