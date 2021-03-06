USE master
GO


-- Suppression / création de la base de donnée
DROP DATABASE IF EXISTS Film;
GO
CREATE DATABASE Film;
GO

USE Film
GO


--Suppression dans une premier temps des tables de liaison
DROP TABLE IF EXISTS Film_Acteur
DROP TABLE IF EXISTS Film_Realisateur
DROP TABLE IF EXISTS Film_Studio
DROP TABLE IF EXISTS Film_Producteur
DROP TABLE IF EXISTS Recompense_Film
DROP TABLE IF EXISTS Recompense_Acteur
DROP TABLE IF EXISTS Recompense_Realisateur
DROP TABLE IF EXISTS Recompense_Producteur

-- Suppression des table contenent les informations 
DROP TABLE IF EXISTS Acteur
DROP TABLE IF EXISTS Realisateur
DROP TABLE IF EXISTS Producteur
DROP TABLE IF EXISTS Film
DROP TABLE IF EXISTS Studio
DROP TABLE IF EXISTS Recompense 





-- table Film

   --creation de la table
   CREATE TABLE Film(
   ID_Film int not null IDENTITY,
   Nom VARCHAR(100) not null,
   DateSortie DATE not null,
   PaysOrigine Varchar (30) not null,
   BoxOffice int not null,
   CONSTRAINT Film_PK PRIMARY KEY (ID_Film),
   CONSTRAINT Film_BoxOffice CHECK (BoxOffice>0)
  )
  Go


  --insérer des lignes 
  INSERT INTO Film (Nom,DateSortie,PaysOrigine,BoxOffice)
  VALUES ('Dernier Train pour Buzan','17/08/2016','Corée du Sud',98500000),--1

         ('Croc-Blanc','15/04/1994','Etats-Unis',8878839),--2
		 ('Danse avec les loups','19/09/1990','Etats-Unis',424208000),--3
		 ('Van Helsing','05/05/2004','Etats-Unis',300200000),--4
		 ('La cité de la peur','09/03/1994','France',13200000),--5

		 ('Kick-ass', '21/04/2010', 'Etats-Unis',96188903),--6
		 ('Insaisissables', '21/05/2013', 'Etats-Unis', 351700000),--7 

		 ('Star Wars, épisode IV : Un nouvel espoir de George Lucas','25/05/1977','États-Unis',777398007),--8
		 ('Star Wars, épisode V : L''Empire contre-attaque','21/05/1980','États-Unis',533375067), --9
		 ('Star Wars, épisode VI : Le Retour du Jedi','25/05/1983','États-Unis',475106177),--10
		 ('Star Wars, épisode I : La Menace fantôme','19/05/1999','États-Unis',1027044677), --11
		 ('Star Wars, épisode II : L''Attaque des clones','16/05/2002','États-Unis',649398328), --12
		 ('Star Wars, épisode III : La Revanche des Sith','19/05/2005','États-Unis',848754768),--13

		 ('Fenêtre sur cour', '01/04/1955', 'États-Unis', 36800000), --14
		 ('Joker', '02/10/2019', 'Etats-Unis', 1074000000),--15
		 ('La ligne verte', '01/03/2000', 'Etats-Unis', 268800000),--16 

		 ('La Haine','31/05/1995','France',15300000),--17
		 ('Microcosmos','20/11/1996','France',52800000)--18


-- table acteur 

   --creation de la table
   CREATE TABLE Acteur (
      ID_Acteur int not null IDENTITY,
      Nom Varchar (30) not null,
      Prenom Varchar (30) not null,
      DateNaissance Date not null,
      PaysOrigine Varchar (30) not null,
      CONSTRAINT Acteur_PK PRIMARY KEY (ID_Acteur),
   )
  GO


  --insérer des lignes 
  INSERT INTO Acteur (Nom,Prenom,DateNaissance,PaysOrigine)
  VALUES ('Yoo','Gong','10/07/1979','Corée du Sud'),--1
         ('Jung','Yu-mi','18/01/1983','Corée du Sud'),--2
		 ('Dong-Seok','Ma','01/03/1971','Corée du Sud'),--3
		 ('Choi','Woo-Sik','26/03/1990','Corée du Sud'),--4
		 ('Kim','Su-An','27/01/2006','Corée du Sud'),--5
		 ('Kim','Eui-Sung','17/01/1965','Corée du Sud'),--6
		 ('So Hee','Ahn','27/06/1992','Corée du Sud'),--7
		 --2
		 ('Hawke','Ethan','06/11/1970','Etats-Unis'),--8
		 ('Maria Brandauer','Klaus','22/06/1943','Autriche'),--9
		 ('Cassel','Seymour','22/01/1935','Etats-Unis'),--10
		 ('Remar','James','31/12/1953','Etats-Unis'),--11
		 ('Moseley','Bill','11/11/1951','Etats-Unis'),--12
		 --6
		 ('Grace Moretz', 'Chloe', '10/02/1997', 'Etats-Unis'),--13
         ('Taylor-Johson', 'Aaron', '13/06/1990', 'Angleterre'),--14
         ('Mintz-Plasse', 'Christopher', '20/06/1989', 'Etats-Unis'),--15
         ('Fonseca', 'Lindsy', '07/01/1987', 'Etats-Unis'),--16
		 --7
		 ('Eisenberg', 'Jesse', '5/10/1983',' Etats-Unis'),--17
         ('Franco','Dave', '12/11/1985', 'Etats-Unis'),--18
         ('Harrelson', 'Woody', '23/11/1961', 'Etats-Unis'),--19
         ('Ruffalo', 'Mark', '22/11/1967', 'Etats-Unis'),--20

		 ('Richard Hamill','Mark','25/09/1951','États-Unis'),--21 
         ('Ford','Harrison','13/07/1942','États-Unis'),--22 
         ('Fisher','Carrie','21/10/1956','États-Unis'),--23 
         ('Cushing','Peter','26/05/1913','Royaume-Uni'),--24 
         ('Guinness de Cuffe','Alec','02/04/1914','Royaume-Uni'),--25 
         ('Prowse','David','01/07/1935','Royaume-Uni'),--26 
         ('Daniels','Anthony','21/02/1946','Royaume-Uni'),--27 
         ('Baker','Kenny','24/08/1934','Royaume-Uni'),--28 
         ('Oz','Frank','25/05/1944','Royaume-Uni'),--29 
         ('Christensen','Hayden','19/04/1981','Canada'),--30
		 --4
		 ('Jackman','Hugh','12/10/1968','Australie'),--31
         ('Beckinsale','Kate','26/07/1973','Angleterre'),--32
		 ('Roxburgh','Richard','23/01/1962','Australie'),--33
         ('Kemp','Will','29/06/1977','Angleterre'),--34
         ('Anaya','Elena','17/07/1975','Espagne'),--35
         ('O''Connor','Kevin J.','15/11/1963','Etats-Unis'),--36
         ('Wenham','David','21/09/1965','Australie'),--37
         ('Colloca','Silvia','23/07/1977','Italie'),--38
		 --3
        ('Costner','Kevin','18/01/1955','Etats-Unis'),--39
        ('Mcdonnell','Mary','28/04/1952','Etats-Unis'),--40
        ('Grant','Rodney A.','09/03/1959','Etats-Unis'),--41
        ('Westerman','Floyd','17/08/1936','Etats-Unis'),--42
        ('Cardinal','Tantoo','20/07/1950','Canada'),--43
        ('Pastorelli','Robert','21/06/1954','Etats-Unis'),--44
        ('Rocket','Charles','24/08/1949','Etats-Unis'),--45
        ('Chaykin','Maury','27/07/1949','Canada'),--46
		--5
        ('Lauby','Chantal','23/03/1948','France'),--47
        ('Chabat','Alain','24/11/1958','Algérie'),--48
        ('Farrugia','Dominique','02/09/1962','France'),--49
        ('Darmon','Gérard','29/02/1948','France'),--50
        ('Karmann','Sam','23/09/1953','France'),--51
        ('De Fourgerolles','Hélène','25/02/1973','France'),--52
        ('Karyo','Tchéky','04/09/1953','Turquie'),--53
        ('Bacri','Jean-Pierre','24/05/1951','Algérie'),--54
		--14
        ('Kelly','Grace','14/09/1929','Monaco'),--55
        ('Stewart','James','20/05/1908', 'Etats-Unis'),--56
        ('Ritter','Thelma','14/02/1902', 'Etats-Unis'),--57
        ('Burr','Raymond','21/05/1917', 'Etats-Unis'),--58
		--15
        ('De Niro', 'Robert', '17/08/1943', 'Etats-Unis'),--59
        ('Phoenix', 'Joaquin', '28/10/1974', 'Etats-Unis'),--60
        ('Beetz', 'Zazie', '01/06/1991', 'Allemagne'),--61
        ('Conroy', 'Frances', '15/05/1953', 'Etats-Unis'),--62
		--16
        ('Hanks', 'Tom', '09/07/1956','Etats-Unis'),--63
        ('Clarke Duncan', 'Michael','10/12/1957', 'Etats-Unis'),--64
        ('Rockwell', 'Sam', '05/11/1968', 'Etats-Unis'),--65
        ('Cromwell', 'James', '27/01/1940', 'Etats-Unis')--66






-- table relisateur

   --creation de la table
   CREATE TABLE Realisateur (
   ID_Realisateur INT not null IDENTITY,
   Nom VARCHAR(30) not null,
   Prenom VARCHAR(30) not null,
   DateNaissance Date not null,
   PaysOrigine Varchar (30) not null,
   CONSTRAINT Realisateur_PK PRIMARY KEY (ID_Realisateur),
   )
   GO


  --insérer des lignes 
  INSERT INTO Realisateur (Nom,Prenom,DateNaissance,PaysOrigine)
  VALUES ('Yeon','Sang-ho','01/01/1978','Corée du Sud'),--1
         ('Kleiser','Randal','20/07/1946','Etats-Unis'),--2
		 ('Jeff','Wadlow','02/03/1976','Etats-Unis'),--3
		 ('Leterrier', 'Louis', '17/06/1973', 'France'),--4

		 ('Lucas','George','14/05/1944','États-Unis'),--5
         ('Kershner','Irvin','29/04/1923','États-Unis'),--6
         ('Marquand','Richard','22/09/1937','Royaume-Uni'),--7

		 ('Sommers','Stephen','20/03/1962','Etats-Unis'),--8

        ('Costner','Kevin','18/01/1955','Etats-Unis'),--9
        ('Reynolds','Kevin','17/01/1952','Etats-Unis'),--10

		('Berbérian','Alain','02/07/1953','Liban'),--11

		('Hitchcok', 'Alfred', '13/08/1899', 'Angleterre'),--12

		('Phillips', 'Todd', '20/12/1970', 'Etats-Unis'),--13

		('rabont', 'Frank', '28/01/1959', 'France')--14





-- table producteur

   --creation de la table
   CREATE TABLE Producteur (
      ID_Producteur int not null IDENTITY,
      Nom Varchar (30) not null,
      Prenom Varchar (30) not null,
      DateNaissance Date not null,
      PaysOrigine Varchar (30) not null,
   ) 
   GO
   ALTER TABLE Producteur ADD CONSTRAINT Producteur_PK PRIMARY KEY (ID_Producteur);



  --insérer des lignes 
  INSERT INTO Producteur (Nom,Prenom,DateNaissance,PaysOrigine)
  VALUES ('Vaughn','Matthew', '07/03/1971','Angleterre'),--1
         ('Cohen', 'Bobby', '8/01/1970', 'Etats-Unis'),--2
         ('Orci', 'Roberto', '20/07/1973', 'Mexique'),--3
         ('Kurtzman', 'Alex', '7/09/1973', 'Etats-Unis'),--4

		 ('Lucas','George','14/05/1944','États-Unis'),--5    
         ('McCallum','Rick','22/08/1954','États-Unis'),--6
         ('Kurtz','Gary','27/07/1940','États-Unis'),-- 7 
         ('Kazanjian','Howard','26/07/1942','États-Unis'),-- 8

		 ('Sommers','Stephen','20/03/1962','Etats-Unis'),--9

		 ('Costner','Kevin','18/01/1955','Etats-Unis'),--10

		 ('Gassot','Charles','23/01/1947','France'),--11

		 ('Hitchcok','Alfred','13/08/1899','Angleterre'),--12

        ('Phillips', 'Todd', '20/12/1970', 'Etats-Unis'),--13
        ('Tilinger', 'Emma', '01/01/1972', 'Etats-Unis'),--14
        ('Cooper', 'Bradley', '05/01/1975', 'Etats-Unis'),--15

		('Darabont', 'Frank', '28/01/1959', 'France'),--16

		('Rossignon','Christophe','26/09/1959','France'),--17
		('Perrin','Jacques','13/07/1941','France')--18




-- table Studio

   --creation de la table
  CREATE TABLE Studio(
   ID_Studio INT not null IDENTITY,
   Nom VARCHAR(30) not null,
   DateCreation Varchar(4) not null,
   PaysOrigine Varchar (30) not null,
   CONSTRAINT Studio_PK PRIMARY KEY (ID_Studio),
   CONSTRAINT Studio_Date Check (Len(DateCreation)=4),
   )
   Go


  --insérer des lignes 
  INSERT INTO Studio (Nom,DateCreation,PaysOrigine) 
  VALUES ('Silver Screen Partners','1983','Etats-Unis'),--1
         ('Téléma Productions','1995','France'),--2
		 ('Universal Pictures','1912','Etats-Unis'),--3
		 ('TIG PRODUCTIONS','1990','Etats-Unis'),--4

		 ('Marv Films', '2004', 'Angleterre'),--5
         ('Lionsgate', '1997', 'Etats-Unis'),--6
         ('Plan B Enternaiment', '2001' , 'Etats-Unis'),--7

		 ('Summit Enternaiment', '1991', 'USA'),--8
         ('K/O Paper Products', '2005', 'Etats-Unis'),--9

		 ('20th Century Fox','1935','États-Unis'),--10

		 ('Paramount Pictures','1912', 'Etats-Unis'),--11

         ('Warner Bros', '1923', 'Etats-Unis'),--12
         ('Village Roadshow Pictures', '1986', 'Etats-Unis'),--13
         ('DC Films', '2016', 'Etats-Unis'),--14

		 ('Castle Rock Entertainment', '1987', 'Etats-Unis'),--15
		 ('PolyGram Filmed Entertainment', '1979', 'Etats-Unis')--16




-- table Recompense

   --creation de la table
    CREATE TABLE Recompense (
	ID_Recompense int not null IDENTITY,
	Nom Varchar (100) not null,
	CONSTRAINT Film_Recompense_PK PRIMARY KEY (ID_Recompense),
	)
	Go
	ALTER TABLE Recompense ADD CONSTRAINT Recompense_Nom UNIQUE(Nom);

  --insérer des lignes 
  INSERT INTO Recompense (Nom)
  VALUES('Oscar: Meilleure direction artistique'),--1
		('Oscar: Meilleurs costumes'),--2
		('Oscar: Meilleur son'),--3
		('Oscar: Meilleur montage'),--4
		('Oscar: Meilleurs effets visuels'),--5
		('Oscar: Meilleure musique originale'),--6
		('Oscar: pour une contribution spéciale'),--7

		('Los Angeles Film Critics Association Awards: Meilleur film'),--8
		('Los Angeles Film Critics Association Awards: Meilleure musique'),--9

		('Golden Globes: Meilleure musique de film'),--10

		('Saturn Awards: Meilleur film de science-fiction'),--11
		('Saturn Awards: Meilleur scénario'),--12
		('Saturn Awards: Meilleure musique'),--13
		('Saturn Awards: Meilleurs costumes'),--14
		('Saturn Awards: Meilleur maquillage'),--15
		('Saturn Awards: Meilleurs effets spéciaux'),--16

		('Grammy Awards: Meilleure musique de film'),--17

		('Prix Hugo: Meilleur film dramatique'),--18

		('People''s Choice Awards: Film préféré'),--19

		('Science Fiction and Fantasy Writers of America: Prix spécial'),--20

		('BAFTA: Meilleure musique'),--21
		('BAFTA: Meilleur son'),--22

		('Evening Standard British Film Awards: Meilleur film'),--23
  
        ('National Board of Review: Meilleur Film'),--24

        ('Oscar du meilleur acteur'),--25
		('British academy film award du meilleur acteur'),--26
        ('Golden Globe du meilleur acteur dans un film dramatique'),--27
        ('Critics Choice Movie Award du meilleur acteur'), --28
        ('Screen Actors Guild Award du meilleur acteur'),--29

		('Lion d’or'),--30
        ('Satellite Award du meilleur scénario adapté'),--31

		('Empire Award du meilleur espoir féminin'),--32


        ('National Board of Review : Meilleur Réalisateur'),--33
        ('National Board of Review : Top 10 Films'),--34

        ('Festival de Berlin : Ours d''argent pour une réalisation exceptionnelle'),--35

		('Golden Globes : Meilleur réalisateur'),--36
		('Golden Globes : Meilleur film dramatique'),--37

		('Oscars du cinéma : Meilleur réalisateur'),--38
		('Oscars du cinéma : Meilleur film'),--39

		('Prix du film Mainichi : Meilleur film étranger'),--40
		('Genesis Award : Film familial'),--41

		('National Board of Review Award de la meilleur actrice'),--42

		('BAFTA: Meilleurs effets visuels'),--43
		('Saturn Awards: Meilleure réalisation'),--44

		('César du meilleur producteur')--45



-- table Film_Acteur

   --creation de la table
   CREATE TABLE Film_Acteur (
     ID_Film int not null,
     ID_Acteur int not null, 
   ) 
   GO
   ALTER TABLE Film_Acteur ADD CONSTRAINT Film_Acteur_PK PRIMARY KEY (ID_Film,ID_Acteur);
   ALTER TABLE Film_Acteur ADD CONSTRAINT Film_Acteur_FK1 FOREIGN KEY (ID_Film) REFERENCES Film (ID_Film);
   ALTER TABLE Film_Acteur ADD CONSTRAINT Film_Acteur_FK2 FOREIGN KEY (ID_Acteur) REFERENCES Acteur (ID_Acteur);


  --insérer des lignes 
  INSERT INTO Film_Acteur (ID_Film, ID_Acteur)
  VALUES (1,1),
         (1,2),
		 (1,3),
		 (1,4),
		 (1,5),
		 (1,6),
		 (1,7),
		 (2,8),
		 (2,9),
		 (2,10),
		 (2,11),
		 (2,12),
		 (6,13),
		 (6,14),
		 (6,15),
		 (6,16),
		 (7,17),
		 (7,18),
		 (7,19),
		 (7,20),
		 (8,21),
		 (8,22),
		 (8,23),
		 (8,24),
		 (8,25),
		 (8,26),
		 (8,27),
		 (8,28),
		 (8,29),
		 (9,27),
		 (9,28),
		 (9,29),
		 (10,27),
		 (10,28),
		 (10,29),
		 (11,27),
		 (11,28),
		 (11,30),
		 (13,27),
		 (13,28),
		 (13,29),
		 (12,30),
		 (12,27),
		 (12,28),
		 (12,29),
		 (4,31),
		 (4,32),
		 (4,33),
		 (4,34),
		 (4,35),
		 (4,36),
		 (4,37),
		 (4,38),
		 (3,39),
		 (3,40),
		 (3,41),
		 (3,42),
		 (3,43),
		 (3,44),
		 (3,45),
		 (3,46),
		 (5,47),
		 (5,48),
		 (5,49),
		 (5,50),
		 (5,51),
		 (5,52),
		 (5,53),
		 (5,54),
		 (14,55),
		 (14,56),
		 (14,57),
		 (14,58),
		 (15,59),
		 (15,60),
		 (15,61),
		 (15,62),
		 (16,63),
		 (16,64),
		 (16,65),
		 (16,66)
	

		 




-- table Film_Realisateur

   --creation de la table
   CREATE TABLE Film_Realisateur(
   ID_Realisateur int not null,
   ID_Film int not null,
   PRIMARY KEY(ID_Realisateur, Id_Film),
   FOREIGN KEY(ID_Realisateur) REFERENCES Realisateur(ID_Realisateur),
   FOREIGN KEY(ID_Film) REFERENCES Film(ID_Film)
   )
   GO


  --insérer des lignes 
  INSERT INTO Film_Realisateur (ID_Realisateur, ID_Film)
  VALUES (1,1),
         (2,2),
		 (6,3),
		 (7,4),
		 (5,8),
		 (5,11),
		 (5,12),
		 (5,13),
		 (6,9),
		 (7,10),
		 (8,4),
		 (9,3),
		 (10,3),
		 (11,5),
		 (12,14),
		 (13,15),
		 (14,16)





-- table Film_Producteur

   --creation de la table
   CREATE TABLE Film_Producteur (
   ID_Film int not null,
   ID_Producteur int not null,
   CONSTRAINT Film_Producteur_PK PRIMARY KEY (ID_Film,ID_Producteur),
   CONSTRAINT Film_Producteur_FK1 FOREIGN KEY (ID_Film) REFERENCES Film (ID_Film),
   CONSTRAINT Film_Producteur_FK2 FOREIGN KEY (ID_Producteur) REFERENCES Producteur (ID_Producteur)
   )
   GO


  --insérer des lignes 
  INSERT INTO Film_Producteur (ID_Film, ID_Producteur)
  VALUES (6,1),
         (7,2),
		 (7,3),
		 (7,4),
		 (8,5),
		 (8,7),
		 (9,5),
		 (9,7),
		 (10,5),
		 (10,8),
		 (11,5),
		 (11,6),
		 (12,5),
		 (12,6),
		 (13,5),
		 (13,6),
		 (4,9),
		 (3,10),
		 (5,11),
		 (14,12),
		 (15,13),
		 (15,14),
		 (15,15),
		 (16,16)

         





-- table Film_Studio

   --creation de la table
   CREATE TABLE Film_Studio (
   ID_Film int not null,
   ID_Studio int not null, 
   ) 
   GO
   ALTER TABLE Film_Studio ADD CONSTRAINT Film_Studio_PK PRIMARY KEY (ID_Film,ID_Studio);
   ALTER TABLE Film_Studio ADD CONSTRAINT Film_Studio_FK1 FOREIGN KEY (ID_Film) REFERENCES Film (ID_Film);
   ALTER TABLE Film_Studio ADD CONSTRAINT Film_Studio_FK2 FOREIGN KEY (ID_Studio) REFERENCES Studio (ID_Studio);


  --insérer des lignes 
  INSERT INTO Film_Studio(ID_Film,ID_Studio)
  VALUES (3,2),
		 (5,4),
		 (6,5),
		 (6,6),
		 (6,7),
		 (7,8),
		 (7,6),
		 (7,9),
		 (8,10),
		 (9,10),
		 (10,10),
		 (11,10),
		 (12,10),
		 (13,10),
		 (14,11),
		 (4,3),
		 (3,4),
		 (2,1),
		 (5,2),
		 (15,12),
		 (15,13),
		 (15,14),
		 (16,15),
		 (16,16)



-- table Recompense_Acteur

   --creation de la table
   CREATE TABLE Recompense_Acteur(
   ID_Acteur INT not null,
   ID_Film INT not null,
   ID_Recompense INT not null,
   Annee varchar (4) not null,
   CONSTRAINT Recompense_Acteur_Annee Check (Len(Annee)=4)
   )
   GO
   ALTER TABLE Recompense_Acteur ADD CONSTRAINT Recompense_Acteur_PK PRIMARY KEY(ID_Acteur, ID_Film, ID_Recompense);
   ALTER TABLE Recompense_Acteur ADD CONSTRAINT Recompense_Acteur_FK1 FOREIGN KEY(ID_Acteur) REFERENCES Acteur(ID_Acteur);
   ALTER TABLE Recompense_Acteur ADD CONSTRAINT Recompense_Acteur_FK2 FOREIGN KEY(ID_Film) REFERENCES Film(ID_Film);
   ALTER TABLE Recompense_Acteur ADD CONSTRAINT Recompense_Acteur_FK3 FOREIGN KEY(ID_Recompense) REFERENCES Recompense(ID_Recompense);


  --insérer des lignes 
  INSERT INTO Recompense_Acteur(ID_Acteur,ID_Film,ID_Recompense,Annee)
  VALUES (60, 15, 25, '2020'),
         (60, 15, 26, '2020'),
         (60, 15, 27, '2020'),
         (60, 15, 28, '2020'), 
         (60, 15, 29, '2020'),
		 (13, 6, 32,'2011'),
		 (55, 14, 42, '1954')




-- table Recompense_Realisateur

   --creation de la table
   CREATE TABLE Recompense_Realisateur(
   ID_Realisateur INT not null,
   ID_Film INT not null,
   ID_Recompense INT not null,
   Annee varchar (4) not null,
   CONSTRAINT Recompense_Realisateur_PK PRIMARY KEY(ID_Realisateur, ID_Film, ID_Recompense),
   CONSTRAINT Recompense_Realisateur_FK1 FOREIGN KEY(ID_Realisateur) REFERENCES Realisateur(ID_Realisateur),
   CONSTRAINT Recompense_Realisateur_FK2 FOREIGN KEY(ID_Film) REFERENCES Film(ID_Film),
   CONSTRAINT Recompense_Realisateur_FK3 FOREIGN KEY(ID_Recompense) REFERENCES Recompense(ID_Recompense),
   CONSTRAINT Recompense_Realisateur_Annee Check (Len(Annee)=4)
   )
   GO


  --insérer des lignes 
  INSERT INTO Recompense_Realisateur (ID_Realisateur,ID_Film,ID_Recompense,Annee)
  VALUES (13, 15, 30, '2019'),
         (13, 15, 31, '2020'),
		 (9,3,33,'1990'),
		 (9,3,35,'1991'),
		 (9,3,36,'1991'),
		 (9,3,38,'1991')






-- table Recompense_Producteur

   --creation de la table
   CREATE TABLE Recompense_Producteur(
   ID_Producteur INT not null,
   ID_Film INT not null,
   ID_Recompense INT not null,
   Annee varchar (4) not null,
   CONSTRAINT Recompense_Producteur_PK PRIMARY KEY(ID_Producteur, ID_Film, ID_Recompense),
   CONSTRAINT Recompense_Producteur_FK1 FOREIGN KEY(ID_Producteur) REFERENCES Producteur(ID_Producteur),
   CONSTRAINT Recompense_Producteur_FK2 FOREIGN KEY(ID_Film) REFERENCES Film(ID_Film),
   CONSTRAINT Recompense_Producteur_FK3 FOREIGN KEY(ID_Recompense) REFERENCES Recompense(ID_Recompense),
   CONSTRAINT Recompense_Producteur_Annee Check (Len(Annee)=4)
   )
   GO


   --insérer des lignes 
   INSERT INTO Recompense_Producteur(ID_Producteur,ID_Film,ID_Recompense,Annee)
   VALUES (17,17,45,'1996'),
          (18,18,45,'1997')





-- table Recompense_Film

   --creation de la table
   CREATE TABLE Recompense_Film(
   ID_Film INT not null,
   ID_Recompense INT not null,
   Annee varchar (4) not null,
   CONSTRAINT Recompense_Film_Annee Check (Len(Annee)=4)
   )
   GO
   ALTER TABLE Recompense_Film ADD CONSTRAINT Recompense_Film_PK PRIMARY KEY(ID_Film, ID_Recompense);
   ALTER TABLE Recompense_Film ADD CONSTRAINT Recompense_Film_FK1 FOREIGN KEY(ID_Film) REFERENCES Film(ID_Film);
   ALTER TABLE Recompense_Film ADD CONSTRAINT Recompense_Film_FK2 FOREIGN KEY(ID_Recompense) REFERENCES Recompense(ID_Recompense);

  --insérer des lignes 
  INSERT INTO Recompense_Film(ID_Film,ID_Recompense,Annee)
  VALUES (8,1,'1972'),
         (8,2,'1972'),
		 (8,3,'1972'),
		 (8,4,'1972'),
		 (8,5,'1972'),
		 (8,6,'1972'),
		 (8,7,'1972'),
		 (8,8,'1972'),
		 (8,9,'1972'),
		 (8,10,'1972'),
		 (8,11,'1972'),
		 (8,12,'1972'),
		 (8,13,'1972'),
		 (8,14,'1972'),
		 (8,15,'1972'),
		 (8,16,'1972'),
		 (8,17,'1972'),
		 (8,18,'1972'),
		 (8,19,'1972'),
		 (8,20,'1972'),
		 (8,21,'1972'),
		 (8,22,'1972'),
		 (8,23,'1972'),
		 (3,24,'1990'),
		 (3,34,'1990'),
		 (3,37,'1991'),
		 (3,39,'1991'),
		 (3,40,'1992'),
		 (2,41,'1993'),
		 (9,5,'1980'),
		 (9,3,'1980'),
		 (9,11,'1980'),
		 (9,16,'1980'),
		 (9,17,'1980'),
		 (9,18,'1980'),
		 (9,19,'1980'),
		 (9,20,'1980'),
		 (10,5,'1983'),
		 (10,11,'1983'),
		 (10,14,'1983'),
		 (10,15,'1983'),
		 (10,16,'1983'),
		 (10,18,'1983'),
		 (10,19,'1983'),
		 (10,20,'1983'),
		 (8,44,'1972'),
		 (10,43,'1983'),
		 (9,44,'1980')

		