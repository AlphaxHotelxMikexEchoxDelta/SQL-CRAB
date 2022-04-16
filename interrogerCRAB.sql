use crab;

/* Requete 1 */
SELECT code , localisation
FROM Borne , Station
WHERE Borne.station = Station.numero 
AND Borne.etat LIKE "HS" ;

/* Requete 2 */
SELECT code , station
FROM Borne , Station
WHERE Borne.station = Station.numero
AND Station.numero = 2 ;

/* Requete 3 */
SELECT nom , prenom
FROM Technicien
ORDER BY nom ASC ;

/* Requete 4*/
SELECT DISTINCT nom , prenom
FROM Technicien , Interventions
WHERE Technicien.matricule = Interventions.technicien 
AND Interventions.borne LIKE "B1"
ORDER BY nom ASC ;

/* Requete 5 */
SELECT DISTINCT nom , prenom
FROM Technicien , Interventions
WHERE Technicien.matricule = Interventions.technicien 
AND Interventions.borne NOT LIKE "B1"
ORDER BY nom ASC ;

/* Requete 6 */
SELECT *
FROM Interventions
WHERE fin IS NULL ;

/* Requete 7 */
SELECT DISTINCT *
FROM Interventions
WHERE LEFT( ROUND( TIMEDIFF( fin, debut) ) ,2) >3 ;

/* Requete 8 */
SELECT SUM(borne = "B1") AS nb_interventions_B1,
SUM(borne = "B2") AS nb_interventions_B2,
SUM(borne = "B3") AS nb_interventions_B3,
SUM(borne = "B4") AS nb_interventions_B4,
SUM(borne = "B5") AS nb_interventions_B5,
SUM(borne = "B6") AS nb_interventions_B6,
SUM(borne = "B7") AS nb_interventions_B7,
SUM(borne = "B8") AS nb_interventions_B8,
SUM(borne = "B9") AS nb_interventions_B9
FROM Interventions \G ;

/* Requete 9 */
SELECT borne,COUNT(borne) AS nb_borne
FROM Interventions 
GROUP BY borne 
Having COUNT(borne)>2 ;

/* Afficher les erreurs, si ils en a */
SHOW WARNINGS ;
