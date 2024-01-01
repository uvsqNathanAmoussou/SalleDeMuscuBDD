-- Nombre total de membres 
-- Calculs d’agrégats
SELECT COUNT(ID_Membre) AS Total_Membres
FROM Membre;

-- Revenu moyen des abonnements ?
-- Calculs d’agrégats
SELECT AVG(Prix) AS Revenu_Moyen_Abonnements
FROM Abonnement;

-- Nombre d'équipements par salle ?
-- Calculs d’agrégats
SELECT ID_Salle, SUM(Quantite) AS Total_Equipements
FROM EstEquipeDe
GROUP BY ID_Salle;

-- Tous les membres avec un abonnement actif ?
-- Sélections
SELECT M.ID_Membre, M.Nom, M.Prénom
FROM Membre M
JOIN Abonnement A ON M.ID_Abonnement = A.ID_Abonnement
WHERE A.DateFin IS NULL OR A.DateFin > SYSDATE;
Nom et prénom des membres ?
Projections
SELECT Nom, Prénom
FROM Membre;

-- Relier les membres à leurs abonnements.
-- Jointures
SELECT M.ID_Membre, M.Nom, M.Prénom, A.Type_Abonnement, A.Prix
FROM Membre M
JOIN Abonnement A ON M.ID_Abonnement = A.ID_Abonnement;
Relier les cours aux entraîneurs.
Jointures
SELECT C.ID_Cours, C.Nom, E.Nom AS Nom_Entraineur, E.Prénom AS Prénom_Entraineur
FROM Cours C
JOIN Entraineur E ON C.ID_Entraineur = E.ID_Entraineur;

-- Relier les équipements aux salles.
-- Jointures
SELECT E.ID_Equipement, E.Nom, S.ID_Salle, S.Nom AS Nom_Salle
FROM Equipement E
JOIN EstEquipeDe EE ON E.ID_Equipement = EE.ID_Equipement
JOIN SalleMusculation S ON EE.ID_Salle = S.ID_Salle;

-- Membres inscrits à tous les cours proposés par un certain entraîneur ?
-- Requêtes imbriquées
SELECT M.ID_Membre, M.Nom, M.Prénom
FROM Membre M
WHERE NOT EXISTS (
    SELECT C.ID_Cours
    FROM Cours C
    WHERE C.ID_Entraineur = [EntraineurID] AND NOT EXISTS (
        SELECT P.ID_Cours
        FROM Participe P
        WHERE P.ID_Membre = M.ID_Membre AND P.ID_Cours = C.ID_Cours
    )
);

-- Membres qui sont à la fois dans des cours de cardio et de musculation ?
-- Intersection, union, différence ?
-- Membres dans des cours de cardio
WITH Cardio AS (
    SELECT P.ID_Membre
    FROM Participe P
    JOIN Cours C ON P.ID_Cours = C.ID_Cours
    JOIN TypeDeCours T ON C.ID_TypeDeCours = T.ID_TypeDeCours
    WHERE T.Type_TypeDeCours = 'Cardio'
),
-- Membres dans des cours de musculation
Muscu AS (
    SELECT P.ID_Membre
    FROM Participe P
    JOIN Cours C ON P.ID_Cours = C.ID_Cours
    JOIN TypeDeCours T ON C.ID_TypeDeCours = T.ID_TypeDeCours
    WHERE T.Type_TypeDeCours = 'Muscu'
)
-- Intersection
SELECT M.ID_Membre, M.Nom, M.Prénom
FROM Membre M
WHERE M.ID_Membre IN (SELECT ID_Membre FROM Cardio)
AND M.ID_Membre IN (SELECT ID_Membre FROM Muscu);

-- Quels membres ont assisté à la fois à des cours de yoga et de Pilates le même mois ?
-- Intersection
-- Membres dans des cours de yoga
WITH Yoga AS (
    SELECT P.ID_Membre, EXTRACT(MONTH FROM P.Date_Participe) AS Mois
    FROM Participe P
    JOIN Cours C ON P.ID_Cours = C.ID_Cours
    JOIN TypeDeCours T ON C.ID_TypeDeCours = T.ID_TypeDeCours
    WHERE T.Type_TypeDeCours = 'Yoga'
),
-- Membres dans des cours de Pilates
Pilates AS (
    SELECT P.ID_Membre, EXTRACT(MONTH FROM P.Date_Participe) AS Mois
    FROM Participe P
    JOIN Cours C ON P.ID_Cours = C.ID_Cours
    JOIN TypeDeCours T ON C.ID_TypeDeCours = T.ID_TypeDeCours
    WHERE T.Type_TypeDeCours = 'Pilates'
)
-- Intersection
SELECT M.ID_Membre, M.Nom, M.Prénom
FROM Membre M
WHERE EXISTS (
    SELECT 1
    FROM Yoga Y
    JOIN Pilates P ON Y.ID_Membre = P.ID_Membre AND Y.Mois = P.Mois
    WHERE M.ID_Membre = Y.ID_Membre
);

-- Quelle est la liste complète des membres actifs et des entraîneurs ?
-- Union
SELECT ID_Membre AS ID, Nom, Prénom, 'Membre' AS Type
FROM Membre
WHERE ID_Abonnement IN (SELECT ID_Abonnement FROM Abonnement WHERE DateFin IS NULL OR DateFin > SYSDATE)
UNION
SELECT ID_Entraineur AS ID, Nom, Prénom, 'Entraineur' AS Type
FROM Entraineur;

-- Quels équipements sont disponibles dans certaines salles mais pas dans d'autres ?
-- Différence

-- Équipements dans la salle A
WITH SalleA AS (
    SELECT E.ID_Equipement, E.Nom
    FROM EstEquipeDe EE
    JOIN Equipement E ON EE.ID_Equipement = E.ID_Equipement
    WHERE EE.ID_Salle = [SalleAID]
),
-- Équipements dans la salle B
SalleB AS (
    SELECT E.ID_Equipement, E.Nom
    FROM EstEquipeDe EE
    JOIN Equipement E ON EE.ID_Equipement = E.ID_Equipement
    WHERE EE.ID_Salle = [SalleBID]
)

-- Différence
SELECT ID_Equipement, Nom
FROM SalleA
MINUS
SELECT ID_Equipement, Nom
FROM SalleB;
Tous les entraîneurs et les cours qu'ils donnent, y compris ceux qui n'ont pas encore de cours attribués ?
Jointure externe
SELECT E.ID_Entraineur, E.Nom AS Nom_Entraineur, E.Prénom AS Prénom_Entraineur, C.ID_Cours, C.Nom AS Nom_Cours
FROM Entraineur E
LEFT JOIN Cours C ON E.ID_Entraineur = C.ID_Entraineur;
Jointure de membres, abonnements, paiements, et cours pour obtenir un rapport détaillé sur les activités des membres.
Plus de 3 jointures
SELECT M.ID_Membre, M.Nom, M.Prénom, A.Type_Abonnement, A.Prix, PP.Date_PossedePaye, C.Nom AS Nom_Cours
FROM Membre M
JOIN Abonnement A ON M.ID_Abonnement = A.ID_Abonnement
JOIN PossedePaye PP ON M.ID_Membre = PP.ID_Membre
JOIN Participe P ON M.ID_Membre = P.ID_Membre
JOIN Cours C ON P.ID_Cours = C.ID_Cours;

-- Membres qui ont suivi tous les types de cours proposés ?
-- Division
-- Membres qui ont suivi tous les types de cours
SELECT M.ID_Membre, M.Nom, M.Prénom
FROM Membre M
WHERE NOT EXISTS (
    SELECT T.ID_TypeDeCours
    FROM TypeDeCours T
    WHERE NOT EXISTS (
        SELECT P.ID_Cours
        FROM Participe P
        JOIN Cours C ON P.ID_Cours = C.ID_Cours
        WHERE P.ID_Membre = M.ID_Membre AND C.ID_TypeDeCours = T.ID_TypeDeCours
    )
);

