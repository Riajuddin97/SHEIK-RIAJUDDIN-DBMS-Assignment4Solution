/* Create a new database */
create database TravelOnTheGo;

/*start using the database */
use TravelOnTheGo;

/*create table  PASSENGER */
create table PASSENGER(PASSENGER_name varchar(50) primary key,
						Category varchar(10),
                        Gender varchar(10),
                        Boarding_City varchar (25),
                        Destination_City varchar (25),
                        Distance int,
                        Bus_Type varchar(20) 
                        );

/*create table  PRICE */
create table PRICE (Bus_Type varchar (10),
					Distance int,
                    Price int
					);
    
/* Insert values into PASSENGER values */    
insert into PASSENGER (PASSENGER_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type ) values('Sejal','AC', 'F', 'Bengaluru', 'Chennai', '350', 'Sleeper');
insert into PASSENGER (PASSENGER_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type ) values('Anmol','Non-AC', 'M', 'Mumbai', 'Hyderabad', '700', 'Sitting');
insert into PASSENGER (PASSENGER_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type ) values('Pallavi','AC', 'F','Panaji', 'Bengaluru', '600', 'Sleeper');
insert into PASSENGER (PASSENGER_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type ) values('Khusboo','AC', 'F', 'Chennai', 'Mumbai', '1500', 'Sleeper');
insert into PASSENGER (PASSENGER_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type ) values('Udit','Non-AC', 'M', 'Trivandrum', 'Panaji', '1000', 'Sleeper');
insert into PASSENGER (PASSENGER_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type ) values('Ankur','AC', 'M', 'Nagpur', 'Hyderabad', '500', 'Sitting');
insert into PASSENGER (PASSENGER_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type ) values('Hemanth','Non-AC', 'M', 'Panaji', 'Mumbai', '700', 'Sleeper');
insert into PASSENGER (PASSENGER_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type ) values('Manish','Non-AC', 'M','Hyderabad', 'Bengaluru', '500', 'Sitting');
insert into PASSENGER (PASSENGER_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type ) values('Piyush','AC', 'M', 'Pune', 'Nagpur', '700', 'Sitting');

/* Insert values into PRICE values */
insert into PRICE (Bus_Type, Distance,Price) values ('Sleeper', '350', '770');
insert into PRICE (Bus_Type, Distance,Price) values ('Sleeper', '500', '1100');
insert into PRICE (Bus_Type, Distance,Price) values ('Sleeper', '600', '1320');
insert into PRICE (Bus_Type, Distance,Price) values ('Sleeper', '700', '1540');
insert into PRICE (Bus_Type, Distance,Price) values ('Sleeper', '1000', '2200');
insert into PRICE (Bus_Type, Distance,Price) values ('Sleeper', '1200', '2640');
insert into PRICE (Bus_Type, Distance,Price) values ('Sleeper', '350', '434');
insert into PRICE (Bus_Type, Distance,Price) values ('Sitting', '500', '620');
insert into PRICE (Bus_Type, Distance,Price) values ('Sitting', '500', '620');
insert into PRICE (Bus_Type, Distance,Price) values ('Sitting', '600', '744');
insert into PRICE (Bus_Type, Distance,Price) values ('Sitting', '700', '868');
insert into PRICE (Bus_Type, Distance,Price) values ('Sitting', '1000', '1240');
insert into PRICE (Bus_Type, Distance,Price) values ('Sitting', '1200', '1488');
insert into PRICE (Bus_Type, Distance,Price) values ('Sitting', '1500', '1860');

select * from PASSENGER;

/* query for How many females and how many male passengers travelled for a minimum distance of 600 KM */
SELECT Gender,COUNT(1) FROM Passenger WHERE Distance >= 600 GROUP BY Gender;

/*Query to Find the minimum ticket price for Sleeper Bus*/
SELECT MIN(Price) FROM Price WHERE bus_Type = 'Sleeper';

/*Query to Select passenger names whose names start with character 'S'*/
SELECT Passenger_name FROM Passenger WHERE Passenger_name LIKE 'S%';

/*Query to Calculate price charged for each passenger displaying Passenger name, Boarding City,
Destination City, Bus_Type, Price in the output */
SELECT Passenger_name, Boarding_City, Destination_City, prc.Bus_Type, Price FROM Passenger pss, Price prc
WHERE pss.Distance = prc.Distance AND pss.Bus_Type = prc.Bus_Type
GROUP BY Passenger_name;

/*Query for What is the passenger name and his/her ticket price who travelled in Sitting bus for a
distance of 1000 KM s */
SELECT Passenger_name, Price From Passenger pss, Price prc WHERE pss.Distance = prc.Distance
AND pss.Bus_Type = prc.Bus_Type AND pss.Bus_Type = 'Sitting' AND prc.Distance = 1000;

/*Query for What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to
Panaji? */
SELECT Bus_Type, Price FROM Price WHERE Distance = (SELECT Distance FROM Passenger WHERE Passenger_name = 'Pallavi')
group by Bus_Type;


/*Query for List the distances from the "Passenger" table which are unique (non-repeated
distances) in descending order. */
SELECT DISTINCT (Distance) FROM Passenger ORDER BY Distance DESC;


/*Query to  Display the passenger name and percentage of distance travelled by that passenger
from the total distance travelled by all passengers without using user variables */

select sum(Distance) from Passenger;
select Passenger_name, Distance * 100 /sum(Distance) over() as percentagetrvel
from Passenger;

/*Query for Display the distance, price in three categories in table Price
a) Expensive if the cost is more than 1000
b) Average Cost if the cost is less than 1000 and greater than 500
c) Cheap otherwise */


select * from price;
SELECT Distance, Price,
CASE
    WHEN Price >1000 THEN 'Expensive'
    WHEN Price < 1000 AND Price > 500 THEN 'Average Cost'
    ELSE 'Cheap'
END AS Cost_Category
FROM Price;


