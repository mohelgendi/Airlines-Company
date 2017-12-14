/* airport table;*/
    CREATE TABLE Airport(
    Airport_Code varchar(5) NOT NULL,
    Name varchar(255) NOT NULL,
    City varchar(255) NOT NULL,
    State varchar(255) NOT NULL,
    PRIMARY KEY(Airport_Code));

/*Flight table;*/
    CREATE TABLE Flight(
    Flight_Number varchar(11) NOT NULL,
    Airline varchar(255) NOT NULL,
    Weekdays varchar(100),
    PRIMARY KEY(Flight_Number));
    
/* flight_leg table;*/
    CREATE TABLE Flight_Leg(
    Flight_Number      VARCHAR(9)       NOT NULL,
    Leg_Number          int(2)       NOT NULL,
    Departure_Airport_Code VARCHAR(9) NOT NULL,
    Scheduled_Departure_Time TIME NOT NULL,
    Arrival_Airport_Code  VARCHAR(9) NOT NULL,
    Scheduled_Arrival_Time TIME NOT NULL,
    PRIMARY KEY(Flight_Number,Leg_Number),
    FOREIGN KEY(Flight_Number) REFERENCES Flight(Flight_Number),
    FOREIGN KEY(Departure_Airport_Code) REFERENCES Airport(Airport_Code),
    FOREIGN KEY(Arrival_Airport_Code) REFERENCES Airport(Airport_Code));
    
    /* airplane table;*/
   CREATE TABLE Airplane(
    Airplane_Id int(11) NOT NULL AUTO_INCREMENT,
    Total_Number_Of_Seats int(11) NOT null,
    Airplane_Type varchar(11) not null,
    PRIMARY KEY(Airplane_Id));

/* leg_instance table;*/
    CREATE TABLE Leg_Instance(
    Flight_Number      VARCHAR(9)        NOT NULL,
    Leg_Number          int(2)       NOT NULL,
    Date                DATE             NOT NULL,
    Number_Of_Available_Seats INT        NOT NULL,
    Airplane_Id         int(11)       NOT NULL,
    Departure_Airport_Code VARCHAR(9)    NOT NULL,
    Departure_Time        TIME           NOT NULL,
    Arrival_Airport_code  VARCHAR(9)     NOT NULL,
    Arrival_Time          TIME           NOT NULL,
    PRIMARY KEY(Flight_Number,Leg_Number,Date),
    FOREIGN KEY(Flight_Number,Leg_Number) REFERENCES Flight_Leg(Flight_Number,Leg_Number),
    FOREIGN KEY(Departure_Airport_Code) REFERENCES Airport(Airport_Code),
    foreign key (Airplane_Id) references Airplane(Airplane_Id),
    FOREIGN KEY(Arrival_Airport_Code) REFERENCES Airport(Airport_Code));

/* fare table;*/
    CREATE TABLE Fare(
    Flight_Number varchar(11) NOT NULL,
    Fare_Code varchar(11) NOT NULL,
    Amount int NOT NULL,
    Restrictions text NOT NULL,
    PRIMARY KEY(Fare_Code,Flight_Number),
    FOREIGN KEY(Flight_Number) REFERENCES Flight(Flight_Number));

/*airplane_type_name;*/
    CREATE TABLE Airplane_Type(
    Airplane_Type_Name varchar(11) NOT null,
    Max_seats int NOT null,
    Company varchar(255) NOT null,
    PRIMARY KEY(Airplane_type_name));

/* can_land table;*/
   CREATE TABLE Can_Land(
    Airplane_Type_Name varchar(11) NOT NULL,
    Airport_Code varchar(5) NOT null,
    primary key(Airplane_Type_Name,Airport_Code),
    FOREIGN KEY(Airplane_Type_Name) REFERENCES Airplane_Type(Airplane_Type_Name),
    foreign key(Airport_Code) references Airport(Airport_Code));


/* seat reservation table*/
    CREATE TABLE Seat_Reservation(
    Flight_Number       VARCHAR(9)     NOT NULL,
    Leg_Number           int(2)     NOT NULL,
    Date                 DATE           NOT NULL,
    Seat_Number          INT            NOT NULL,
    Customer_Name        CHAR           NOT NULL,
    Customer_Phone       CHAR           NOT NULL, 
    PRIMARY KEY(Flight_Number,Leg_Number,Date,Seat_number),
    FOREIGN KEY(Flight_Number,Leg_Number,Date) REFERENCES Leg_Instance(Flight_number,Leg_Number,Date));
	/*****************************END OF CREATING TABLES****************************/
                
                
	/**************************FILLING AIRPORT****************************/
	INSERT INTO Airport(Airport_code, Name, City, State)VALUES
	("SFO", "San-Francisco-International", "San-Francisco", "CA"),
	("OAK", "Oakland-International", "Oakland", "CA"),
	("LAS", "McCarren-International", "Las-Vegas", "CA"),
	("HNL", "Honolulu-International", "Honolulu", "HI"),
	("JFK", "John-F-Kennedy-International", "New-York", "NY"),
	("FAT", "Fresno-Yosemite-International", "Fresno", "CA"),
	("MSY", "Louis-Armstrong", "New-Orleans", "LA"),
	("ORD", "Chicago-OHare-International", "Chicago", "IL"),
	("MDW", "Midway", "Chicago", "IL"),
	("SMF", "Sacramento-International", "Sacramento", "CA"),
	("SCK", "Stockton-Metropolitan", "Stockton", "CA"),
	("PHX", "Phoenix-Sky-Harbor", "Phoenix", "AZ"),
	("DEN", "Denver-Interational", "Denver", "CO"),
	("EWR", "Newark-International", "Newark", "NJ"),
	("IAH", "Bush-Intercontinental","Houston", "TX"),
	("LAX", "Los-Angeles-International", "Los-Angeles", "CA"),
	("DCA", "Ronald-Reagan-National", "Arlington", "VA"),
	("IAD", "Washington-Dulles-International", "Dulles", "VA"),
	("MSN", "Dane-County-Regional", "Madison", "WI"),
	("MSP", "Minneapolis-St-Paul", "Minneapolis-St-Paul", "MN"),
	("SLC", "Salt-Lake-City-International", "Salt-Lake-City", "UT"),
	("DFW", "Dallas-Fort-Worth", "DFW", "TX"),
	("SAN", "San-Diego-International", "San-Diego", "CA"),
	("IWA", "Phoenix-Mesa-Gateway", "Phoenix", "AZ"),
	("SJC", "San-Jose-International", "San-Jose","CA"),
	("ONT", "Ontario-International", "Ontario", "CA");
	/*****************END OF FILLING AIRPORT*************/
             
	/*********************FILLING FLIGHT*********************/
	INSERT INTO flight(Flight_number,Airline,Weekdays) VALUES
	("UA560","United", "SAT,MON,TUES"),
	("B6624", "Jetblue", "SUN,FRI"),
	("DL5841", "Delta", "THURS,"),
	("DL1149", "Delta", "WED,MON,FRI"),
	("G4529", "Allegiant", "SUN,SAT,MON"),
	("G4154", "Allegiant", "TUES"),
	("G4155", "Allegiant", "WED,MON,FRI"),
	("HA48", "Hawaiian", "SUN,FRI"),
	("AA1522", "American", "FRI,MON"),
	("AA3472", "American", "SUN,SAT"),
	("WN380", "Southwest", "THURS,WED");
	/********************END OF FILLING FLIGHT********************/
    
    /**********************FILLING FLIGHT_LEG**********************/
    
    INSERT INTO Flight_Leg(Flight_number, Leg_number, Departure_airport_code, Scheduled_departure_time, Arrival_airport_code, Scheduled_arrival_time) VALUES
	("G4155", 1, "SCK", "053100", "IWA", "081400"),
	("G4154", 2, "IWA", "040600", "SCK", "045100"),
	("DL5841", 1, "OAK", "124000", "LAX", "020000"),
	("DL1149",1,"LAX", "064500", "HNL", "104300"),
	("HA48", 2, "HNL", "021500", "OAK", "093000"),
	("AA1522", 1, "SFO", "115900", "ORD", "060400"),
	("AA3472", 1, "ORD", "071900", "MSN", "0819"),
	("WN380", 1, "MDW", "075500", "ONT", "101000"),
	("WN380", 2, "ONT", "104500", "SMF", "114500"),
	("B6624", 1, "LAX", "091500", "JFK", "052200");
    
    /**********************END OF FLIGHT_LEG**********************/

    /****************FILLING LEG_INSTANCE***************/
    INSERT INTO Leg_Instance(Flight_Number, Leg_Number,Date,Number_Of_Available_Seats,Airplane_Id, Departure_Airport_Code,
    						 Departure_Time, Arrival_Airport_Code, Arrival_Time) VALUES
    ("G4155", 1, 2016-01-28, 3, 28, "SCK", 053500, "IWA", 081900),
	("G4155", 1, 2016-01-31, 16, 28, "SCK", 0531, "IWA", 081300),
	("G4154", 1, 2016-02-03, 19, 28, "SCK", 040600, "IWA", 045100),
	("DL5841", 1, 2016-02-09, 5, 21, "OAK", 124500, "LAX", 020500),
	("DL1149", 1, 2016-02-09, 20, 13, "LAX", 064500, "HNL", 104300),
	("HA48", 1, 2016-02-24, 10, 30, "HNL", 021500, "OAK", 091000),
	("AA1522", 1, 2016-08-05, 70, 9, "SFO", 120500, "ORD", 060400),
	("AA3472", 1, 2016-08-05, 15, 18, "ORD", 071900, "MSN", 081900),
	("WN380", 1, 2016-08-05, 130, 10, "MDW", 075500, "ONT", 101000),
	("WN380", 2, 2016-08-05, 130, 10, "ONT", 104500, "SMF", 114500),
	("B6624", 1, 2016-02-09, 100, 1, "LAX", 091500, "JFK", 052200);

    /****************END OF FILLING LEG_INSTANCE***************/