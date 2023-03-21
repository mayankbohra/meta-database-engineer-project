DROP PROCEDURE IF EXISTS checkBooking;

CREATE PROCEDURE checkBooking(IN bookingDate DATE, IN tableNumber INT)
	SELECT CASE
		WHEN date = bookingDate AND table_number = tableNumber
			THEN CONCAT("Table ", tableNumber, " is already booked")
		ELSE CONCAT("Table ", tableNumber, " is free")
	END AS bookingStatus
FROM bookings
WHERE date = bookingDate OR table_number = tableNumber
LIMIT 1;

CALL checkBooking("2023-03-25", 2);