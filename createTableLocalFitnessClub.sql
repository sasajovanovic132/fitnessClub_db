DROP DATABASE  IF EXISTS FitnessClub_DB;
CREATE DATABASE IF NOT EXISTS FitnessClub_DB;
USE FitnessClub_DB;

CREATE TABLE FitnessTrainer
(
    ft_id        VARCHAR(8),
    fName        VARCHAR(50) NOT NULL,
    lName        VARCHAR(50) NOT NULL,
    phone        CHAR(10)    NOT NULL,
    email        VARCHAR(50) NOT NULL,

    CONSTRAINT FitnesTrainer_PK PRIMARY KEY(ft_id)

);

CREATE TABLE Client 
(
    
    client_id     VARCHAR(8),
    fName         VARCHAR(50)    NOT NULL,
    lName         VARCHAR(50)    NOT NULL,
    address       VARCHAR(100)   NOT NULL,
    phone         CHAR(10)       NOT NULL,
    email         VARCHAR(50)    NOT NULL,

    CONSTRAINT Client_PK PRIMARY KEY (client_id)

);


CREATE TABLE Session 
(
    
    session_id       VARCHAR(8),
    ft_id_FK         VARCHAR(8),
    workout          VARCHAR(50)    NOT NULL,
    cardio           VARCHAR(50)    NOT NULL,
    nutrition        VARCHAR(50)    NOT NULL,
    type             VARCHAR(50)    NOT NULL,

    CONSTRAINT Session_PK PRIMARY KEY (session_id),
    CONSTRAINT Session_FK1 FOREIGN KEY (ft_id_FK)
    REFERENCES FitnessTrainer(ft_id)

);



CREATE TABLE Appointment 
(
   
    appnt_num         VARCHAR(8),
    ft_id_FK          VARCHAR(8),
    client_id_FK      VARCHAR(8),
    session_id_FK     VARCHAR(8),
    date              DATE          NOT NULL,
    time              TIME          NOT NULL,
    amount            DOUBLE        NOT NULL,


    CONSTRAINT Appointment_PK PRIMARY KEY(appnt_num),
    CONSTRAINT Appointment_FK1 FOREIGN KEY(ft_id_FK)
    REFERENCES FitnessTrainer(ft_id),
    CONSTRAINT Appointment_FK2 FOREIGN KEY (client_id_FK)
    REFERENCES Client(client_id),
    CONSTRAINT Appointment_FK3 FOREIGN KEY(session_id_FK)
    REFERENCES Session(session_id)


);