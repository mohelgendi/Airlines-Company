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
SELECT seat_reservation.Customer_Name,seat_reservation.Flight_Number,leg_instance.Departure_Time,airport.Name as GOING_TO
FROM seat_reservation,leg_instance,airport
WHERE (seat_reservation.Flight_Number,seat_reservation.Leg_Number,seat_reservation.Date) =
(leg_instance.Flight_Number,leg_instance.Leg_Number,leg_instance.Date)
AND leg_instance.Arrival_Airport_code = airport.Airport_Code;