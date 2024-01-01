-- Vue du nombre total d'équipements par salle de musculation.
CREATE VIEW EquipementsParSalle AS
SELECT ID_Salle, COUNT(ID_Equipement) AS NombreEquipements
FROM EstEquipeDe
GROUP BY ID_Salle;

-- Vue des revenus moyens par type d'abonnement.
CREATE VIEW RevenuMoyenAbonnement AS
SELECT Type_Abonnement, AVG(Prix) AS RevenuMoyen
FROM Abonnement
GROUP BY Type_Abonnement;

-- Vue des membres et de leur dernier paiement.
CREATE VIEW DernierPaiementMembre AS
SELECT M.ID_Membre, M.Nom, M.Prénom, MAX(P.Date_PossedePaye) AS DernierPaiement
FROM Membre M
JOIN PossedePaye P ON M.ID_Membre = P.ID_Membre
GROUP BY M.ID_Membre, M.Nom, M.Prénom;

-- Vue des cours et du nombre de participants.
CREATE VIEW ParticipantsParCours AS
SELECT C.ID_Cours, C.Nom, COUNT(P.ID_Membre) AS NombreParticipants
FROM Cours C
JOIN Participe P ON C.ID_Cours = P.ID_Cours
GROUP BY C.ID_Cours, C.Nom;

-- Vue des entraîneurs et du nombre de cours qu'ils donnent.
CREATE VIEW CoursParEntraineur AS
SELECT E.ID_Entraineur, E.Nom, E.Prénom, COUNT(C.ID_Cours) AS NombreCours
FROM Entraineur E
JOIN Cours C ON E.ID_Entraineur = C.ID_Cours
GROUP BY E.ID_Entraineur, E.Nom, E.Prénom;

