DROP PROCEDURE IF EXISTS deleteBooking

DELIMITER //

CREATE PROCEDURE deleteBooking(IN bookingID INT)
	BEGIN
		DELETE FROM bookings
        WHERE booking_id = bookingID;
	END //
    
DELIMITER ;
CALL deleteBooking(6);