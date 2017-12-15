CREATE SCHEMA `airline_company` ;
use airline_company

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
    Seat_Number          varchar(5)            NOT NULL,
    Customer_Name        varchar(100)           not NULL,
    Customer_Phone       varchar(100)        NOT NULL, 
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
    
    /**********************FILLING AIRPLANE*********************/
    INSERT INTO Airplane(Airplane_id,Total_number_of_seats,Airplane_type) VALUES
	(1, 180, "A320"),
	(2, 175, "A320"),
	(3, 156, "A319"),
	(4, 150, "A319"),
	(5, 145, "A319"),
	(6, 188, "A707"),
	(7, 187, "A707"),
	(8, 124, "A727"),
	(9, 123, "A737"),
	(10, 120, "A737"),
	(11, 550, "A747"),
	(12, 500, "A747"),
	(13, 225, "A757"),
	(14, 290, "A767"),
	(15, 285, "A767"),
	(16, 440, "A777"),
	(17, 323, "A787"),
	(18, 50, "ERJ145"),
	(19, 50, "ERJ145"),
	(20, 110, "A190"),
	(21, 80, "A170"),
	(22, 44, "CRJ440"),
	(23, 40, "CRJ440"),
	(24, 50, "CRJ100"),
	(25, 70, "CRJ700"),
	(26, 75, "CRJ700"),
	(27, 77, "CRJ700"),
	(28, 166, "MD80"),
	(29, 200, "A321"),
	(30, 180, "A332");
    /********************END OF FILLING AIRPLANE***************/
    
    /****************FILLING LEG_INSTANCE***************/
	INSERT INTO Leg_Instance(Flight_Number, Leg_Number,Date,Number_Of_Available_Seats,Airplane_Id, Departure_Airport_Code,
    						 Departure_Time, Arrival_Airport_Code, Arrival_Time) VALUES
    ("G4155", 1, "2016-01-28", 3, 28, "SCK", "053500", "IWA", "081900"),
	("G4155", 1, "2016-01-31", 16, 28, "SCK", "0531", "IWA", "081300"),
	("G4154", 2, "2016-02-03", 19, 28, "SCK", "040600", "IWA", "045100"),
	("DL5841", 1, "2016-02-09", 5, 21, "OAK", "124500", "LAX", "020500"),
	("DL1149", 1, "2016-02-09", 20, 13, "LAX", "064500", "HNL", "104300"),
	("HA48", 2, "2016-02-24", 10, 30, "HNL", "021500", "OAK", "091000"),
	("AA1522", 1, "2016-08-05", 70, 9, "SFO", "120500", "ORD", "060400"),
	("AA3472", 1, "2016-08-05", 15, 18, "ORD", "071900", "MSN", "081900"),
	("WN380", 1, "2016-08-05", 130, 10, "MDW", "075500", "ONT", "101000"),
	("WN380", 2, "2016-08-05", 130, 10, "ONT", "104500", "SMF", "114500"),
	("B6624", 1, "2016-02-09", 100, 1, "LAX", "091500", "JFK", "052200");

    /****************END OF FILLING LEG_INSTANCE***************/
    
    /*********************FILLING FARE****************/
    INSERT INTO Fare(Flight_number, Fare_code, Amount, Restrictions) VALUES
	("UA560","L",350,"No"),
	("G4154","Y",106,"No"),
	("G4155","Y",142,"No"),
	("DL5841","Y",100,"Yes"),
	("DL1149","B",500,"Yes"),
	("HA48","F",1000, "Yes"),
	("AA1522","Y",250,"No"),
	("AA3472","Y",150,"Yes"),
	("WN380","Y",256,"No"),
	("B6624","Y",98,"No");
    /********************END OF FARE*****************/
    
    /**************FILLING AIRPLANE_TYPE**************/
    INSERT INTO Airplane_Type(Airplane_type_name, Max_seats, Company) VALUES
	("A320", 180, "Airbus"),
	("A319", 156, "Airbus"),
	("A321", 236, "Airbus"),
	("A332", 200, "Airbus"),
	("A707", 189, "Boeing"),
	("A737", 124, "Boeing"),
	("A747", 550, "Boeing"),
	("A757", 228, "Boeing"),
	("A727", 189, "Boeing"),
	("A767", 290, "Boeing"),
	("A777", 440, "Boeing"),
	("A787", 323, "Boeing"),
	("ERJ145", 50, "Embraer"),
	("A190", 114, "Embraer"),
	("A170", 80, "Embraer"),
	("CRJ440", 44, "Bombardier"),
	("CRJ100", 50, "Bombardier"),
	("CRJ700", 78, "Bombardier"),
	("MD80", 166, "McDonnell-Douglas");
    /**************END OF AIRPLANE_TYPE**************/
    
    /****************FILLING Can_land**************/
    INSERT INTO Can_Land(Airplane_type_name, Airport_code) VALUES
    ("MD80", "SCK"),
	("MD80", "SAN"),
	("MD80", "IWA"),
	("MD80", "LAS"),
	("ERJ145", "IWA"),
	("ERJ145", "FAT"),
	("ERJ145", "ORD"),
	("ERJ145", "MSN"),
	("CRJ440", "MSN"),
	("CRJ440", "MSP"),
	("CRJ100", "MSN"),
	("CRJ100", "MSP"),
	("CRJ700", "MSN"),
	("CRJ700", "SLC"),
	("CRJ700", "ORD"),
	("A170", "OAK"),
	("A170", "LAX"),
	("A190", "SLC"),
	("A190", "OAK"),
	("A707", "HNL"),
	("A707", "OAK"),
	("A707", "MDW"),
	("A707", "SJC"),
	("A727", "SMF"),
	("A727", "SJC"),
	("A727", "LAX"),
	("A737", "OAK"),
	("A737", "SFO"),
	("A737", "ORD"),
	("A737", "MDW"),
	("A737", "ONT"),
	("A737", "SMF"),
	("A737", "SJC"),	
	("A737", "SAN"),
	("A737", "LAS"),
	("A747", "SFO"),
	("A747", "JFK"),
	("A747", "ORD"),
	("A747", "MSP"),
	("A747", "DEN"),
	("A757", "LAS"),
	("A757", "PHX"),
	("A757", "DCA"),
	("A757", "LAX"),
	("A757", "HNL"),
	("A777", "ORD"),
	("A777", "LAX"),
	("A777", "IAD"),
	("A787", "IAH"),
	("A787", "JFK"),
	("A787", "EWR"),
	("A321", "DFW"),
	("A321", "DEN"),
	("A332", "OAK"),
	("A332", "HNL"),
	("A320", "JFK"),
	("A320", "LAX"),
	("A320", "IAH"),
	("A319", "SLC"),
	("A319", "PHX"),
	("A319", "MSP"),
	("A319", "SFO"),
	("A319", "MDW");
    /****************END OF Can_land*************/

    /***********FILLING SEAT RESERVATION***********/
        INSERT INTO Seat_Reservation(Flight_number, Leg_number, Date, Seat_number, Customer_name, Customer_phone) VALUES
	("G4155", 1, "2016-01-28", "1A", "Osvaldo", "555-55-5555"),
	("G4155", 1, "2016-01-31", "2Z", "Caitlin", "867-5309"),
	("G4154", 2, "2016-02-03", "12S", "Mike", "555-5309"),
	("DL5841", 1, "2016-02-09", "11E", "Dan", "555-0000"),
	("DL1149", 1, "2016-02-09", "3A", "Tyler", "555-0001"),
	("HA48", 2, "2016-02-24", "8A", "Bren", "555-0008"),
	("AA1522", 1, "2016-08-05", "07T", "LJ", "555-0009"),
	("AA3472", 1, "2016-08-05","10U", "John", "555-0010"),
	("WN380", 1, "2016-08-05", "13O", "Edward", "555-0011"),
	("WN380", 2, "2016-08-05", "1P", "Aung", "555-0012"),
	("B6624", 1, "2016-02-09","14W", "Justin", "555-0013"),
	("G4155", 1, "2016-01-28", "15E", "Andrew", "555-0014"),
	("G4155", 1, "2016-01-31", "6G", "Devin", "555-0015"),
	("G4154", 2, "2016-02-03", "6Q", "Tianxiang", "555-0016"),
	("DL5841", 1, "2016-02-09", "7K", "Matt", "555-0017"),
	("DL1149", 1, "2016-02-09", "15Z", "Trevor", "555-0018"),
	("HA48", 2, "2016-02-24", "7V", "Alexis", "555-0019"),
	("AA1522", 1, "2016-08-05", "13A", "Andrew", "555-0020"),
	("AA3472", 1, "2016-08-05", "7F", "Lauren", "555-0022"),
	("WN380", 1, "2016-08-05", "6A", "Justin", "555-0025"),
	("WN380", 2, "2016-08-05", "3R", "Lukas", "555-0028"),
	("B6624", 1, "2016-02-09", "7C", "Navjot", "555-0031"),
	("G4155", 1, "2016-01-28","09B", "Brendan", "555-0033"),
	("G4155", 1, "2016-01-31","8A", "Nathan", "555-0034"),
	("G4154", 2, "2016-02-03","07F", "Neha", "555-0035"),
	("DL5841", 1, "2016-02-09","8F", "Eduardo", "555-0036"),
	("DL1149", 1, "2016-02-09", "23D", "Isabelle", "555-0037"),
	("HA48", 2, "2016-02-24",  "19A", "Daniel", "555-0038"),
	("AA1522", 1, "2016-08-05","7L", "Jared", "555-0039"),
	("AA3472", 1, "2016-08-05","9A", "Kyle", "555-0040"),
	("WN380", 1, "2016-08-05","17B", "Zhiyun", "555-0041");
    /***********END OF SEAT RESERVATION***********/