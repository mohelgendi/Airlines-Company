	/*10 SELECT STATEMENTS*/
/*    5b i.  USING 2 TABLES************************************/
/*selecting all the aiports an airplane can lnad on*/
SELECT airplane.Airplane_Id, can_land.Airport_Code 
FROM can_land,airplane
WHERE airplane.Airplane_Type = can_land.Airplane_Type_Name

/*selecting the airport name and city a plane is departing from*/
SELECT airport.Name, airport.City
FROM airport,flight_leg
WHERE flight_leg.Departure_Airport_Code = airport.Airport_Code
AND flight_leg.Leg_Number = 2
AND flight_leg.Flight_Number = "VL455"

/*selecting all the that depart from LAX Airport*/
SELECT flight.Flight_Number 
from flight,flight_leg
where flight.Flight_Number = flight_leg.Flight_Number
AND flight_leg.Departure_Airport_Code = "LAX"


/*END OF USING 2 TABLES************************************/

/* 5b ii. USING 3 TABLES************************************/


						/*VIEWS*/
/*GETS THE NAMES AND DESTINATION OF THE CUSTOMER*/
create view Customer_Departure_Arrival as
select seat_reservation.Customer_Name,D.City AS DEPARTURE_FROM,A.City AS ARRIVE_AT
from airport AS D ,airport AS A,seat_reservation,leg_instance
where (seat_reservation.Flight_Number,seat_reservation.Leg_Number,seat_reservation.Date) =
(leg_instance.Flight_Number,leg_instance.Leg_Number,leg_instance.Date)
and leg_instance.Departure_Airport_Code = D.Airport_Code
and leg_instance.Arrival_Airport_code = A.Airport_Code

/*GETS THE NAMES FLIGHTS AND FARES THE CUSTOMERS PAID.*/
create view Customer_flight_fare as
SELECT seat_reservation.Customer_Name,fare.Flight_Number,fare.Amount
from seat_reservation,fare
where seat_reservation.Flight_Number = fare.Flight_Number
order by seat_reservation.Customer_Name;

/*GETS CUSTOMERS FLIGHT, DEPARTURE TIME AND ARRIVAL AIRPORT TO REMINDER LATE CUSTOMRESOF THEIR FLIGHTS*/
create view customer_departure_reminder as
SELECT seat_reservation.Customer_Name,seat_reservation.Flight_Number,leg_instance.Departure_Time,airport.Name
FROM seat_reservation,leg_instance,airport
WHERE (seat_reservation.Flight_Number,seat_reservation.Leg_Number,seat_reservation.Date) =
(leg_instance.Flight_Number,leg_instance.Leg_Number,leg_instance.Date)
AND leg_instance.Arrival_Airport_code = airport.Airport_Code;