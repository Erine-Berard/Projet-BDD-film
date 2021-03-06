-- Création de la table pays 
DROP TABLE IF EXISTS Pays

CREATE TABLE Pays(
   ID_Pays int not null IDENTITY,
   Nom VARCHAR(100) not null UNIQUE,
   CONSTRAINT Pays_PK PRIMARY KEY (ID_Pays)
   
   )

-- Get tout les pays actuellement insert et les ajoute dans la table
INSERT INTO Pays(Nom) 
SELECT PaysOrigine FROM Film
UNION
SELECT PaysOrigine FROM Acteur
UNION
SELECT PaysOrigine FROM Realisateur
UNION 
SELECT PaysOrigine FROM Producteur
UNION
SELECT PaysOrigine FROM Studio

-- Modification des valeurs actuelle de PaysOrigine dans les tables précédemment créer

UPDATE Film SET Film.PaysOrigine =  (SELECT Pays.ID_Pays
                     FROM Pays
                     WHERE Pays.Nom = Film.PaysOrigine)

UPDATE Acteur SET Acteur.PaysOrigine =  (SELECT Pays.ID_Pays
                     FROM Pays
                     WHERE Pays.Nom = Acteur.PaysOrigine)

UPDATE Realisateur SET Realisateur.PaysOrigine = (SELECT Pays.ID_Pays
                     FROM Pays
                     WHERE Pays.Nom = Realisateur.PaysOrigine)

UPDATE Producteur SET Producteur.PaysOrigine = (SELECT Pays.ID_Pays
                     FROM Pays
                     WHERE Pays.Nom = Producteur.PaysOrigine)

UPDATE Studio SET Studio.PaysOrigine = (SELECT Pays.ID_Pays
                     FROM Pays
                     WHERE Pays.Nom = Studio.PaysOrigine)

-- Modification du type de la column PaysOrigine en entier afin d'accueillir la clef etrangere
ALTER TABLE Film ALTER COLUMN PaysOrigine int not null;
ALTER TABLE Acteur ALTER COLUMN PaysOrigine int not null;
ALTER TABLE Realisateur ALTER COLUMN PaysOrigine int not null;
ALTER TABLE Producteur ALTER COLUMN PaysOrigine int not null;
ALTER TABLE Studio ALTER COLUMN PaysOrigine int not null;

-- Ajout des contraintes de clef etrangere 
ALTER TABLE Film ADD CONSTRAINT film_fk_pays FOREIGN KEY (PaysOrigine) REFERENCES Pays (ID_Pays);
ALTER TABLE Acteur ADD CONSTRAINT acteur_fk_pays FOREIGN KEY (PaysOrigine) REFERENCES Pays (ID_Pays);
ALTER TABLE Realisateur ADD CONSTRAINT realisateur_fk_pays FOREIGN KEY (PaysOrigine) REFERENCES Pays (ID_Pays);
ALTER TABLE Producteur ADD CONSTRAINT producteur_fk_pays FOREIGN KEY (PaysOrigine) REFERENCES Pays (ID_Pays);
ALTER TABLE Studio ADD CONSTRAINT studio_fk_pays FOREIGN KEY (PaysOrigine) REFERENCES Pays (ID_Pays);