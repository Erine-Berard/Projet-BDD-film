USE Film
GO

DROP View IF EXISTS RecompenceDesActeurs
Go
DROP View IF EXISTS RecompenceDesProducteurs
Go
DROP View IF EXISTS RecompenceDesRealisateurs
Go
DROP View IF EXISTS RecompenceDesFilms
Go
Drop View IF Exists FilmActeur
Go
Drop View IF Exists NombreDeRécompenseParFilm
go


Create view RecompenceDesActeurs 
as
Select r.ID_Recompense, r.Nom 'Nom de Recompense', a.ID_Acteur, a.Nom 'Nom de l''acteur', a.Prenom 'Prénom de l''acteur', a.DateNaissance, a.PaysOrigine 'Pays d''origine de l''acteur',f.ID_Film, f.Nom 'Nom du film', f.DateSortie, f.PaysOrigine 'Pays d''origine du film', f.BoxOffice
From Recompense_Acteur t 
     Join Acteur a on t.ID_Acteur =a.ID_Acteur
	 join  Film f on f.ID_Film=t.ID_Film
	 join Recompense r on r.ID_Recompense = t.ID_Recompense 
GO

Create view RecompenceDesProducteurs 
as
Select r.ID_Recompense, r.Nom 'Nom de Recompense', p.ID_Producteur, p.Nom 'Nom du Producteur', p.Prenom 'Prénom du Producteur',p.DateNaissance, p.PaysOrigine 'Pays d''origine du producteur', f.ID_Film, f.Nom 'Nom du film', f.DateSortie, f.PaysOrigine 'Pays d''origine du film', f.BoxOffice
From Recompense_Producteur t 
     Join Producteur p on t.ID_Producteur =p.ID_Producteur
	 join  Film f on f.ID_Film=t.ID_Film
	 join Recompense r on r.ID_Recompense = t.ID_Recompense 
GO

Create view RecompenceDesRealisateurs
as
Select r.ID_Recompense, r.Nom 'Nom de Recompense', rea.ID_Realisateur, rea.Nom 'Nom du Realisateur', rea.Prenom 'Prénom du Realisteur', rea.DateNaissance, rea.PaysOrigine 'Pays d''origine du realisateur', f.ID_Film, f.Nom 'Nom du film', f.DateSortie, f.PaysOrigine 'Pays d''origine du film', f.BoxOffice
From Recompense_Realisateur t 
     Join Realisateur rea on t.ID_Realisateur =rea.ID_Realisateur
	 join  Film f on f.ID_Film=t.ID_Film
	 join Recompense r on r.ID_Recompense = t.ID_Recompense 
GO

Create view RecompenceDesFilms 
as
Select r.ID_Recompense, r.Nom 'Nom de Recompense', f.ID_Film, f.Nom 'Nom du film', f.DateSortie, f.PaysOrigine 'Pays d''origine du film', f.BoxOffice
From Recompense_Film t 
	 join  Film f on f.ID_Film=t.ID_Film
	 join Recompense r on r.ID_Recompense = t.ID_Recompense 
GO






--film et acteur
CREATE VIEW FilmActeur
AS
Select a.ID_Acteur, a.Nom 'Nom de l''acteur', a.Prenom 'Prénom de l''acteur',a.DateNaissance, a.PaysOrigine 'Pays d''origine de l''acteur', b.Id_Film, b.Nom 'Nom du film', b.DateSortie, b.PaysOrigine 'Pays d''origine du film', b.BoxOffice
FROM Acteur a
join Film b on b.ID_Film=b.Id_Film
GO










Create view NombreDeRécompenseParFilm
AS
Select rec.ID_Film, rec.Nom, rec.BoxOffice, rec.DateSortie, rec.[Pays d'origine du film], count(rec.ID_Film) 'Nombre_de_recompense_par_film'
From (Select f.Nom, f.ID_Film, r.BoxOffice, r.DateSortie, r.ID_Recompense, r.[Pays d'origine du film]
       From Film f
       join  RecompenceDesFilms r on f.ID_Film=r.ID_Film
	   Union 
       Select f.Nom, f.ID_Film, r.BoxOffice, r.DateSortie, r.ID_Recompense, r.[Pays d'origine du film]
       From Film f
       join  RecompenceDesRealisateurs r on f.ID_Film=r.ID_Film
	   Union
	   Select f.Nom, f.ID_Film, r.BoxOffice, r.DateSortie, r.ID_Recompense, r.[Pays d'origine du film]
       From Film f
        join  RecompenceDesProducteurs  r on f.ID_Film=r.ID_Film
		Union
	    Select f.Nom, f.ID_Film, r.BoxOffice, r.DateSortie, r.ID_Recompense, r.[Pays d'origine du film]
        From Film f
        join  RecompenceDesActeurs  r on f.ID_Film=r.ID_Film)  rec
group by rec.ID_Film, rec.Nom,rec.BoxOffice, rec.DateSortie, rec.[Pays d'origine du film]
Go