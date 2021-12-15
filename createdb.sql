CREATE TABLE "Room" (
  "id" varchar(5),
  "capacity" int,
  "species" varchar(50),
  CONSTRAINT "Room_pkey" PRIMARY KEY (id)
);

CREATE TABLE "Animal" (
  "id" int,
  "breed" varchar(50),
  "species" varchar(50),
  "birthdate" date,
  "height" int,
  "weight" int,
  "sex" varchar(10),
  "color" varchar(25) NULL,
  "date" date,
  "room_id" varchar(5),
 CONSTRAINT "Animal_pkey" PRIMARY KEY (id),
 CONSTRAINT animal_fk FOREIGN KEY (room_id) REFERENCES "Room"(id)
);

CREATE TABLE "Employee" (
  "id" char(11),
  "fullname" varchar(100),
  "adress" varchar(512),
  "position" varchar(25),
  "birthdate" date,
  "salary" numeric(6,2),
  "gender" varchar(10),
  "phone_number" varchar(11),
  CONSTRAINT "Employee_pkey" PRIMARY KEY (id)
);


CREATE TABLE "Care" (
  "animal_id" int,
  "employee_id" char(11),
  "details" varchar(50),
CONSTRAINT "Care_pkey" PRIMARY KEY (animal_id, employee_id),
CONSTRAINT care_fk FOREIGN KEY (animal_id) REFERENCES "Animal"(id),
CONSTRAINT care_fk_1 FOREIGN KEY (employee_id) REFERENCES "Employee"(id)

);


CREATE TABLE "Color" (
  "animal_id" int,
  "color_name" varchar(10),
CONSTRAINT "Color_pkey" PRIMARY KEY (color_name, animal_id),
CONSTRAINT color_fk FOREIGN KEY (animal_id) REFERENCES "Animal"(id)

);

CREATE TABLE "Treatment" (
  "id" varchar(10),
  "name" varchar(40),
  "details" varchar(512),
 CONSTRAINT "Treatment_pkey" PRIMARY KEY (id)
);

CREATE TABLE "Visitor" (
  "id" char(11),
  "fullname" varchar(100),
  "birthdate" date,
  "address" varchar(256),
  "gender" varchar(10),
  "phone_number" varchar(11),

CONSTRAINT "Visitor_pkey" PRIMARY KEY (id)
);


CREATE TABLE "Donation" (
  "visitor_id" char(11),
  "donation_amount" int,
  "donation_time" date,
  CONSTRAINT "Donation_pkey" PRIMARY KEY (donation_amount, donation_time, visitor_id),
CONSTRAINT donation_fk FOREIGN KEY (visitor_id) REFERENCES "Visitor"(id)
);


CREATE TABLE "Disease" (
  "id"         varchar(10),
  "name" varchar(40),
 CONSTRAINT "Disease_pkey" PRIMARY KEY (id)
);


CREATE TABLE "Cure" (
  "treatment_id" varchar(10),
  "disease_id" varchar(10),
  "cure_date" date,
 CONSTRAINT "Cure_pkey" PRIMARY KEY (treatment_id),
CONSTRAINT cure_fk FOREIGN KEY (treatment_id) REFERENCES "Treatment"(id),
CONSTRAINT cure_fk_1 FOREIGN KEY (disease_id) REFERENCES "Disease"(id)

);

CREATE TABLE "Shot" (
  "shot_id" varchar(10),
  "name" varchar(100),
  CONSTRAINT "Shot_pkey" PRIMARY KEY (shot_id)
);

CREATE TABLE "Adopt" (
  "visitor_id" char(11),
  "animal_id" int,
  "adopt_time" date,
 CONSTRAINT "Adopt_pkey" PRIMARY KEY (animal_id),
CONSTRAINT adopt_fk FOREIGN KEY (animal_id) REFERENCES "Animal"(id),
CONSTRAINT adopt_fk_1 FOREIGN KEY (visitor_id) REFERENCES "Visitor"(id)
);





CREATE TABLE "Have" (
  "disease_id" varchar(10),
  "animal_id" int,
  "starting_date" date,
 CONSTRAINT "Have_pkey" PRIMARY KEY (disease_id),
CONSTRAINT have_fk FOREIGN KEY (disease_id) REFERENCES "Disease"(id),
CONSTRAINT have_fk_1 FOREIGN KEY (animal_id) REFERENCES "Animal"(id)

);



CREATE TABLE "LivesIn"(
"animal_id" int,
"room_id" varchar(5),
CONSTRAINT "LivesIn_pkey" PRIMARY KEY (animal_id),
CONSTRAINT LivesIn_fk FOREIGN KEY (animal_id) REFERENCES "Animal"(id),
CONSTRAINT LivesIn_fk_1 FOREIGN KEY (room_id) REFERENCES "Room"(id)
);

CREATE TABLE "Visit" (
  "visitor_id" char(11),
  "visit_date" date,
CONSTRAINT "Visit_pkey" PRIMARY KEY (visit_date, visitor_id),
CONSTRAINT visit_fk FOREIGN KEY (visitor_id) REFERENCES "Visitor"(id)
);

CREATE TABLE "Receive" (
  "shot_id" varchar(10),
  "animal_id" int,
  "receive_date" date,
CONSTRAINT "Receive_pkey" PRIMARY KEY (shot_id),
CONSTRAINT receive_fk FOREIGN KEY (shot_id) REFERENCES "Shot"(shot_id),
CONSTRAINT receive_fk_1 FOREIGN KEY (animal_id) REFERENCES "Animal"(id)

);









INSERT INTO "Disease" (id, "name")  
VALUES(500, 'Ringworm'),
(501, 'Canine Distemper'),
(502, 'Canine Hepatitis'),
(503, 'Canine Parvovirus'),
(504, 'Feline Leukemia'),
(505, 'Ear Infections'), 
(506, 'Feline Peritonitis'),
(507, 'Hyperesthesia'),
(508, 'Feline URD'),
(509, 'Ringworm'),
(510, 'Skin Cancer'),
(511, 'Egg Binding'),
(512, 'Feline Asthma'),
(513, 'Gastritis'),
(514, 'Panleukopenia'),
(515, 'Anemia');

 
INSERT INTO "Treatment" (id, "name", details)
VALUES(1000, 'Fluid Administration', '3 dose per day for 7 days'),
(1001, 'Itraconazole ', '1 dose per day for 3 days'),
(1002, 'Corticosteroids ', '2 dose per day for 2 days'),
(1003, 'Antibiotics ', '3 dose per day for 5 days'),
(1004, 'Antiparasitic ', '4 dose per day for 3 days'),
(1005, 'Ear drops ', '3 dose per day for 7 days'),
(1006, 'Muscle Relaxants ', '2 dose per day for 3 days'),
(1007, 'Anti-inflammatory ', '5 dose per day for 8 days'),
(1008, 'Anti anxiety syrup ', '2 dose per day for 4 days'),
(1009, 'Chemotherapy', '1 dose per week for 5 weeks'),
(1010, 'Blood Coagulant ', '1 dose per week for 2 weeks');


INSERT INTO "Visitor"
VALUES (75090694421, 'Cristian McKenzie', '1961-04-22', '74531 Daija Flat Suite 402 Chico CA 95927', 'Male', 07109561440),
(35656249463, 'Bill Kihn', '1986-07-12', '5978 Jettie Divide Suite 144 Stirling City CA 95978', 'Male', 18833500607),
(39363235193, 'Emmalee Crooks', '1965-09-12', '51309 Mayert Falls Suite 283 Holtville CA 92250', 'Female', 74284589855),
(11291697784, 'Karli Kunze', '2002-07-09', '3660 King Drive Suite 700 Carmel CA 93922', 'Female', 61934512537),
(21298887662, 'Dario Considine', '1992-02-12', '69775 Geoffrey Overpass Apt 125 Sacramento CA 94230', 'Male', 21771704612),
(81269200036, 'Rowland Willms', '1978-01-28', '61623 Harris Station Suite 625 Pomona CA 91766', 'Male', 80351683426),
(66239509212, 'Braden Jakubowski', '1977-05-28', '646 Kuhn Tunnel Suite 554 Georgetown CA 95634', 'Male', 76158825291),
(85836377106, 'Annabel Wehner', '1983-06-06', '12886 Nyah Islands Suite 868 Fresno CA 93712', 'Female', 95489418373),
(18799493347, 'Savion Little', '1996-04-20', '6703 Barrows Parkway Holtville CA 92250', 'Male', 43777868664),
(34422764694, 'Joesph Towne', '1990-06-02', '62863 Alana Extensions Apt 610 Pasadena CA 91102', 'Male', 02505211392),
(61819916093, 'Fabiola Jacobi', '1970-02-19', '382 Eleonore Estate Fresno CA 93708', 'Female', 85162661955);

 INSERT INTO "Visit"
VALUES (75090694421,'2019-07-30'),
(35656249463,'2017-06-23'),
(39363235193,'2019-04-07'),
(39363235193,'2019-08-17'),
(39363235193,'2020-03-05'),
(39363235193,'2020-07-12'),
(39363235193,'2021-02-04'),
(11291697784,'2019-12-16'),
(21298887662,'2019-12-09'),
(81269200036,'2018-11-24'),
(81269200036,'2019-10-25'),
(81269200036,'2020-04-01'),
(81269200036,'2020-09-28'),
(81269200036,'2021-01-12'),
(66239509212,'2021-02-13'),
(85836377106,'2020-08-09'),
(18799493347,'2019-07-24'),
(34422764694,'2017-07-04'),
(61819916093,'2020-12-25');

 INSERT INTO "Donation"
VALUES (75090694421, 350, '2019-07-30'),
(35656249463, 650, '2017-06-23'),
(39363235193, 100, '2020-03-05'),
(11291697784, 700, '2019-08-30'),
(21298887662, 35,'2019-12-09'),
(81269200036, 150, '2020-04-01'),
(66239509212, 1200, '2021-02-13'),
(85836377106, 40, '2020-08-09'),
(18799493347, 30, '2018-05-30'),
(18799493347, 20, '2021-01-08'),
(34422764694, 300, '2018-02-12');

 

INSERT INTO "Employee" 
VALUES (79416253015, 'Amir Halvorson', '33467 Doug Ports Fresno CA 93888', 'Manager', date '1976-11-24',7000.00, 'Male', 40939013822),
(54517880826, 'Aniyah Nader', '2394 Graham Causeway Suite 972 Garden Valley CA 95633', 'Manager', date '1975-09-08', 7000.00, 'Female', 87248177866),
(89035488983, 'Sophie Wuckert', '1965 Ullrich Fork Apt 673 Fresno CA 93708', 'Security Guard', date '1984-08-07', 3500.00, 'Female', 77866142420),
(82786933780, 'Brock Beahan', '746 Stokes Crossroad Big Pine CA 93513', 'Security Guard', date '1979-03-08',3500.00, 'Male', 15328209971),
(65417909368, 'Meta Torp', '438 Zackery Union Apt 389 Agoura Hills CA 91376', 'Cook', date '1983-03-02', 3500.00, 'Female', 17396691104),
(85039341646, 'Duncan Steuber', '307 Ryder Cove Suite 235 Clovis CA 93611','CareTaker', date '1974-10-07', 3500.00, 'Male', 12728451553),
(78498411190, 'Beth Spinka', '86668 Torp Turnpike Suite 062 Hoopa CA 95546', 'CareTaker', date '1990-05-03', 3000.00, 'Female', 19635974176),
(32047440750, 'Naomi Bernhard', '380 Price Canyon Los Angeles CA 90032', 'Vet', date '1979-06-08', 3000.00, 'Female', 71063532616),
(41378574200, 'Sidney Lueilwitz', '4720 Fern Path Suite 829 Coalinga CA 93210', 'Vet', date '1988-01-30', 3000.00, 'Male', 16544538932),
(78452048250, 'Santino Parker', '3991 Jamar Ville Herlong CA 96113', 'Cleaning Staff', date '1992-10-28', 3000.00, 'Male', 14262591731),
(37625370566, 'Benton Ankunding', '918 Georgianna Spurs Suite 091 Salinas CA 93901', 'Cleaning Staff', date '1980-11-11', 3000.00, 'Male', 26273348598),
(58949224800, 'Era McGlynn', '743 Sauer Oval Apt 135 Westport CA 95488', 'Vet', date '1991-11-09', 3800.00, 'Female', 75190624898);


INSERT INTO "Room" (id, capacity, species)
VALUES('1A', 10 , 'Dog'),
('1B', 10, 'Dog'),
('1C', 10, 'Dog'),
('1D', 10 , 'Dog'),
('1E', 10 , 'Dog'),
('1F', 10, 'Dog'),
('1G', 10 , 'Dog'),
('1H', 10 , 'Dog'),
('1K', 10 , 'Dog'),
('2A', 10 , 'Cat'),
('2B', 10 , 'Cat'),
('3A', 10 , 'Bird'),
('3B', 10, 'Bird');

INSERT INTO "Animal" (id, breed, species, birthdate, height, weight, sex, "date",room_id)
VALUES(1, 'Abyssinian', 'Cat', date '2010-8-17', 40, 43, 'Male', date '2010-07-25', '2A'),
(2, 'Poodle', 'Dog', date '2017-6-21', 98, 46, 'Male', date '2019-07-08', '1D'),
(3, 'Abyssinian', 'Cat', date '2010-12-19', 80, 33, 'Female', date '2021-12-05', '2B'),
(4, 'Bulldog', 'Dog', date '2008-6-28', 67, 49, 'Male', date '2008-02-03', '1D'),
(5, 'Golden', 'Dog', date '2011-9-23', 24, 45, 'Male', date '2019-06-07', '1D'),
(6, 'Balinese', 'Cat', date '2020-4-10', 37, 20, 'Male', date '2021-02-04', '2A'),
(7, 'Balinese', 'Cat', date '2010-1-15', 97, 31, 'Male', date '2020-04-03', '2B'),
(8, 'Husky', 'Dog', date '2013-09-18', 51, 27, 'Female', date '2019-05-03', '1B'),
(9, 'Budgie', 'Bird', date '2009-12-19', 84, 43, 'Male', date '2009-04-01', '3A'),
(10, 'Labrador', 'Dog', date '2009-6-7', 84, 29, 'Male', date '2019-06-04', '1F'),
(11, 'Labrador', 'Dog', date '2017-5-12-', 29, 48, 'Male', date '2017-04-09', '1D'),
(12, 'Husky', 'Dog', date '2009-6-24', 29, 21, 'Female', date '2010-07-20', '1B'),
(13, 'Poodle', 'Dog', date '2013-03-20', 90, 35, 'Male', date '2015-10-11', '1A'),
(14, 'Balinese', 'Cat', date '2005-02-15', 78, 42, 'Male', date '2007-09-09', '2A'),
(15, 'Parrot', 'Bird', date '2020-07-17', 65, 35, 'Male', date '2021-02-03', '3A'),
(16, 'Poodle', 'Dog', date '2016-10-06', 70, 32, 'Female', date '2019-07-10', '1H'),
(17, 'Budgie', 'Bird', date '2006-5-20', 36, 26, 'Female', date '2008-11-26', '3A'),
(18, 'Bulldog', 'Dog', date '2019-10-6', 99, 30, 'Male', date '2020-11-22', '1D'),
(19, 'Husky', 'Dog', date '2010-9-24', 68, 5, 'Female', date '2017-05-08', '1E'),
(20, 'Abyssinian', 'Cat', date '2010-3-5', 41, 13, 'Male', date '2018-10-11', '2A'),
(21, 'Poodle', 'Dog', date '2011-7-5', 58, 11, 'Male', date '2018-3-15', '1G');


INSERT INTO "Have" (disease_id, animal_id, starting_date)  
VALUES (500, 1, '2020-09-25'), 
(501,2,'2020-04-08'), 
(502,4, '2016-03-01'), 
(503,8,'2020-07-12'), 
(504,14, '2020-01-04'), 
(505, 9, '2016-06-11'), 
(506, 7, '2016-04-11'), 
(507,14,'2016-03-24'),
(508,7,'2020-07-24'), 
(509,7,'2020-09-12'), 
(510,8,'2018-11-17'), 
(511,9,'2017-05-29'),
(512,3,'2020-11-12'), 
(513,6,'2021-03-25'), 
(514,8,'2019-04-23'), 
(515,9,'2018-05-31'); 


INSERT INTO "Cure" (treatment_id,disease_id,cure_date)
VALUES (1000, 514, '2019-04-30'),
(1001 ,500, '2020-09-30'),
(1002 ,502, '2020-06-05'),
(1003 ,513, '2020-12-08'),
(1004 ,504, '2020-05-08'),
(1005 ,505, '2020-08-15'),
(1006 ,506, '2020-01-28'),
(1007 ,507, '2021-12-10'),
(1008 ,508, '2020-03-10'),
(1009 ,510, '2019-04-23'),
(1010 ,512, '2018-05-31');

 
INSERT INTO "Color" (animal_id, color_name)
VALUES(1, 'black'),
(2,'black'),
(3, 'white'),
(4,'orange'),
(4, 'brown'),
(5, 'white'),
(6,'brown'),
(7,'orange'),
(8,'ash black'),
(9, 'gray'),
(10,'gold'),
(11, 'ash brown'),
(12,'ashy red'),
(13,'cream'),
(14,'black'),
(15,'red'),
(15,'green'),
(15,'blue'),
(16,'gold'),
(17,'green'),
(18,'black'),
(19, 'ash gray'),
(20, 'gray'),
(20, 'white'),
(21, 'black');
 
 
INSERT INTO "Adopt" (visitor_id, animal_id, adopt_time)
VALUES (75090694421,1,'2011-10-11'),
(75090694421,2,'2021-12-23'),
(35656249463,3,'2021-01-17'),
(39363235193,4,'2018-03-08'),
(21298887662,5,'2019-10-26'),
(66239509212,6,'2020-06-20'),
(21298887662,7,'2021-02-12'),
(66239509212,8,'2021-03-26'),
(85836377106,9,'2017-11-05'),
(18799493347,10,'2019-10-07'),
(34422764694,11,'2021-06-04');

 INSERT INTO "Care" (animal_id, employee_id, details)
VALUES (1,32047440750,'treatment'), 
(2,32047440750,'treatment'),  
(3,41378574200,'treatment'), 
(4,32047440750,'treatment'), 
(7,32047440750,'treatment'),
(8,41378574200,'treatment'), 
(10,41378574200,'treatment'), 
(11, 85039341646,'food,washing'),
(12,78498411190,'food,washing'),
(12,32047440750,'treatment'),
(13,85039341646,'food,washing'),
(13,32047440750,'treatment'), 
(14,78498411190,'food,washing'),
(14,41378574200,'treatment'),  
(15,85039341646,'food,washing' ),
(16,78498411190,'food,washing'),
(17,85039341646,'food,washing'),
(18,78498411190,'food,washing'),
(19,85039341646,'food,washing'),
(19,32047440750,'treatment'),
(20,78498411190,'food,washing'),
(21,85039341646,'food,washing');

INSERT INTO "Shot"
VALUES('7000','Feline Rhinotracheitis (Feline Herpesvirus, FHV)'),
('7001','Feline Rhinotracheitis (Feline Herpesvirus, FHV)'),
('7002','Canine parainfluenza virus (CPi)'),
('7003','Feline Calicivirus (FCV)'),
('7004','Canine parainfluenza virus (CPi)'),
('7005','Canine parainfluenza virus (CPi)'),
('7006','Canine Adenovirus (CAV)'),
('7007','Canine parainfluenza virus (CPi)'),
('7008','Bordetella bronchiseptica'),
('7009','Feline Rhinotracheitis (Feline Herpesvirus, FHV)'),
('7010','Feline Parainbronchia (Feline Herpesvirus, FHP)'),
('7011','Feline Rhinotracheitis (Feline Herpesvirus, FHV)');

INSERT INTO "Receive" (shot_id,animal_id,receive_date)
VALUES ('7000',1,'2014-11-17'),
('7001',2,'2012-12-13'),
('7002',3,'2013-09-14'),
('7003',3,'2016-11-06'),
('7004',3,'2011-01-01'),
('7005',2,'2015-06-18'),
('7006',5,'2016-07-25'),
('7007',5,'2016-08-25'),
('7008',11,'2018-07-25'),
('7009',5,'2017-07-21'),
('7010',11,'2014-11-11'),
('7011',11,'2014-11-11');

insert into "LivesIn" (animal_id,room_id)
values ('1','1A'),
('2','1B'),
('3','1C'),
('4','1D'),
('5','1E'),
('6','1F'),
('7','1G'),
('8','1H'),
('9','1K'),
('10','2A'),
('11','2B'),
('12','3A'),
('13','1A'),
('14','1B'),
('15','1C'),
('16','1D'),
('17','1E'),
('18','1F'),
('19','1G'),
('20','1H'),
('21','1K');



ALTER TABLE "Room" DROP COLUMN species;
ALTER TABLE "Animal" DROP COLUMN room_id;
ALTER TABLE "Animal"  DROP COLUMN color;


CREATE VIEW "vEmployee" AS
SELECT id, fullname, position, birthdate, gender, phone_number
FROM "Employee" ;

INSERT INTO "vEmployee" (id, fullname, position, birthdate, gender, phone_number)
VALUES (69567384051, 'Gregoria Dibbert','Cleaning Staff','1970-02-11','Female', 14203183034);



DELETE FROM "Have" WHERE disease_id='515';
DELETE FROM "Disease" WHERE id='515';
DELETE FROM "Cure" WHERE treatment_id='1010';
DELETE FROM "Treatment" WHERE id='1010';
DELETE FROM "Adopt" WHERE visitor_id='34422764694';
DELETE FROM "Donation" WHERE visitor_id='34422764694';
DELETE FROM "Visit" WHERE visitor_id='34422764694';
DELETE FROM "Visitor" WHERE id='34422764694';
DELETE FROM "Employee" WHERE id='37625370566';
DELETE FROM "LivesIn" WHERE animal_id='21';
DELETE FROM "Room" WHERE id='3B';
DELETE FROM "Color" WHERE animal_id='21';
DELETE FROM "Care" WHERE animal_id='21';
DELETE FROM "Animal" WHERE id='21';
DELETE FROM "Receive" WHERE shot_id='7011';
DELETE FROM "Shot" WHERE shot_id='7011';
DELETE FROM "vEmployee" WHERE id='65417909368';



UPDATE "Have" SET starting_date='2020-04-09' WHERE disease_id='501';
UPDATE "Disease" SET name='Stress' WHERE id='513';
UPDATE "Cure" SET cure_date='2013-02-05' WHERE treatment_id='1005';
UPDATE "Treatment" SET details='two dose per week for three weeks' WHERE id='1009';
UPDATE "Visitor" SET address='399 Green Hill Avenue San Pablo CA 94806' WHERE id='81269200036';
UPDATE "Visit" SET visit_date='2020-11-27' WHERE visitor_id='85836377106';
UPDATE "Donation" SET donation_amount='5000' WHERE visitor_id='21298887662';
UPDATE "Employee" SET fullname='Meltem Esra' WHERE id='65417909368';
UPDATE "Room" SET capacity='7' WHERE id='1D';
update "LivesIn" set room_id='2A' where animal_id='20';
UPDATE "Color" SET color_name='yellow' WHERE animal_id='11';
UPDATE "Care" SET employee_id='85039341646' WHERE animal_id='14' and details='food,washing';
UPDATE "Animal" SET height='100' WHERE id='21';
UPDATE "Adopt" SET adopt_time='2021-01-26'  WHERE visitor_id=' 66239509212' ;
UPDATE "Receive" SET receive_date='2018-08-16'  WHERE shot_id='7007';
UPDATE "Shot" SET name='Feline Adenovirus (FAV)'  WHERE shot_id='7006';
UPDATE "vEmployee" SET phone_number='83574572190'  WHERE id='78498411190';
