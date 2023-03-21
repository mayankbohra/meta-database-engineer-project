DROP PROCEDURE IF EXISTS updateBooking

DELIMITER //

CREATE PROCEDURE updateBooking(IN bookingID INT, IN bookingDate DATE)
	BEGIN
		UPDATE bookings
        SET date = bookingDate
		WHERE booking_id = bookingID;
        
        SELECT CONCAT("Booking ", bookingID, "updated") AS "confirmation";
	END//

DELIMITER ;
CALL updateBooking(6, "2023-04-01");