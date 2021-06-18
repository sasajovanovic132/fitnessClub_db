

-- query that performs an intersection on table FitnessTrainer and table Session
-- It returns full names and id numbers of FitnessTrainers and workouts they generated
SELECT DISTINCT 
   ft_id,fName,lName,Session.workout
FROM FitnessTrainer
    INNER JOIN Session
        ON FitnessTrainer.ft_id = Session.ft_id_FK;


-- this query creates back-up table to be used to demonstrate Union,Intersection and Difference 
CREATE TABLE Client_bkp
SELECT * FROM Client;
-- insert some of the Fitness Instructor rows into Client_bkp tables
INSERT INTO Client_bkp(client_id,	fName,	lName, address,	phone,	email)
VALUES  ("FTID100", "James",        "Kildare",	 "101 West Point Ave",    "2151112221",	"JamesKildare@net.com"),
        ("FTID101",	"Ben ",	        "Casey",	  "202 Cumberland Ave",     "2151112222",	"BenCasey@net.com"),
        ("FTID102",	"Marcus",       "Welby",	  "617 E Oak Lane",       "2151112223",	"MarcusWelby@net.com"),
        ("FTID103",	"Leonard ",	    "McCoy",     "303 Huntington Valley",   "2151112224",   "LeonarMcCoy@net.com"),
        ("FTID104",	"Hawkeye ",	    "Pierce",    "222 Morris Ave",      "2151112225",   "HawkeyePierce@net.com");




-- Union

-- This query demonstrates Union Operation 
-- between tables Client and Client_bkp

-- without duplicates
SELECT * FROM Client
UNION
SELECT * FROM Client_bkp;

-- with duplicates
SELECT *, 'Client' Source from Client_bkp
UNION ALL  
SELECT *, 'Client_bkp' from Client_bkp;

-- Query to combine full names of FitnessTrainer and Clients using UNION operator

SELECT 
    CONCAT(fName,' ',lName) fullname
FROM
    FitnessTrainer 
UNION SELECT 
    CONCAT(fName,' ',lName)
FROM
    Client;


-- Intersection

-- This query shows intersaction bitween FitnessTrainer and Client_bkp
-- to find out which Fitness Trainer is a client
SELECT f.ft_id,f.fName,f.lname,client_id,f.phone,f.email
FROM FitnessTrainer f
RIGHT JOIN Client_bkp b
ON f.ft_id = b.client_id;


-- this query uses Intersaction that produce
--a result set that contains FitnesTrainers that are also Clients
SELECT ft_id,FitnessTrainer.fName,FitnessTrainer.lName
FROM FitnessTrainer
INNER JOIN Client_bkp
ON FitnessTrainer.ft_id = Client_bkp.client_id AND FitnessTrainer.fName = Client_bkp.fName;


-- Another example of Intersaction with same result as previous
-- by selecting attributs to be shown from Client_bkp table
SELECT DISTINCT Client_bkp.client_id, Client_bkp.fName,Client_bkp.lName
FROM Client_bkp
WHERE (Client_bkp.client_id, Client_bkp.fName,Client_bkp.lName) IN
(SELECT FitnessTrainer.ft_id, FitnessTrainer.fName, FitnessTrainer.lName
FROM FitnessTrainer);

-- query that performs an intersection on table FitnessTrainer and table Session
-- It returns full names and id numbers of FitnessTrainers and workouts they generated
SELECT DISTINCT 
   ft_id,fName,lName,Session.workout
FROM FitnessTrainer
    INNER JOIN Session
        ON FitnessTrainer.ft_id = Session.ft_id_FK;

       
        -- Creating Difference

        -- Below the outer query will produce a set of rows that contain 
        -- FitnessTrainer ids and other attributes,
        -- the inner /sub query will produce a set of
        -- rows that contain Clients ids and other attributes
        --The NOT IN modifier will enforce a filter
        -- that will only display the id and Name of FitnessTrainers 
        --that are not in the Client_bkp table

        -- Minus From FitnessTrainer to Client_bkp
        SELECT DISTINCT FitnessTrainer.ft_id, FitnessTrainer.fName,FitnessTrainer.lName
        FROM FitnessTrainer
        WHERE(FitnessTrainer.ft_id, FitnessTrainer.fName,FitnessTrainer.lName) NOT IN
        (SELECT Client_bkp.client_id,Client_bkp.fName,Client_bkp.lName
        FROM Client_bkp );

        -- Minus From Client_bkp to FitnessTrainer to find out clients
        -- that are not FitnessTrainers
        SELECT DISTINCT Client_bkp.client_id, Client_bkp.fName, Client_bkp.lName
        FROM Client_bkp
        WHERE(Client_bkp.client_id,Client_bkp.fName,Client_bkp.lName) NOT IN
        (SELECT FitnessTrainer.ft_id,FitnessTrainer.fName,FitnessTrainer.lName
        FROM FitnessTrainer);

        
        
    -- JOIN 

        -- This Query combines Tables FitnessTrainer and Session
        -- displays every session created by Fitness Trainer,
        -- Type of Session and type of Cardio program

        
        SELECT f.ft_id,f.fName,f.lName,
            s.session_id, s.cardio, s.type
        FROM FitnessTrainer f
        JOIN Session s
            ON f.ft_id = s.ft_id_FK;

            -- -- JOIN Query using three tables
            -- this Query uses JOIN operator to join tables FitnessTrainer,Appointment and Client
            -- to display names of clients and trainer that had appointments,
            -- dates of appointment and amount

           SELECT f.ft_id,f.fName,f.lname,
           a.date,a.amount,c.fName,c.lName
           FROM FitnessTrainer f
           JOIN Appointment a
           ON f.ft_id = a.ft_id_FK
           JOIN Client c
           ON c.client_id = a.client_id_FK;


     -- Alter Table

   -- This statement adds column -address- to the Table FitnessTrainer
ALTER TABLE FitnessTrainer
ADD address VARCHAR(100) NOT NULL;

-- show updated table FitnessTrainer
DESCRIBE FitnessTrainer;

-- This Query modifes column -email- data type info
ALTER TABLE FitnessTrainer 
MODIFY email VARCHAR(100);

-- show the column list of the vehicles
-- table to verify the change:
DESCRIBE FitnessTrainer;



  

   -- Update Table

  -- to display current value of address of the Fitness Trainer
SELECT 
    fNname, 
    lName, 
    address
FROM
    FitnessTrainer
WHERE
    ft_id = 'FTID109';
    
    -- Using MySQL UPDATE to modify values in multiple columns 
    -- to update Fitness Trainer's address and last name
    UPDATE FitnessTrainer 
SET 
    lName = 'Smith',
    address = '3451 W Penn St'
WHERE
    ft_id = 'FTID109';
    
    -- to verify change
    SELECT 
    fName, 
    lName, 
    address
FROM
    FitnessTrainer
WHERE
    ft_id = 'FTID100';
    
    
   -- Using MySQL UPDATE to modify values in multiple columns 
   -- update Client's phone and address

    UPDATE Client 
SET 
    address = '100 N Cumberland St ',
    phone = '1120233344'
WHERE
    client_id = 'CID102';
    
    
   SELECT 
    fName, 
    lName, 
    phone,
    address
FROM
    Client
WHERE
    client_id = 'CID102'; 


-- DELETE Clause


-- This Statement Deletes two Clients

DELETE FROM Client 
WHERE client_id = 'CID109' OR client_id = 'CID100';

-- to verify Client Table after deletion
SELECT * FROM Client;


-- This Statement Deletes two Fitness Trainers

DELETE FROM FitnessTrainer 
WHERE ft_id = 'FTID102' OR ft_id = 'FTID103';


-- to verify FitnessTrainer Table after deletion
SELECT * FROM FitnessTrainer;



-- AGGREGATED Functions


-- Count() used to find out total number of
-- Fitness Trainers that are in the Table FitnessTrainer  
SELECT COUNT(*)
FROM FitnessTrainer;

-- SUM() used to fund total amount of payments 
-- that each Fitness Trainer generated
SELECT 
   f.fName,f.lName,
    SUM(amount) total
FROM
    FitnessTrainer f
        INNER JOIN
    Appointment a ON f.ft_id = a.ft_id_FK
GROUP BY f.ft_id
ORDER BY total;

 
 -- GROUP with HAVING

  -- use uf HAVING clause to find out last names of
  -- all Trainers and Clients 
  -- that have made total payments higher than 100
  -- before Nov,25th 2020
    SELECT 
  f.lName AS Trainer,
  c.lName AS Client ,a.date,
    SUM(amount) total
FROM
    FitnessTrainer f
INNER JOIN Appointment a  
    ON f.ft_id = a.ft_id_FK
    INNER JOIN Client c 
    ON c.client_id = a.client_id_FK
GROUP BY  
     
    f.ft_id,c.client_id
HAVING 
    a.date < "2020-11-25"
    AND total > 100;

-- use of HAVING clause to find out all the Fitness Trainers
-- that have created Session Type of Advaced
-- and for lower body Workout
SELECT 
  ft_id ,
 session_id,type,workout 
FROM
    FitnessTrainer 
INNER JOIN Session  
    ON ft_id = ft_id_FK  
GROUP BY  
  ft_id
  HAVING type = 'advanced' 
  AND
  workout = 'lowerBody';   

    

-- using Having Clause to find out which Trainers
-- had more than 1 client and more than 1 Sessions
SELECT 
     ft_id_FK,
    COUNT(appnt_num) AS totalSessions,
    COUNT(client_id_FK) AS totalClients
FROM
    Appointment 
    GROUP BY  ft_id_FK
    HAVING totalSessions > 1
    AND  totalClients > 1; 
    
    -- using Having Clause to find out each of Trainers
-- that had generated payment of greater than $80
-- with Client with id of "CID103"
   
   SELECT appnt_num, ft_id,client_id_FK,FitnessTrainer.fName,
   FitnessTrainer.lName,amount
   FROM FitnessTrainer 
   JOIN Appointment 
   ON ft_id = ft_id_FK
   JOIN Client 
   ON client_id_FK = client_id
   GROUP BY appnt_num
   HAVING amount > 80
   AND client_id_FK = "CID103";



-- This Query sorts the result set of tables Client and Appointment 
-- in Descending order of the amount that each Client has paid
SELECT  appnt_num, client_id, amount
FROM Appointment
LEFT JOIN Client
ON client_id = client_id_FK
GROUP BY appnt_num
ORDER BY amount DESC;

-- This Query Sorts the the table FitnessTrainer by 
-- Trainers Last Name in Ascending order
SELECT * FROM FitnessTrainer
ORDER BY lName ASC;


 -- VIEWS


  -- Select statement for the View
  -- to be created

  SELECT 
        f.ft_id, 
        f.fName AS TrainersFirstName, 
        f.lName AS TrainersLastName,
        c.fName AS ClientsFirstName, 
        c.lName AS ClientsLastName,
        a.amount
    FROM
        FitnessTrainer f
    INNER JOIN
    Appointment a 
    ON f.ft_id = a.ft_id_FK
    INNER JOIN
    Client c
    ON c.client_id = a.client_id_FK;


 -- Creating a View based on above Query
 -- This View displays all Fitness Trainers and Clients
 -- that are associated and amount paid by each customer
    CREATE VIEW trainersAndClients
    AS 
    SELECT 
        f.ft_id, 
        f.fName AS TrainersFirstName, 
        f.lName AS TrainersLastName,
        c.fName AS ClientsFirstName, 
        c.lName AS ClientsLastName,
        a.amount
    FROM
        FitnessTrainer f
    INNER JOIN
    Appointment a 
    ON f.ft_id = a.ft_id_FK
    INNER JOIN
    Client c
    ON c.client_id = a.client_id_FK;
    
    
    -- Executing the View created above
    SELECT * FROM trainersAndClients;


    -- SELECT Statement for the View
    -- to be created
    
   SELECT ft_id,fName,lName, workout
   FROM FitnessTrainer
   JOIN Session
   ON ft_id_FK = ft_id;

    -- Creating a View based on above Query
    -- This View displays names of Fitness Trainers and types of  Workouts
    -- that they created
    CREATE VIEW trainersAndWorkoutType
    AS
       SELECT ft_id,fName,lName, workout
        FROM FitnessTrainer
        JOIN Session
        ON ft_id_FK = ft_id;

    -- Executing the View created above
    SELECT * FROM trainersAndWorkoutType;

    
    
    -- STORED PROCEDURES

    -- This Query will display all info about all Clients
    SELECT * FROM Client;

-- Create Stored Procedure that will be used to display
-- all info about all Clients
DELIMITER //

CREATE PROCEDURE GetAllClients()
BEGIN
	SELECT *  FROM Client;
END //

DELIMITER ;

-- This Query calls the GetAllClients() stored procedure:
CALL GetAllClients();



  -- This Query will display all info ffor every appointment
  -- that was paid $120
    SELECT * FROM Appointment
    WHERE amount = 120.00;


DELIMITER //

-- This Query creates Procedure that will take a paramater of payment amount
-- and display all info from Appointment table for every appointment that was
-- paid with the ammount equal to parameter amount
CREATE PROCEDURE GetInfoByPayment(
	IN perPayment DOUBLE
)
BEGIN
	SELECT * 
 	FROM Appointment
	WHERE amount = perPayment;
END //

DELIMITER ;

-- Procedure Call by Paramater Value 120.00
CALL GetInfoByPayment(120.00);
-- Procedure Call by Paramater Value 80.00
CALL GetInfoByPayment(80.00);


-- STORED TRIGGERS

-- UPDATE

--  create a new table named sessionWorkout_audit 
-- to keep the changes to the Session table:
CREATE TABLE sessionWorkout_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sessionID VARCHAR(8),
    workout VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);



-- create a BEFORE UPDATE trigger that is invoked 
-- before a change is made to the Session table
CREATE TRIGGER before_sessionWorkout_update 
    BEFORE UPDATE ON Session
    FOR EACH ROW 
 INSERT INTO sessionWorkout_audit
 SET action = 'update',
     sessionID = OLD.session_id,
     workout = OLD.workout,
     changedat = NOW();

    -- show all triggers in the current database
    --  by using the SHOW TRIGGERS statement:
     SHOW TRIGGERS;


    -- Show Session's workout for session id "SID118"
    SELECT workout
    FROM Session  
    WHERE session_id = "SID118";

     -- update a row in the Session table
    UPDATE Session
    SET 
        workout = 'upperBody'
    WHERE
        session_id = "SID118";

    --  query the sessionWorkout table to check if the trigger
    --  was fired by the UPDATE statement
    SELECT * FROM sessionWorkout_audit;


    -- DELETE

    -- create a BEFORE DELETE trigger that is invoked 
    -- before a deletion is made to the Session table
    CREATE TABLE SessionArchives (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    sessionID   VARCHAR(8),
    cardio      VARCHAR(50),
    workout     VARCHAR(50),
    deletedAt TIMESTAMP DEFAULT NOW()
);


    -- create a BEFORE DELETE trigger that is invoked 
    -- before a deletion is made to the Session table
DELIMITER $$

CREATE TRIGGER before_session_delete
BEFORE DELETE
ON Session FOR EACH ROW
BEGIN
    INSERT INTO SessionArchives(sessionID,cardio,workout)
    VALUES(OLD.session_id,OLD.cardio,OLD.workout);
END $$    

DELIMITER ;

 -- Delete row in the Session table
DELETE FROM Session 
WHERE session_id = "SID118";


    --  query the SessionArchives table to check if the trigger
    --  was fired by the DELETE statement
SELECT * FROM SessionArchives;


-- CREATE USER
-- Shows user that have access to the database management system
SELECT USER 
FROM mysql.user;

-- Create an Additional User in MariaDB Named sasa132
CREATE USER sasa132 
IDENTIFIED BY 'Jovanovic132!';

-- Logged in as an Administrator to view all users of the database
SELECT USER 
FROM mysql.user;

-- Grant Privilage to new user 'sasa132'
-- to view, insert update and delete on table Client
GRANT SELECT, INSERT, UPDATE, DELETE
ON Client TO sasa132;
--to display grants for user 'sasa132'
SHOW GRANTS FOR sasa132;

-- Grant privilage to only view table FitnessTrainer
GRANT SELECT
ON FitnessTrainer TO sasa132;
--to display grants for user 'sasa132'
SHOW GRANTS FOR sasa132;

-- This Statement Revokes the Insert and SELECT Privilages
-- to the classicmodels Database  for the rfc User Account
-- Only the SELECT and UPDATE Privilege remains on table FitnessTrainer
-- for the user sasa132
-- after the Statement is executed
REVOKE INSERT, DELETE 
ON Client
FROM sasa132;
--Show the current Privileges after the REVOKE Statement
-- to user 'sasa132'
SHOW GRANTS FOR sasa132;

-- this statement revokes all privilages
-- for user sasa132
REVOKE ALL, GRANT OPTION
FROM sasa132;

--Show the current Privileges  of user 'sasa132'
-- after the REVOKE Statement
SHOW GRANTS FOR sasa132;