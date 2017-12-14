	/*10 SELECT STATEMENTS*/
/*USING 2 TABLES************************************/
SELECT airplane.Airplane_Id, can_land.Airport_Code 
FROM can_land,airplane
WHERE airplane.Airplane_Type = can_land.Airplane_Type_Name

SELECT airport.Name, airport.City
FROM airport,flight_leg
WHERE flight_leg.Departure_Airport_Code = airport.Airport_Code
AND flight_leg.Leg_Number = 2
AND flight_leg.Flight_Number = "VL455"

/*END OF USING 2 TABLES************************************/S