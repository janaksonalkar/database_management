CREATE SCHEMA ProjectInitial
GO
GO
CREATE TABLE ProjectInitial.Team
(
   teamName nvarchar(30) NOT NULL,
   coachName nvarchar(30) NOT NULL,
   CONSTRAINT Team_PK PRIMARY KEY(teamName)
)
GO
CREATE TABLE ProjectInitial.Player
(
   playerNr int CHECK (playerNr >= 0) NOT NULL,
   age int CHECK (age >= 0) NOT NULL,
   countryName nvarchar(30) NOT NULL,
   playerName nvarchar(30) NOT NULL,
   teamName nvarchar(30) NOT NULL,
   CONSTRAINT Player_PK PRIMARY KEY(playerNr)
)
GO
CREATE TABLE ProjectInitial.Coach
(
   coachName nvarchar(30) NOT NULL,
   DOB date NOT NULL,
   startDate date NOT NULL,
   endDate date NOT NULL,
   CONSTRAINT Coach_PK PRIMARY KEY(coachName)
)
GO
 
 CREATE TABLE ProjectInitial.Batsman
(
   batsmanNr int CHECK (batsmanNr >= 0) NOT NULL,
   avg float(1) NOT NULL,
   playerNr int CHECK (playerNr >= 0) NOT NULL,
   ranking int CHECK (ranking >= 0) NOT NULL,
   strikeRate float(1) NOT NULL,
   noOfCenturies int CHECK (noOfCenturies >= 0),
   CONSTRAINT Batsman_UC1 UNIQUE(ranking),
   CONSTRAINT Batsman_UC2 UNIQUE(playerNr),
   CONSTRAINT Batsman_PK PRIMARY KEY(batsmanNr)
)
GO
CREATE TABLE ProjectInitial.Bowler
(
   bowlerNr int CHECK (bowlerNr >= 0) NOT NULL,
   bowlingStyle varchar(30) NOT NULL,
   economy float(1) NOT NULL,
   playerNr int CHECK (playerNr >= 0) NOT NULL,
totalRunsConceded int CHECK (totalRunsConceded >= 0) NOT NULL,
   noOfWicket int CHECK (noOfWicket >= 0),
   CONSTRAINT Bowler_UC UNIQUE(playerNr),
   CONSTRAINT Bowler_PK PRIMARY KEY(bowlerNr)
)
GO
CREATE TABLE ProjectInitial."Match"
(
   matchNr int CHECK (matchNr >= 0) NOT NULL,
   stadiumName nvarchar(30) NOT NULL,
   CONSTRAINT Match_PK PRIMARY KEY(matchNr)

 
 )
GO
CREATE TABLE ProjectInitial.TeamPlaysMatchOnDate
(
   matchNr int CHECK (matchNr >= 0) NOT NULL,
   teamName nvarchar(30) NOT NULL,
   date date NOT NULL,
CONSTRAINT TeamPlaysMatchOnDate_PK PRIMARY KEY(teamName, matchNr)
)
GO
CREATE TABLE ProjectInitial.Stadium
(
   stadiumName nvarchar(30) NOT NULL,
   cityName nvarchar(30) NOT NULL,
   CONSTRAINT Stadium_PK PRIMARY KEY(stadiumName)
)
GO
CREATE TABLE ProjectInitial.StadiumIsAvailableOnDatesAvailable
(
   stadiumName nvarchar(30) NOT NULL,
   datesAvailable date NOT NULL,
CONSTRAINT StadiumIsAvailableOnDatesAvailable_PK PRIMARY KEY(stadiumName, datesAvailable)
)
GO
ALTER TABLE ProjectInitial.Team ADD CONSTRAINT Team_FK FOREIGN KEY (coachName) REFERENCES ProjectInitial.Coach (coachName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE ProjectInitial.Player ADD CONSTRAINT Player_FK FOREIGN KEY (teamName) REFERENCES ProjectInitial.Team (teamName) ON DELETE NO ACTION ON UPDATE NO ACTION


GO
ALTER TABLE ProjectInitial.Batsman ADD CONSTRAINT Batsman_FK1 FOREIGN KEY (playerNr) REFERENCES ProjectInitial.Player (playerNr) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE ProjectInitial.Batsman ADD CONSTRAINT Batsman_FK2 FOREIGN KEY (batsmanNr) REFERENCES ProjectInitial.Player (playerNr) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE ProjectInitial.Bowler ADD CONSTRAINT Bowler_FK1 FOREIGN KEY (playerNr) REFERENCES ProjectInitial.Player (playerNr) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE ProjectInitial.Bowler ADD CONSTRAINT Bowler_FK2 FOREIGN KEY (bowlerNr) REFERENCES ProjectInitial.Player (playerNr) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE ProjectInitial."Match" ADD CONSTRAINT Match_FK FOREIGN KEY (stadiumName) REFERENCES ProjectInitial.Stadium (stadiumName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE ProjectInitial.TeamPlaysMatchOnDate ADD CONSTRAINT TeamPlaysMatchOnDate_FK1 FOREIGN KEY (teamName) REFERENCES ProjectInitial.Team (teamName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE ProjectInitial.TeamPlaysMatchOnDate ADD CONSTRAINT TeamPlaysMatchOnDate_FK2 FOREIGN KEY (matchNr) REFERENCES ProjectInitial."Match" (matchNr) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE ProjectInitial.StadiumIsAvailableOnDatesAvailable ADD CONSTRAINT StadiumIsAvailableOnDatesAvailable_FK FOREIGN KEY (stadiumName) REFERENCES ProjectInitial.Stadium (stadiumName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO 
GO

insert into ProjectInitial.Coach
values
('tushar','1987-02-18','2015-11-09','2021-05-08'),
('ravi','1963-02-19','2012-10-09','2022-05-08'),
('alex','1972-02-16','2001-06-09','2021-05-08'),
('sahil','1984-02-15','2005-02-09','2023-05-08'),
('janak','1967-02-12','2017-12-09','2023-05-08'),
('joe','1963-04-01','2019-12-09','2022-05-08'),
('charlie','1966-02-10','2020-12-09','2021-05-08'),
('simon','1962-02-23','2007-12-09','2022-05-08'),
('dunken','1977-02-28','2018-12-09','2023-04-08'),
('chappel','1987-02-11','2017-12-09','2022-05-08');

insert into ProjectInitial.Team
values
('mumbai indians','tushar'),
('chennai super kings','ravi'),
('rajasthan royals','alex'),
('kolkata knight riders','sahil'),
('royal challengers bangalore','janak'),
('punjab kings','joe'),
('delhi capitals','charlie'),
('pune warriors','simon'),
('new york 11','dunken'),
('phoenix lions','chappel');

insert into ProjectInitial.Player
values
('10','23','India','Sachin','mumbai indians'),
('7','25','India','Dhoni','chennai super kings'),
('5','32','England','Butler','rajasthan royals'),
('16','34','West Indies','Narine','kolkata knight riders'),
('8','34','South Africa','AB De Villiers','royal challengers bangalore'),
('89','27','India','Zaheer','mumbai indians'),
('34','28','West Indies','Bravo','chennai super kings'),
('19','29','England','Jofra Archer','rajasthan royals'),
('99','31','West Indies','Russel','kolkata knight riders'),
('56','34','Australia','Glenn Maxwell','royal challengers bangalore'),
('11','24','Pakistan','ashwin','punjab kings'),
('71','26','Afghanistan','kl rahul','punjab kings'),
('55','33','England','rishab','delhi capitals'),
('66','35','West Indies','rabada','delhi capitals'),
('3','35','South Africa','ganguly','pune warriors'),
('88','28','Bangladesh','chahal','pune warriors'),
('35','29','Spain','gilchrist','new york 11'),
('18','30','Italy','mitchell','new york 11'),
('98','32','Russia','dale','phoenix lions'),
('53','35','Portugal','finch','phoenix lions');

insert into ProjectInitial.Bowler
values
('16','SPIN','8.3','16','280','20'),
('89','FAST','3.5','89','100','39'),
('34','FAST','5.2','34','132','36'),
('19','FAST','4.0','19','130','24'),
('56','SPIN','3.6','56','136','28'),
('11','SPIN','7.4','11','380','30'),
('66','FAST','3.6','66','200','29'),
('88','SPIN','5.4','88','142','16'),
('18','FAST','3.0','18','160','14'),
('98','FAST','2.6','98','236','48');

insert into ProjectInitial.Batsman
values
('10','50.3','10','1','188.2','100'),
('7','43.2','7','3','198.2','54'),
('5','40.8','5','4','138.2','36'),
('8','54.9','8','2','200.2','64'),
('99','42.5','99','10','168.2','21'),
('71','43.3','71','7','288.2','110'),
('55','49.2','55','11','98.2','14'),
('3','23.8','3','5','38.2','86'),
('35','64.9','35','8','170.2','4'),
('53','32.5','53','9','160.2','34');

insert into ProjectInitial.Stadium
values
('Eden Gardens','Kolkata'),
('Wankhede','Mumbai'),
('Narendra Modi Stadium','Ahmedabad'),
('DY Patil','Navi Mumbai'),
('Chinnaswamy','Chennai'),
('Chidambaram','Bangalore');

insert into ProjectInitial.Match
values
('20','Eden Gardens'),
('25','Wankhede'),
('28','Narendra Modi Stadium'),
('29','DY Patil'),
('30','Chinnaswamy'),
('34','Chidambaram ');

insert into ProjectInitial.TeamPlaysMatchOnDate
values
('20','Mumbai Indians','2021-03-08'),
('25','Chennai Super Kings','2021-03-09'),
('28','Rajasthan Royals','2021-03-07'),
('29','Kolkata Knight Riders','2021-03-10'),
('30','Royal Challengers Bangalore','2021-03-08'),
('34','Mumbai Indians','2021-03-28');

insert into ProjectInitial.StadiumIsAvailableOnDatesAvailable
values
('Eden Gardens','2021-04-08'),
('Eden Gardens','2021-03-28'),
('Eden Gardens','2021-03-18'),
('Wankhede','2021-04-23'),
('Wankhede','2021-05-01'),
('Wankhede','2021-04-01'),
('Wankhede','2021-04-28'),
('Wankhede','2021-03-31'),
('Narendra Modi Stadium','2021-03-23'),
('Narendra Modi Stadium','2021-03-18'),
('Chinnaswamy','2021-04-22'),
('Chinnaswamy','2021-04-15'),
('Chinnaswamy','2021-03-18'),
('DY Patil','2021-04-17'),
('DY Patil','2021-04-23'),
('Chidambaram','2021-03-07'),
('Chidambaram','2021-04-07'),
('Chidambaram','2021-04-27');

----------------------------------------UDF 1 Initialization----------------------------------------
USE ProjectInitial;
GO

IF OBJECT_ID('dbo.fnBowlerOfTournament') IS NOT NULL
DROP FUNCTION fnBowlerOfTournament
GO

CREATE FUNCTION fnBowlerOfTournament()
RETURNS int
BEGIN
    RETURN
    (SELECT MAX(noOfWicket) as MaxWickets
    FROM ProjectInitial.Bowler
    )
END;

----------------------------------------UDF 2 Initialization----------------------------------------

USE ProjectInitial;
GO

IF OBJECT_ID('dbo.fnBatsmanOfTournament') IS NOT NULL
DROP FUNCTION fnBatsmanOfTournament
GO

CREATE FUNCTION fnBatsmanOfTournament()
RETURNS int
BEGIN
    RETURN
    (SELECT MAX(noOfCenturies) as MaxAvg
    FROM ProjectInitial.Batsman
    )
END;

----------------------------------------UDF 3 Initialization----------------------------------------
USE ProjectInitial;
GO

IF OBJECT_ID('dbo.fnTeamNeedsNewCoach') IS NOT NULL
DROP FUNCTION fnTeamNeedsNewCoach
GO

CREATE FUNCTION fnTeamNeedsNewCoach()
RETURNS date
BEGIN
    RETURN
    (SELECT min(endDate) as minDate
    FROM ProjectInitial.coach
    -- where endDate = '2023-04-08'
    )
END;

select * from ProjectInitial.coach

----------------------------------------Calling UDF----------------------------------------
Use ProjectInitial;
SELECT *
FROM ProjectInitial.Bowler
WHERE noOfWicket = dbo.fnBowlerOfTournament();

Use ProjectInitial;
SELECT *
FROM ProjectInitial.Batsman
WHERE noOfCenturies = dbo.fnBatsmanOfTournament();

Use ProjectInitial;
SELECT teamName
FROM ProjectInitial.coach AS a
join ProjectInitial.Team AS b
ON a.coachName=b.coachName
WHERE endDate = dbo.fnTeamNeedsNewCoach();

----------------------------------------Trigger----------------------------------------

IF EXISTS (SELECT DB_ID('StadiumBookings'))
DROP TRIGGER ProjectInitial.StadiumBookings;
GO

CREATE TRIGGER StadiumBookings ON ProjectInitial.StadiumIsAvailableOnDatesAvailable
AFTER DELETE
AS
INSERT INTO StadiumBooked
(stadiumName, datesAvailable) 
SELECT stadiumName, datesAvailable FROM Deleted
PRINT 'Stadium has been booked.'

-------------------------------Query for Trigger Table----------------------------------

DROP TABLE ProjectInitial.StadiumBooked;
CREATE TABLE ProjectInitial.StadiumBooked
(
    stadiumName nvarchar(30) NOT NULL,
    -- cityName nvarchar(30) NOT NULL,
    datesAvailable date NOT NULL,
    -- CONSTRAINT Stadium_PK PRIMARY KEY(stadiumName)
)
GO

-----------------------------------Executing Trigger-------------------------------------

-- DELETE FROM ProjectInitial.StadiumIsAvailableOnDatesAvailable WHERE datesAvailable =  '2021-03-28' AND stadiumName = 'Eden Gardens';

-- SELECT * FROM ProjectInitial.StadiumBooked;


-----------------------------------Stored Procedure 1-------------------------------------

USE ProjectInitial;
GO

CREATE PROC stadiumAvailability
       @date VARCHAR(50)=''
AS

SELECT * FROM ProjectInitial.StadiumIsAvailableOnDatesAvailable
WHERE datesAvailable=@date
;

-- EXEC stadiumAvailability '2021-03-18';

-----------------------------------Stored Procedure 2-------------------------------------

USE ProjectInitial;
GO

CREATE PROC stadiumBooking
       @date VARCHAR(50)='',
       @stadiumName VARCHAR(50)=''
AS

DELETE FROM ProjectInitial.StadiumIsAvailableOnDatesAvailable WHERE datesAvailable = @date AND stadiumName = @stadiumName
PRINT 'Stadium has been booked.'
;


EXEC stadiumAvailability '2021-03-28';

-- EXEC stadiumBooking '2021-03-28','Eden Gardens';

-- SELECT * FROM ProjectInitial.StadiumBooked;