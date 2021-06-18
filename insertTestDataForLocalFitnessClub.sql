INSERT INTO FitnessTrainer(ft_id,	fName,	lName,	phone,	email)
VALUES  ("FTID100", "James",        "Kildare",	    "2151112221",	"JamesKildare@net.com"),
        ("FTID101",	"Ben ",	        "Casey",	    "2151112222",	"BenCasey@net.com"),
        ("FTID102",	"Marcus",       "Welby",	    "2151112223",	"MarcusWelby@net.com"),
        ("FTID103",	"Leonard ",	    "McCoy",        "2151112224",   "LeonarMcCoy@net.com"),
        ("FTID104",	"Hawkeye ",	    "Pierce",       "2151112225",   "HawkeyePierce@net.com"),
        ("FTID105",	"Phillip ",	    "Chandler",	    "2151112226",   "PhillipChandle@net.com"),
        ("FTID106",	"Heathcliff",   "Huxtable",     "2151112227",   "HeathcliffHuxtable@net.com"),
        ("FTID107",	"Greg",         "House",        "2151112228",   "GregHouse@net.com"),
        ("FTID108",	"Derek ",       "Shepherd",     "2151112229",	"DerekShepherd@net.com"),
        ("FTID109",	"Miranda",      "Bailey",	    "2151112220",	"MirandaBailey@net.com");
        
       

-- This is the statement that will load the Test Data for the Customer Dada

INSERT INTO Client(client_id,	fName,	lName,	address,	phone,	email)
VALUES ("CID100", "Nenad",      "Paunovic",     "101 Germantown Ave",   "2155551234",   "Nenad@craigle.com"),
       ("CID101", "Gradimir",	"Novakovic",  "202 Aramingo Ave",     "2155559876",   "Goran@craigle.com"),
       ("CID102", "Aleksandar",	"Jasic",      "617 W Oak Lane",       "2155553456",   "Boban@craigle.com"),
       ("CID103", "Vladimir",	"Kojic",     "303 Huntington Park",  "2155558765",   "Milan@craigle.com"),
       ("CID104", "Dragan",	    "Kostic",       "222 Alegheny Ave",     "3025551234",   "Mlava@craigle.com"),
       ("CID105", "Ivan",	    "Jevremovic",   "1700 N Broad St",      "3025559876",   "Tara@craigle.com"),
       ("CID106", "Marko",	    "Knezevic",     "1001 N 22nd St",       "3025554567",   "Kacaravo@craigle.com"),
       ("CID107", "Slavko",     "Ilic",         "278 Wissahickon Ave",  "2674443366",   "Kacaravo@craigle.com"),
       ("CID108", "Nenad",      "Kapric",       "676 Girard Ave",       "2157779988",   "Magare@cajgle.com"),
       ("CID109","Budimir",     "Vujacic",      "21 N Fox St",          "2671114488",   "Odore@ajde.com");

-- This is the statement that will load Test Data for Order_Staff Data

INSERT INTO Session (session_id,	ft_id_FK,	workout,	cardio, 	nutrition,	type)
VALUES 
       ("SID110", "FTID100",    "wholeBody",  "swimming", "plantBased",     "begginer"        ),
       ("SID111", "FTID101",    "bodyweight", "running",  "proteinBased",   "advanced"        ),
       ("SID112", "FTID104",    "lowerBody",  "hiking",   "cleanse",        "advanced"        ),
       ("SID113", "FTID105",    "arms",       "biking",   "proteinBased",   "intermediate"    ),
       ("SID114", "FTID104",    "lowerBody",  "running",  "plantBased",     "advanced"        ),
       ("SID115", "FTID107",    "upperBody",  "swimming", "shakeBoost",     "begginer"        ),
       ("SID116", "FTID106",    "back",       "biking",   "cleanse",        "advanced"        ),
       ("SID117", "FTID107",    "chest",      "swimming", "proteinBased",   "intermediate"    ),
       ("SID118", "FTID104",    "shoulder",   "biking",   "shakeBoost",     "advanced"        ),
       ("SID119", "FTID106",    "legs",       "running",  "plantBased",     "intermediate"    );
    


INSERT INTO Appointment (appnt_num, ft_id_FK, session_id_FK,	client_id_FK,	date,	time,	amount)
VALUES 
       ("APT#0001", "FTID100",   "SID110", "CID101", "2020/11/23",     "9:00",   120  ),
       ("APT#0002", "FTID104",   "SID114", "CID102", "2020/11/23",     "10:30",  80  ),
       ("APT#0003", "FTID104",   "SID112", "CID103", "2020/11/23",     "11:00",  120  ),
       ("APT#0004", "FTID106",   "SID119", "CID104", "2020/11/24",     "9:00",   120  ),
       ("APT#0005", "FTID100",   "SID110", "CID101", "2020/11/24",     "14:00",  120  ),
       ("APT#0006", "FTID107",   "SID115", "CID105", "2020/11/24",    "16:30",   80 ),
       ("APT#0007", "FTID105",   "SID113", "CID106", "2020/11/25",     "11:30",  80  ),
       ("APT#0008", "FTID107",   "SID117", "CID107", "2020/11/25",    "16:00",   120 ),
       ("APT#0009", "FTID104",   "SID114", "CID102", "2020/11/25",     "17:00",  80  ),
       ("APT#0010", "FTID101",   "SID111", "CID108", "2020/11/25",     "18:00",  120  );


