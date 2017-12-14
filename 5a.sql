/* AIRPORT TABLE CRUD OPERATIONS**********************************/
         			/*INSERT*/
INSERT INTO AIRPORT(Airport_Code,Name,City,State)
VALUES
("SIG","Fernando Luis Ribas Dominicci","San Juan","SJ");
					/*DELETE*/
DELETE FROM AIRPORT 
WHERE AIRPORT.Airport_Code = "FAT";
					/*UPDATE*/
UPDATE AIRPORT 
SET Name = " de vallamore", City = "Capdevilla"
WHERE Airport_Code = "SIG";
/* END OF AIRPORT TABLE CRUD OPERATIONS**********************************/

/*FLIGHT TABLE CRUD OPERATIONS*******************************************/
   					/*INSERT*/
INSERT INTO FLIGHT(Flight_number,Airline,Weekdays)
VALUES
("VL455","Valencia", "MON,FRI,WED");
   					/*DELETE*/
DELETE FROM FLIGHT 
WHERE FLIGHT.Flight_number = "UA560";
   					/*UPDATE*/
UPDATE FLIGHT
SET Weekdays = "sat,sat,sat" 
WHERE Flight_Number = "VL455";
/* END OF FLIGHT TABLE CRUD OPERATIONS**********************************/

/*SEAT_RESERVATION TABLE CRUD OPERATIONS*/
					/*INSERT*/
INSERT INTO SEAT_RESERVATION(Flight_Number,Leg_Number,Date,Seat_Number,Customer_Name,Customer_Phone)
VALUES
("VL455",2,"2017-12-25","22","Chris Winchester","05060522567");
					/*DELETE*/
DELETE FROM SEAT_RESERVATION WHERE Seat_Number = 22;
					/*UPDATE*/
UPDATE SEAT_RESERVATION
SET Flight_Number = "BG223",
Leg_Number = 3,
Seat_Number = 25
WHERE Leg_Number = 2
AND Flight_Number = "VL455"
AND Date = "2017-12-25"

/* END OF SEAT_RESERVATION TABLE CRUD OPERATIONS**********************************/
