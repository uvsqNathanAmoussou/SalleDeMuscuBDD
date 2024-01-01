-- Administrateur
-- Ce rôle aurait un accès complet à toutes les données et fonctionnalités de la base de données. Il pourrait ajouter, modifier, supprimer et lire toutes les données, ainsi que gérer les utilisateurs et les rôles.
CREATE ROLE Administrateur;
GRANT ALL PRIVILEGES ON DATABASE MaBaseDeDonnees TO Administrateur;

-- GestionnaireDeSalle
-- Ce rôle pourrait gérer les informations relatives à une salle de musculation spécifique, y compris l'ajout, la modification et la suppression d'équipements et de cours, ainsi que les paiements effectués.
CREATE ROLE GestionnaireDeSalle;
GRANT SELECT, INSERT, UPDATE, DELETE ON SalleMusculation, Equipement, Cours TO GestionnaireDeSalle;
GRANT SELECT, INSERT, UPDATE ON Paiements, MoyenPaiement TO GestionnaireDeSalle;

-- Entraineur
-- Ce rôle pourrait ajouter, modifier et supprimer des cours qu'il donne.
CREATE ROLE Entraineur;
GRANT SELECT, INSERT, UPDATE, DELETE ON Cours TO Entraineur;

-- Membre
-- Ce rôle aurait un accès en lecture seule à certaines informations pertinentes pour un membre de la salle de musculation, comme les détails des cours auxquels il participe, ou la possibilité de consulter ses moyens de paiements et de transactions, et les mettre à jour au besoin.
CREATE ROLE Membre;
GRANT SELECT ON Cours, Participe TO Membre;
GRANT SELECT, INSERT, UPDATE ON MoyenPaiement, Paiements TO Membre WHERE MembreID = USER_ID();

