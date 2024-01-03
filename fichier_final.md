# Compte Rendu Projet PL/SQL

### A. Création du schéma de la base de données

```sql
CREATE TABLE SalleMusculation (
    ID_Salle NUMBER NOT NULL,
    Nom VARCHAR2(100) NOT NULL,
    Adresse VARCHAR2(255) NOT NULL UNIQUE,
    DateOuverture DATE NOT NULL,
    SurfaceTotale NUMBER NOT NULL CHECK (SurfaceTotale > 0),
    HoraireOuverture TIMESTAMP NOT NULL,
    HoraireFermeture TIMESTAMP NOT NULL,
    PRIMARY KEY (ID_Salle),
    CHECK (HoraireOuverture < HoraireFermeture)
);

CREATE TABLE Abonnement (
    ID_Abonnement NUMBER NOT NULL,
    Type_Abonnement VARCHAR2(50) NOT NULL,
    Prix NUMBER NOT NULL CHECK (Prix >= 0),
    DateDebut DATE NOT NULL,
    DateFin DATE,
    PRIMARY KEY (ID_Abonnement)
);

CREATE TABLE Membre (
    ID_Membre NUMBER NOT NULL,
    ID_Abonnement NUMBER NOT NULL,
    Nom VARCHAR2(100) NOT NULL,
    Prenom VARCHAR2(100) NOT NULL,
    DateNaissance DATE NOT NULL,
    Adresse VARCHAR2(255) NOT NULL,
    DateInscription DATE NOT NULL,
    DateResiliation DATE,
    PRIMARY KEY (ID_Membre),
    FOREIGN KEY (ID_Abonnement) REFERENCES Abonnement(ID_Abonnement)
);

CREATE TABLE MoyenPaiement (
    ID_Paiement NUMBER NOT NULL,
    Type_MoyenPaiement VARCHAR2(50) NOT NULL,
    Details VARCHAR2(255),
    PRIMARY KEY (ID_Paiement)
);

CREATE TABLE Equipement (
    ID_Equipement NUMBER NOT NULL,
    Nom VARCHAR2(100) NOT NULL,
    Type_Equipement VARCHAR2(100) NOT NULL,
    DateAchat DATE NOT NULL,
    Prix NUMBER NOT NULL CHECK (Prix >= 0),
    PRIMARY KEY (ID_Equipement)
);

CREATE TABLE TypeDeCours (
    ID_TypeDeCours NUMBER NOT NULL,
    Type_TypeDeCours VARCHAR2(50) NOT NULL,
    PRIMARY KEY (ID_TypeDeCours)
);

CREATE TABLE Entraineur (
    ID_Entraineur NUMBER NOT NULL,
    Nom VARCHAR2(100) NOT NULL,
    Prenom VARCHAR2(100) NOT NULL,
    Specialite VARCHAR2(100) NOT NULL,
    DateEmbauche DATE NOT NULL,
    PRIMARY KEY (ID_Entraineur)
);

CREATE TABLE Cours (
    ID_Cours NUMBER NOT NULL,
    ID_TypeDeCours NUMBER NOT NULL,
    ID_Entraineur NUMBER NOT NULL,
    Nom VARCHAR2(100) NOT NULL UNIQUE,
    Description VARCHAR2(255),
    PRIMARY KEY (ID_Cours),
    FOREIGN KEY (ID_TypeDeCours) REFERENCES TypeDeCours(ID_TypeDeCours),
    FOREIGN KEY (ID_Entraineur) REFERENCES Entraineur(ID_Entraineur)
);

CREATE TABLE EstMembreDe (
    ID_Salle NUMBER NOT NULL,
    ID_Membre NUMBER NOT NULL,
    FOREIGN KEY (ID_Salle) REFERENCES SalleMusculation(ID_Salle),
    FOREIGN KEY (ID_Membre) REFERENCES Membre(ID_Membre),
    PRIMARY KEY (ID_Salle, ID_Membre)
);

CREATE TABLE PossedePaye (
    ID_Membre NUMBER NOT NULL,
    ID_Paiement NUMBER NOT NULL,
    ID_Abonnement NUMBER NOT NULL,
    Date_PossedePaye DATE NOT NULL,
    FOREIGN KEY (ID_Membre) REFERENCES Membre(ID_Membre),
    FOREIGN KEY (ID_Paiement) REFERENCES MoyenPaiement(ID_Paiement),
    FOREIGN KEY (ID_Abonnement) REFERENCES Abonnement(ID_Abonnement),
    PRIMARY KEY (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
);

CREATE TABLE EstEquipeDe (
    ID_Salle NUMBER NOT NULL,
    ID_Equipement NUMBER NOT NULL,
    Quantite NUMBER NOT NULL CHECK (Quantite > 0),
    FOREIGN KEY (ID_Salle) REFERENCES SalleMusculation(ID_Salle),
    FOREIGN KEY (ID_Equipement) REFERENCES Equipement(ID_Equipement),
    PRIMARY KEY (ID_Salle, ID_Equipement)
);

CREATE TABLE SeTientDansPropose (
    ID_Salle NUMBER NOT NULL,
    ID_Cours NUMBER NOT NULL,
    HoraireDebut TIMESTAMP NOT NULL,
    HoraireFin TIMESTAMP NOT NULL,
    Jour DATE NOT NULL,
    FOREIGN KEY (ID_Salle) REFERENCES SalleMusculation(ID_Salle),
    FOREIGN KEY (ID_Cours) REFERENCES Cours(ID_Cours),
    PRIMARY KEY (ID_Salle, ID_Cours, Jour, HoraireDebut)
);

CREATE TABLE Participe (
    ID_Membre NUMBER NOT NULL,
    ID_Cours NUMBER NOT NULL,
    Date_Participe DATE NOT NULL,
    FOREIGN KEY (ID_Membre) REFERENCES Membre(ID_Membre),
    FOREIGN KEY (ID_Cours) REFERENCES Cours(ID_Cours),
    PRIMARY KEY (ID_Membre, ID_Cours, Date_Participe)
);
```

### B. Jeu de données

Sous Oracle Live, nous avons créé et inséré ce petit jeu de données pour tester nos tables, requêtes, vues et triggers :

```sql
INSERT ALL
    INTO SalleMusculation (ID_Salle, Nom, Adresse, DateOuverture, SurfaceTotale, HoraireOuverture, HoraireFermeture)
    VALUES (1, 'Fitness Paradise', '123 Avenue de la Forme, Paris', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 600, TO_TIMESTAMP('2022-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-01-01 22:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO SalleMusculation (ID_Salle, Nom, Adresse, DateOuverture, SurfaceTotale, HoraireOuverture, HoraireFermeture)
    VALUES (2, 'Iron Strong Gym', '456 Rue de la Musculation, Lyon', TO_DATE('2021-05-15', 'YYYY-MM-DD'), 800, TO_TIMESTAMP('2021-05-15 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-05-15 21:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO SalleMusculation (ID_Salle, Nom, Adresse, DateOuverture, SurfaceTotale, HoraireOuverture, HoraireFermeture)
    VALUES (3, 'FitZone Center', '789 Boulevard Fitness, Marseille', TO_DATE('2020-09-10', 'YYYY-MM-DD'), 500, TO_TIMESTAMP('2020-09-10 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2020-09-10 23:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO SalleMusculation (ID_Salle, Nom, Adresse, DateOuverture, SurfaceTotale, HoraireOuverture, HoraireFermeture)
    VALUES (4, 'PowerLift Club', '987 Rue de la Force, Bordeaux', TO_DATE('2021-03-20', 'YYYY-MM-DD'), 700, TO_TIMESTAMP('2021-03-20 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-03-20 20:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO SalleMusculation (ID_Salle, Nom, Adresse, DateOuverture, SurfaceTotale, HoraireOuverture, HoraireFermeture)
    VALUES (5, 'FlexFit Studio', '321 Rue de Flexibilité, Nice', TO_DATE('2023-02-05', 'YYYY-MM-DD'), 450, TO_TIMESTAMP('2023-02-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-02-05 19:00:00', 'YYYY-MM-DD HH24:MI:SS'))
SELECT * FROM dual;

INSERT ALL
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (1, 'À la semaine', 40.00, TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-22', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (2, 'Mensuel', 30.00, TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-02-28', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (3, 'Annuel', 20.00, TO_DATE('2023-03-10', 'YYYY-MM-DD'), TO_DATE('2024-03-09', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (4, 'À la semaine', 40.00, TO_DATE('2023-04-05', 'YYYY-MM-DD'), TO_DATE('2023-04-12', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (5, 'Mensuel', 30.00, TO_DATE('2023-05-20', 'YYYY-MM-DD'), TO_DATE('2023-06-19', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (6, 'Annuel', 20.00, TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2024-05-31', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (7, 'À la semaine', 40.00, TO_DATE('2023-07-08', 'YYYY-MM-DD'), TO_DATE('2023-07-15', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (8, 'Mensuel', 30.00, TO_DATE('2023-08-12', 'YYYY-MM-DD'), TO_DATE('2023-09-11', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (9, 'Annuel', 20.00, TO_DATE('2023-09-25', 'YYYY-MM-DD'), TO_DATE('2024-09-24', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (10, 'À la semaine', 40.00, TO_DATE('2023-10-15', 'YYYY-MM-DD'), TO_DATE('2023-10-22', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (11, 'Mensuel', 30.00, TO_DATE('2023-11-05', 'YYYY-MM-DD'), TO_DATE('2023-12-04', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (12, 'Annuel', 20.00, TO_DATE('2023-12-18', 'YYYY-MM-DD'), TO_DATE('2024-12-17', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (13, 'À la semaine', 40.00, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-17', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (14, 'Mensuel', 30.00, TO_DATE('2024-02-15', 'YYYY-MM-DD'), TO_DATE('2024-03-14', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (15, 'Annuel', 20.00, TO_DATE('2024-03-28', 'YYYY-MM-DD'), TO_DATE('2025-03-27', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (16, 'À la semaine', 40.00, TO_DATE('2024-04-05', 'YYYY-MM-DD'), TO_DATE('2024-04-12', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (17, 'Mensuel', 30.00, TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-06-09', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (18, 'Annuel', 20.00, TO_DATE('2024-06-20', 'YYYY-MM-DD'), TO_DATE('2025-06-19', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (19, 'À la semaine', 40.00, TO_DATE('2024-07-05', 'YYYY-MM-DD'), TO_DATE('2024-07-12', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (20, 'Mensuel', 30.00, TO_DATE('2024-08-10', 'YYYY-MM-DD'), TO_DATE('2024-09-09', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (21, 'À la semaine', 40.00, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-22', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (22, 'Mensuel', 30.00, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-29', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (23, 'Annuel', 20.00, TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2025-03-09', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (24, 'À la semaine', 40.00, TO_DATE('2024-04-05', 'YYYY-MM-DD'), TO_DATE('2024-04-12', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (25, 'Mensuel', 30.00, TO_DATE('2024-05-20', 'YYYY-MM-DD'), TO_DATE('2024-06-19', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (26, 'Annuel', 20.00, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2025-05-31', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (27, 'À la semaine', 40.00, TO_DATE('2024-07-08', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (28, 'Mensuel', 30.00, TO_DATE('2024-08-12', 'YYYY-MM-DD'), TO_DATE('2024-09-11', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (29, 'Annuel', 20.00, TO_DATE('2024-09-25', 'YYYY-MM-DD'), TO_DATE('2025-09-24', 'YYYY-MM-DD'))
    INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
    VALUES (30, 'À la semaine', 40.00, TO_DATE('2024-10-15', 'YYYY-MM-DD'), TO_DATE('2024-10-22', 'YYYY-MM-DD'))
SELECT * FROM dual;

INSERT ALL
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (1, 1, 'Dupont', 'Alice', TO_DATE('1990-05-15', 'YYYY-MM-DD'), '123 Rue de la Forme, Paris', TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (2, 2, 'Martin', 'Bob', TO_DATE('1985-08-22', 'YYYY-MM-DD'), '456 Avenue Musculaire, Lyon', TO_DATE('2021-06-10', 'YYYY-MM-DD'), TO_DATE('2023-01-15', 'YYYY-MM-DD'))
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (3, 3, 'Lefevre', 'Claire', TO_DATE('1993-03-08', 'YYYY-MM-DD'), '789 Boulevard Fitness, Marseille', TO_DATE('2020-11-20', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (4, 4, 'Beaulieu', 'David', TO_DATE('1988-12-03', 'YYYY-MM-DD'), '987 Rue Force, Bordeaux', TO_DATE('2021-04-05', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (5, 5, 'Roux', 'Sophie', TO_DATE('1995-07-19', 'YYYY-MM-DD'), '321 Rue Flexibilite, Nice', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'))
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (6, 6, 'Girard', 'Thomas', TO_DATE('1992-09-18', 'YYYY-MM-DD'), '456 Rue Musculaire, Lyon', TO_DATE('2022-02-15', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (7, 7, 'Lemoine', 'Laura', TO_DATE('1991-07-25', 'YYYY-MM-DD'), '789 Boulevard Fitness, Marseille', TO_DATE('2020-12-08', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (8, 8, 'Morel', 'Alexandre', TO_DATE('1987-04-30', 'YYYY-MM-DD'), '987 Rue Force, Bordeaux', TO_DATE('2021-05-20', 'YYYY-MM-DD'), TO_DATE('2022-10-15', 'YYYY-MM-DD'))
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (9, 9, 'Lefevre', 'Julie', TO_DATE('1996-01-12', 'YYYY-MM-DD'), '321 Rue Flexibilite, Nice', TO_DATE('2023-03-15', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (10, 10, 'Roy', 'Luc', TO_DATE('1985-11-05', 'YYYY-MM-DD'), '234 Avenue Entraînement, Toulouse', TO_DATE('2022-07-01', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'))
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (11, 11, 'Boucher', 'Marie', TO_DATE('1993-06-28', 'YYYY-MM-DD'), '876 Rue Renforcement, Lille', TO_DATE('2020-09-22', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (12, 12, 'Gauthier', 'Nicolas', TO_DATE('1988-03-14', 'YYYY-MM-DD'), '567 Avenue Forme, Strasbourg', TO_DATE('2021-11-10', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (13, 13, 'Leroux', 'Sophie', TO_DATE('1990-08-09', 'YYYY-MM-DD'), '123 Rue Gym, Nantes', TO_DATE('2022-03-10', 'YYYY-MM-DD'), TO_DATE('2023-05-01', 'YYYY-MM-DD'))
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (14, 14, 'Coulombe', 'Pierre', TO_DATE('1986-12-17', 'YYYY-MM-DD'), '345 Boulevard Renforcement, Montpellier', TO_DATE('2022-05-05', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (15, 15, 'Poirier', 'Celine', TO_DATE('1995-04-02', 'YYYY-MM-DD'), '678 Rue Fitness, Rennes', TO_DATE('2023-01-15', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (16, 16, 'Fournier', 'Mathieu', TO_DATE('1989-10-11', 'YYYY-MM-DD'), '987 Avenue Sport, Nice', TO_DATE('2021-08-12', 'YYYY-MM-DD'), TO_DATE('2022-02-28', 'YYYY-MM-DD'))
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (17, 17, 'Lavoie', 'Isabelle', TO_DATE('1994-03-25', 'YYYY-MM-DD'), '456 Rue Exercice, Lyon', TO_DATE('2023-02-10', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (18, 18, 'Dubois', 'Antoine', TO_DATE('1987-06-20', 'YYYY-MM-DD'), '789 Boulevard Sport, Marseille', TO_DATE('2020-10-05', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (19, 19, 'Renaud', 'Camille', TO_DATE('1991-02-08', 'YYYY-MM-DD'), '543 Rue Musculation, Bordeaux', TO_DATE('2021-07-15', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (20, 20, 'Martin', 'Philippe', TO_DATE('1996-09-14', 'YYYY-MM-DD'), '876 Avenue Renforcement, Paris', TO_DATE('2022-04-20', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (21, 21, 'Gagnon', 'emilie', TO_DATE('1993-11-02', 'YYYY-MM-DD'), '345 Rue Entraînement, Toulouse', TO_DATE('2022-11-01', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (22, 22, 'Lemieux', 'Gabriel', TO_DATE('1986-04-18', 'YYYY-MM-DD'), '678 Avenue Fitness, Nice', TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2023-10-31', 'YYYY-MM-DD'))
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (23, 23, 'Bergeron', 'Julien', TO_DATE('1990-07-22', 'YYYY-MM-DD'), '123 Rue Renforcement, Lyon', TO_DATE('2022-02-28', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (24, 24, 'Morin', 'Melanie', TO_DATE('1989-01-15', 'YYYY-MM-DD'), '456 Avenue Musculaire, Bordeaux', TO_DATE('2022-08-15', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (25, 25, 'Perron', 'Vincent', TO_DATE('1996-06-08', 'YYYY-MM-DD'), '789 Boulevard Forme, Marseille', TO_DATE('2021-05-05', 'YYYY-MM-DD'), TO_DATE('2022-04-30', 'YYYY-MM-DD'))
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (26, 26, 'Caron', 'Stephanie', TO_DATE('1992-03-20', 'YYYY-MM-DD'), '987 Rue Sport, Lille', TO_DATE('2022-10-10', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (27, 27, 'Dion', 'Marc', TO_DATE('1987-08-12', 'YYYY-MM-DD'), '321 Rue Exercice, Nantes', TO_DATE('2020-12-15', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (28, 28, 'Gosselin', 'Valerie', TO_DATE('1991-05-28', 'YYYY-MM-DD'), '543 Avenue Musculation, Rennes', TO_DATE('2023-02-01', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (29, 29, 'Simard', 'etienne', TO_DATE('1988-10-03', 'YYYY-MM-DD'), '876 Boulevard Fitness, Strasbourg', TO_DATE('2022-04-10', 'YYYY-MM-DD'), NULL)
    INTO Membre (ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
    VALUES (30, 30, 'Larose', 'Nathalie', TO_DATE('1994-09-17', 'YYYY-MM-DD'), '234 Rue Sport, Montpellier', TO_DATE('2021-09-22', 'YYYY-MM-DD'), TO_DATE('2023-03-31', 'YYYY-MM-DD'))
SELECT * FROM dual;

INSERT ALL
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (1, 'Carte Bancaire', 'Card Type: Visa, Card Number: 1234-5678-9012-3456, Expiry Date: 05/24')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (2, 'Virement', 'Account Holder: John Doe, IBAN: FR76 3000 1234 5678 9012 3456 789, BIC: BNPAFRPPXXX')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (3, 'Paypal', 'Account Email: john.doe@example.com')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (4, 'Chèque', 'Payable to: Fitness Center, Address: 123 Gym Street, City: Fitnessville')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (5, 'Carte Bancaire', 'Card Type: MasterCard, Card Number: 9876-5432-1098-7654, Expiry Date: 09/23')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (6, 'Virement', 'Account Holder: Jane Smith, IBAN: FR76 3000 5678 9012 3456 7891 234, BIC: BNPAFRPPYYY')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (7, 'Paypal', 'Account Email: jane.smith@example.com')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (8, 'Chèque', 'Payable to: Fitness Center, Address: 456 Workout Avenue, City: Fitcity')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (9, 'Carte Bancaire', 'Card Type: American Express, Card Number: 5678-9012-3456-7890, Expiry Date: 12/25')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (10, 'Virement', 'Account Holder: Robert Johnson, IBAN: FR76 3000 9012 3456 7891 2345 678, BIC: BNPAFRPPZZZ')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (11, 'Paypal', 'Account Email: robert.johnson@example.com')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (12, 'Chèque', 'Payable to: Fitness Center, Address: 789 Exercise Street, City: Fitland')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (13, 'Carte Bancaire', 'Card Type: Discover, Card Number: 9012-3456-7890-1234, Expiry Date: 03/22')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (14, 'Virement', 'Account Holder: Sarah Davis, IBAN: FR76 3000 3456 7891 2345 6789 012, BIC: BNPAFRPPAAA')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (15, 'Paypal', 'Account Email: sarah.davis@example.com')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (16, 'Chèque', 'Payable to: Fitness Center, Address: 234 Strength Avenue, City: Fitville')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (17, 'Carte Bancaire', 'Card Type: Diners Club, Card Number: 3456-7890-1234-5678, Expiry Date: 06/23')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (18, 'Virement', 'Account Holder: Michael White, IBAN: FR76 3000 7891 2345 6789 0123 456, BIC: BNPAFRPPBBB')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (19, 'Paypal', 'Account Email: michael.white@example.com')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (20, 'Chèque', 'Payable to: Fitness Center, Address: 567 Health Street, City: Fitness City')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (21, 'Carte Bancaire', 'Card Type: Visa, Card Number: 5678-1234-9012-3456, Expiry Date: 08/23')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (22, 'Virement', 'Account Holder: Jessica Miller, IBAN: FR76 3000 2345 6789 0123 4567 890, BIC: BNPAFRPPCCC')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (23, 'Paypal', 'Account Email: jessica.miller@example.com')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (24, 'Chèque', 'Payable to: Fitness Center, Address: 789 Fitness Street, City: Bodyville')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (25, 'Carte Bancaire', 'Card Type: Maestro, Card Number: 7890-1234-5678-9012, Expiry Date: 02/24')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (26, 'Virement', 'Account Holder: William Taylor, IBAN: FR76 3000 3456 7890 1234 5678 901, BIC: BNPAFRPPDDD')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (27, 'Paypal', 'Account Email: william.taylor@example.com')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (28, 'Chèque', 'Payable to: Fitness Center, Address: 123 Health Avenue, City: Wellness City')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (29, 'Carte Bancaire', 'Card Type: JCB, Card Number: 3456-9012-1234-5678, Expiry Date: 11/22')
    INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Details)
    VALUES (30, 'Virement', 'Account Holder: Emily Wilson, IBAN: FR76 3000 4567 8901 2345 6789 012, BIC: BNPAFRPPEEE')
SELECT * FROM dual;

INSERT ALL
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (1, 'Seated leg press', 'machine', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (2, 'Decline leg press', 'machine', TO_DATE('2022-02-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (3, 'Leg extension', 'machine', TO_DATE('2022-03-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (4, 'Seated leg curl', 'machine', TO_DATE('2022-04-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (5, 'Lying leg curl', 'machine', TO_DATE('2022-05-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (6, 'Shoulder press', 'machine', TO_DATE('2022-06-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (7, 'Converging chest press', 'machine', TO_DATE('2022-07-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (8, 'Pec deck', 'machine', TO_DATE('2022-08-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (9, 'Chest press', 'machine', TO_DATE('2022-09-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (10, 'Lat pulldown', 'machine', TO_DATE('2022-10-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (11, 'Seated row', 'machine', TO_DATE('2022-11-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (12, 'Converging seated row', 'machine', TO_DATE('2022-12-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (13, 'Preacher curl', 'machine', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (14, 'Seated dips', 'machine', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (15, 'Long barbell', 'poids libre', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 800)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (16, 'Mid barbell', 'poids libre', TO_DATE('2023-04-01', 'YYYY-MM-DD'), 800)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (17, 'Dumbbell (lot)', 'poids libre', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 800)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (18, 'Weight disk (lot)', 'poids libre', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 800)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (19, 'Adjustable bench', 'banc et cadres', TO_DATE('2023-07-01', 'YYYY-MM-DD'), 700)
    INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
    VALUES (20, 'Smith machine', 'banc et cadres', TO_DATE('2023-08-01', 'YYYY-MM-DD'), 700)
SELECT * FROM dual;

INSERT ALL
    INTO TypeDeCours (ID_TypeDeCours, Type_TypeDeCours)
    VALUES (1, 'Yoga')
    INTO TypeDeCours (ID_TypeDeCours, Type_TypeDeCours)
    VALUES (2, 'Pilates')
    INTO TypeDeCours (ID_TypeDeCours, Type_TypeDeCours)
    VALUES (3, 'CrossFit')
    INTO TypeDeCours (ID_TypeDeCours, Type_TypeDeCours)
    VALUES (4, 'Abdos Fessier')
    INTO TypeDeCours (ID_TypeDeCours, Type_TypeDeCours)
    VALUES (5, 'Spinning')
    INTO TypeDeCours (ID_TypeDeCours, Type_TypeDeCours)
    VALUES (6, 'Kickboxing')
    INTO TypeDeCours (ID_TypeDeCours, Type_TypeDeCours)
    VALUES (7, 'Danse Fitness')
    INTO TypeDeCours (ID_TypeDeCours, Type_TypeDeCours)
    VALUES (8, 'Jumping Jack')
    INTO TypeDeCours (ID_TypeDeCours, Type_TypeDeCours)
    VALUES (9, 'Bodybuilding')
    INTO TypeDeCours (ID_TypeDeCours, Type_TypeDeCours)
    VALUES (10, 'HIIT')
SELECT * FROM dual;

INSERT ALL
    INTO Entraineur (ID_Entraineur, Nom, Prenom, Specialite, DateEmbauche)
    VALUES (1, 'Colas', 'Stéphanie', 'Spinning', TO_DATE('2023-03-15', 'YYYY-MM-DD'))
    INTO Entraineur (ID_Entraineur, Nom, Prenom, Specialite, DateEmbauche)
    VALUES (2, 'Perrin', 'Denis', 'Danse Fitness', TO_DATE('2023-08-09', 'YYYY-MM-DD'))
    INTO Entraineur (ID_Entraineur, Nom, Prenom, Specialite, DateEmbauche)
    VALUES (3, 'Leclercq', 'Xavier', 'Abdo Fessier', TO_DATE('2019-07-16', 'YYYY-MM-DD'))
    INTO Entraineur (ID_Entraineur, Nom, Prenom, Specialite, DateEmbauche)
    VALUES (4, 'Schneider', 'Hugues', 'Kickboxing', TO_DATE('2018-08-11', 'YYYY-MM-DD'))
    INTO Entraineur (ID_Entraineur, Nom, Prenom, Specialite, DateEmbauche)
    VALUES (5, 'Charles', 'Frédéric', 'Bodybuilding', TO_DATE('2020-08-31', 'YYYY-MM-DD'))
    INTO Entraineur (ID_Entraineur, Nom, Prenom, Specialite, DateEmbauche)
    VALUES (6, 'Vincent', 'Christiane', 'Jumping Jack', TO_DATE('2014-10-03', 'YYYY-MM-DD'))
    INTO Entraineur (ID_Entraineur, Nom, Prenom, Specialite, DateEmbauche)
    VALUES (7, 'Antoine', 'Aimée', 'HIIT', TO_DATE('2014-10-26', 'YYYY-MM-DD'))
    INTO Entraineur (ID_Entraineur, Nom, Prenom, Specialite, DateEmbauche)
    VALUES (8, 'Barbier', 'Victor', 'CrossFit', TO_DATE('2018-05-26', 'YYYY-MM-DD'))
    INTO Entraineur (ID_Entraineur, Nom, Prenom, Specialite, DateEmbauche)
    VALUES (9, 'Neveu', 'Capucine', 'Pilates', TO_DATE('2023-06-07', 'YYYY-MM-DD'))
    INTO Entraineur (ID_Entraineur, Nom, Prenom, Specialite, DateEmbauche)
    VALUES (10, 'Gosselin', 'Valentine', 'Yoga', TO_DATE('2020-11-17', 'YYYY-MM-DD'))
SELECT * FROM dual;

INSERT ALL
    INTO Cours (ID_Cours, ID_TypeDeCours, ID_Entraineur, Nom, Description)
    VALUES (1, 1, 10, 'Yoga Flow', 'Séance de yoga dynamique pour renforcer et assouplir le corps.')
    INTO Cours (ID_Cours, ID_TypeDeCours, ID_Entraineur, Nom, Description)
    VALUES (2, 2, 9, 'Pilates Core', 'Cours de Pilates axé sur le renforcement des muscles profonds et la stabilité du tronc.')
    INTO Cours (ID_Cours, ID_TypeDeCours, ID_Entraineur, Nom, Description)
    VALUES (3, 3, 8, 'CrossFit Challenge', 'Entraînement intensif mêlant différents exercices pour développer la force et l''endurance.')
    INTO Cours (ID_Cours, ID_TypeDeCours, ID_Entraineur, Nom, Description)
    VALUES (4, 4, 3, 'Booty Blast', 'Séance ciblée sur les muscles des fesses et des jambes pour un renforcement efficace.')
    INTO Cours (ID_Cours, ID_TypeDeCours, ID_Entraineur, Nom, Description)
    VALUES (5, 5, 1, 'Spinning Adventure', 'Voyage virtuel à travers différents terrains en pédalant sur un vélo stationnaire.')
    INTO Cours (ID_Cours, ID_TypeDeCours, ID_Entraineur, Nom, Description)
    VALUES (6, 6, 4, 'Kickboxing Cardio', 'Combinaison de mouvements de kickboxing pour améliorer la condition physique.')
    INTO Cours (ID_Cours, ID_TypeDeCours, ID_Entraineur, Nom, Description)
    VALUES (7, 7, 2, 'Dance Fusion', 'Cours de danse énergique combinant différents styles pour brûler des calories.')
    INTO Cours (ID_Cours, ID_TypeDeCours, ID_Entraineur, Nom, Description)
    VALUES (8, 8, 5, 'Jumping Jack Joy', 'Entraînement cardio avec des sauts et des mouvements de jumping jack.')
    INTO Cours (ID_Cours, ID_TypeDeCours, ID_Entraineur, Nom, Description)
    VALUES (9, 9, 7, 'Bodybuilding Basics', 'Introduction aux exercices de musculation pour le renforcement musculaire.')
    INTO Cours (ID_Cours, ID_TypeDeCours, ID_Entraineur, Nom, Description)
    VALUES (10, 10, 6, 'HIIT Intense', 'Entraînement fractionné de haute intensité pour améliorer la condition physique globale.')
SELECT * FROM dual;

INSERT ALL
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (1, 1)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (2, 2)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (3, 3)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (4, 4)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (5, 5)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (1, 6)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (2, 7)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (3, 8)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (4, 9)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (5, 10)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (1, 11)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (2, 12)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (3, 13)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (4, 14)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (5, 15)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (1, 16)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (2, 17)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (3, 18)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (4, 19)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (5, 20)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (1, 21)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (2, 22)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (3, 23)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (4, 24)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (5, 25)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (1, 26)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (2, 27)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (3, 28)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (4, 29)
    INTO EstMembreDe (ID_Salle, ID_Membre)
    VALUES (5, 30)
SELECT * FROM dual;

INSERT ALL
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (1, 1, 1, TO_DATE('2023-01-15', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (2, 2, 2, TO_DATE('2023-02-01', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (3, 3, 3, TO_DATE('2023-03-10', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (4, 4, 4, TO_DATE('2023-04-05', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (5, 5, 5, TO_DATE('2023-05-20', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (6, 6, 6, TO_DATE('2023-06-01', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (7, 7, 7, TO_DATE('2023-07-08', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (8, 8, 8, TO_DATE('2023-08-12', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (9, 9, 9, TO_DATE('2023-09-25', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (10, 10, 10, TO_DATE('2023-10-03', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (11, 11, 11, TO_DATE('2023-11-18', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (12, 12, 12, TO_DATE('2024-01-07', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (13, 13, 13, TO_DATE('2024-02-14', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (14, 14, 14, TO_DATE('2024-03-02', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (15, 15, 15, TO_DATE('2024-04-15', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (16, 16, 16, TO_DATE('2024-05-22', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (17, 17, 17, TO_DATE('2024-06-10', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (18, 18, 18, TO_DATE('2024-07-01', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (19, 19, 19, TO_DATE('2024-08-05', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (20, 20, 20, TO_DATE('2024-09-20', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (21, 21, 21, TO_DATE('2024-10-15', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (22, 22, 22, TO_DATE('2024-11-01', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (23, 23, 23, TO_DATE('2024-12-10', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (24, 24, 24, TO_DATE('2025-01-05', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (25, 25, 25, TO_DATE('2025-02-20', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (26, 26, 26, TO_DATE('2025-03-01', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (27, 27, 27, TO_DATE('2025-04-08', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (28, 28, 28, TO_DATE('2025-05-12', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (29, 29, 29, TO_DATE('2025-06-25', 'YYYY-MM-DD'))
    INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
    VALUES (30, 30, 30, TO_DATE('2025-07-03', 'YYYY-MM-DD'))
SELECT * FROM dual;

-- Équipement pour Salle 1
INSERT ALL
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 1, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 2, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 3, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 4, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 5, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 6, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 7, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 8, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 9, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 10, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 11, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 12, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 13, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 14, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 15, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 16, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 17, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 18, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 19, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (1, 20, 3)
SELECT * FROM dual;

-- Équipement pour Salle 2
INSERT ALL
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 1, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 2, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 3, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 4, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 5, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 6, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 7, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 8, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 9, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 10, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 11, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 12, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 13, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 14, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 15, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 16, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 17, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 18, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 19, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (2, 20, 3)
SELECT * FROM dual;

-- Équipement pour Salle 3
INSERT ALL
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 1, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 2, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 3, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 4, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 5, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 6, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 7, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 8, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 9, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 10, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 11, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 12, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 13, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 14, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 15, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 16, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 17, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 18, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 19, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (3, 20, 2)
SELECT * FROM dual;

-- Équipement pour Salle 4
INSERT ALL
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 1, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 2, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 3, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 4, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 5, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 6, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 7, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 8, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 9, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 10, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 11, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 12, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 13, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 14, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 15, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 16, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 17, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 18, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 19, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (4, 20, 2)
SELECT * FROM dual;

-- Équipement pour Salle 5
INSERT ALL
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 1, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 2, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 3, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 4, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 5, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 6, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 7, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 8, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 9, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 10, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 11, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 12, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 13, 2)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 14, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 15, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 16, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 17, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 18, 4)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 19, 3)
    INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
    VALUES (5, 20, 3)
SELECT * FROM dual;

-- ces données activent les triggers
INSERT ALL
    INTO SeTientDansPropose (ID_Salle, ID_Cours, HoraireDebut, HoraireFin, Jour)
    VALUES (1, 1, TO_TIMESTAMP('2023-01-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-15 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-15', 'YYYY-MM-DD'))
    INTO SeTientDansPropose (ID_Salle, ID_Cours, HoraireDebut, HoraireFin, Jour)
    VALUES (2, 2, TO_TIMESTAMP('2023-02-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-02-01 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-01', 'YYYY-MM-DD'))
    INTO SeTientDansPropose (ID_Salle, ID_Cours, HoraireDebut, HoraireFin, Jour)
    VALUES (3, 3, TO_TIMESTAMP('2023-03-10 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-03-10 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-10', 'YYYY-MM-DD'))
    INTO SeTientDansPropose (ID_Salle, ID_Cours, HoraireDebut, HoraireFin, Jour)
    VALUES (4, 4, TO_TIMESTAMP('2023-04-05 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-04-05 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-05', 'YYYY-MM-DD'))
    INTO SeTientDansPropose (ID_Salle, ID_Cours, HoraireDebut, HoraireFin, Jour)
    VALUES (5, 5, TO_TIMESTAMP('2023-05-20 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-05-20 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-05-20', 'YYYY-MM-DD'))
    INTO SeTientDansPropose (ID_Salle, ID_Cours, HoraireDebut, HoraireFin, Jour)
    VALUES (1, 6, TO_TIMESTAMP('2023-06-01 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-06-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-01', 'YYYY-MM-DD'))
    INTO SeTientDansPropose (ID_Salle, ID_Cours, HoraireDebut, HoraireFin, Jour)
    VALUES (2, 7, TO_TIMESTAMP('2023-07-08 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-08 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-08', 'YYYY-MM-DD'))
    INTO SeTientDansPropose (ID_Salle, ID_Cours, HoraireDebut, HoraireFin, Jour)
    VALUES (3, 8, TO_TIMESTAMP('2023-08-12 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-12 21:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-12', 'YYYY-MM-DD'))
    INTO SeTientDansPropose (ID_Salle, ID_Cours, HoraireDebut, HoraireFin, Jour)
    VALUES (4, 9, TO_TIMESTAMP('2023-09-25 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-09-25 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-25', 'YYYY-MM-DD'))
    INTO SeTientDansPropose (ID_Salle, ID_Cours, HoraireDebut, HoraireFin, Jour)
    VALUES (5, 10, TO_TIMESTAMP('2023-10-03 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-10-03 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-10-03', 'YYYY-MM-DD'))
SELECT * FROM dual;
--

INSERT ALL
    INTO Participe (ID_Membre, ID_Cours, Date_Participe)
    VALUES (1, 1, TO_DATE('2023-01-15', 'YYYY-MM-DD'))
    INTO Participe (ID_Membre, ID_Cours, Date_Participe)
    VALUES (1, 2, TO_DATE('2023-02-01', 'YYYY-MM-DD'))
    INTO Participe (ID_Membre, ID_Cours, Date_Participe)
    VALUES (2, 1, TO_DATE('2023-02-15', 'YYYY-MM-DD'))
    INTO Participe (ID_Membre, ID_Cours, Date_Participe)
    VALUES (2, 2, TO_DATE('2023-02-01', 'YYYY-MM-DD'))
    INTO Participe (ID_Membre, ID_Cours, Date_Participe)
    VALUES (3, 3, TO_DATE('2023-03-10', 'YYYY-MM-DD'))
    INTO Participe (ID_Membre, ID_Cours, Date_Participe)
    VALUES (3, 6, TO_DATE('2023-03-25', 'YYYY-MM-DD'))
    INTO Participe (ID_Membre, ID_Cours, Date_Participe)
    VALUES (4, 4, TO_DATE('2023-04-05', 'YYYY-MM-DD'))
    INTO Participe (ID_Membre, ID_Cours, Date_Participe)
    VALUES (5, 5, TO_DATE('2023-05-20', 'YYYY-MM-DD'))
    INTO Participe (ID_Membre, ID_Cours, Date_Participe)
    VALUES (6, 6, TO_DATE('2023-06-01', 'YYYY-MM-DD'))
    INTO Participe (ID_Membre, ID_Cours, Date_Participe)
    VALUES (7, 7, TO_DATE('2023-07-08', 'YYYY-MM-DD'))
    INTO Participe (ID_Membre, ID_Cours, Date_Participe)
    VALUES (8, 8, TO_DATE('2023-08-12', 'YYYY-MM-DD'))
    INTO Participe (ID_Membre, ID_Cours, Date_Participe)
    VALUES (9, 9, TO_DATE('2023-09-25', 'YYYY-MM-DD'))
    INTO Participe (ID_Membre, ID_Cours, Date_Participe)
    VALUES (10, 10, TO_DATE('2023-10-03', 'YYYY-MM-DD'))
SELECT * FROM dual;
```

### C. Manipulation des données

1. Quel est le nombre total de membres ?
    
    ```sql
    SELECT COUNT(ID_Membre) AS Total_Membres
    FROM Membre;
    ```
    
2. Quel est le revenu moyen des abonnements ?
    
    ```sql
    SELECT AVG(Prix) AS Revenu_Moyen_Abonnements
    FROM Abonnement;
    ```
    
3. Quel est le nombre d'équipements par salle ?
    
    ```sql
    SELECT ID_Salle, SUM(Quantite) AS Total_Equipements
    FROM EstEquipeDe
    GROUP BY ID_Salle;
    ```
    
4. Quels sont tous les membres avec un abonnement actif ?
    
    ```sql
    SELECT M.ID_Membre, M.Nom, M.Prenom
    FROM Membre M
    JOIN Abonnement A ON M.ID_Abonnement = A.ID_Abonnement
    WHERE A.DateFin IS NULL OR A.DateFin > SYSDATE;
    ```
    
5. Quels sont le nom et le prénom des membres ?
    
    ```sql
    SELECT Nom, Prenom
    FROM Membre;
    ```
    
6. Quel abonnement est lié à quel membre ?
    
    ```sql
    SELECT M.ID_Membre, M.Nom, M.Prenom, A.Type_Abonnement, A.Prix
    FROM Membre M
    JOIN Abonnement A ON M.ID_Abonnement = A.ID_Abonnement;
    ```
    
7. Quels cours sont liés à quel entraîneur ?
    
    ```sql
    SELECT C.ID_Cours, C.Nom, E.Nom AS Nom_Entraineur, E.Prenom AS Prenom_Entraineur
    FROM Cours C
    JOIN Entraineur E ON C.ID_Entraineur = E.ID_Entraineur;
    ```
    
8. Quels équipements sont liés à quelle salle ?
    
    ```sql
    SELECT E.ID_Equipement, E.Nom, S.ID_Salle, S.Nom AS Nom_Salle
    FROM Equipement E
    JOIN EstEquipeDe EE ON E.ID_Equipement = EE.ID_Equipement
    JOIN SalleMusculation S ON EE.ID_Salle = S.ID_Salle;
    ```
    
9. Quels sont les membres inscrits à tous les cours proposés par un certain entraîneur (remplacer `[EntraineurID]` par l’ID de l’entraineur qu’on veut) ?
    
    ```sql
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
    ```
    
10. Quels sont les membres qui sont à la fois dans des cours de yoga et de Pilates ?
    
    ```sql
    -- Membres dans des cours de cardio
    WITH Cardio AS (
        SELECT P.ID_Membre
        FROM Participe P
        JOIN Cours C ON P.ID_Cours = C.ID_Cours
        JOIN TypeDeCours T ON C.ID_TypeDeCours = T.ID_TypeDeCours
        WHERE T.Type_TypeDeCours = 'Yoga'
    ),
    -- Membres dans des cours de musculation
    Muscu AS (
        SELECT P.ID_Membre
        FROM Participe P
        JOIN Cours C ON P.ID_Cours = C.ID_Cours
        JOIN TypeDeCours T ON C.ID_TypeDeCours = T.ID_TypeDeCours
        WHERE T.Type_TypeDeCours = 'Pilates'
    )
    -- Intersection
    SELECT M.ID_Membre, M.Nom, M.Prenom
    FROM Membre M
    WHERE M.ID_Membre IN (SELECT ID_Membre FROM Cardio)
    AND M.ID_Membre IN (SELECT ID_Membre FROM Muscu);
    ```
    
11. Quels membres ont assisté à la fois à des cours de CrossFit et de Kickboxing le même mois ?
    
    ```sql
    -- Membres dans des cours de crossfit
    WITH Crossfit AS (
        SELECT P.ID_Membre, EXTRACT(MONTH FROM P.Date_Participe) AS Mois
        FROM Participe P
        JOIN Cours C ON P.ID_Cours = C.ID_Cours
        JOIN TypeDeCours T ON C.ID_TypeDeCours = T.ID_TypeDeCours
        WHERE T.Type_TypeDeCours = 'CrossFit'
    ),
    -- Membres dans des cours de kickboxing
    Kickboxing AS (
        SELECT P.ID_Membre, EXTRACT(MONTH FROM P.Date_Participe) AS Mois
        FROM Participe P
        JOIN Cours C ON P.ID_Cours = C.ID_Cours
        JOIN TypeDeCours T ON C.ID_TypeDeCours = T.ID_TypeDeCours
        WHERE T.Type_TypeDeCours = 'Kickboxing'
    )
    -- Intersection
    SELECT M.ID_Membre, M.Nom, M.Prenom
    FROM Membre M
    WHERE EXISTS (
        SELECT 1
        FROM Crossfit C
        JOIN Kickboxing K ON C.ID_Membre = K.ID_Membre AND C.Mois = K.Mois
        WHERE M.ID_Membre = C.ID_Membre
    );
    ```
    
12. Quelle est la liste complète des membres actifs et des entraîneurs ?
    
    ```sql
    SELECT ID_Membre AS ID, Nom, Prenom, 'Membre' AS Type
    FROM Membre
    WHERE ID_Abonnement IN (SELECT ID_Abonnement FROM Abonnement WHERE DateFin IS NULL OR DateFin > SYSDATE)
    UNION
    SELECT ID_Entraineur AS ID, Nom, Prenom, 'Entraineur' AS Type
    FROM Entraineur;
    ```
    
13. Quels équipements sont disponibles dans certaines salles mais pas dans d'autres (remplacer `[SalleAID]` et `[SalleBID]` par les ID de salle voulus) ?
    
    ```sql
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
    ```
    
14. Quels sont tous les entraîneurs et les cours qu'ils donnent (y compris ceux qui n'ont pas encore de cours attribués) ?
    
    ```sql
    SELECT E.ID_Entraineur, E.Nom AS Nom_Entraineur, E.Prenom AS Prenom_Entraineur, C.ID_Cours, C.Nom AS Nom_Cours
    FROM Entraineur E
    LEFT JOIN Cours C ON E.ID_Entraineur = C.ID_Entraineur;
    ```
    
15. Que donne la jointure des membres, abonnements, paiements, et cours pour obtenir un rapport détaillé sur les activités des membres ?
    
    ```sql
    SELECT M.ID_Membre, M.Nom, M.Prenom, A.Type_Abonnement, A.Prix, PP.Date_PossedePaye, C.Nom AS Nom_Cours
    FROM Membre M
    JOIN Abonnement A ON M.ID_Abonnement = A.ID_Abonnement
    JOIN PossedePaye PP ON M.ID_Membre = PP.ID_Membre
    JOIN Participe P ON M.ID_Membre = P.ID_Membre
    JOIN Cours C ON P.ID_Cours = C.ID_Cours;
    ```
    
16. Quels sont les membres qui ont suivi tous les types de cours proposés ?
    
    ```sql
    SELECT M.ID_Membre, M.Nom, M.Prenom
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
    ```
    

### D. Vues et rôles

- Vue du nombre total d'équipements par salle de musculation :
    
    ```sql
    CREATE VIEW EquipementsParSalle AS
    SELECT ID_Salle, COUNT(ID_Equipement) AS NombreEquipements
    FROM EstEquipeDe
    GROUP BY ID_Salle;
    ```
    
- Vue des revenus moyens par type d'abonnement :
    
    ```sql
    CREATE VIEW RevenuMoyenAbonnement AS
    SELECT Type_Abonnement, AVG(Prix) AS RevenuMoyen
    FROM Abonnement
    GROUP BY Type_Abonnement;
    ```
    
- Vue des membres et de leur dernier paiement :
    
    ```sql
    CREATE VIEW DernierPaiementMembre AS
    SELECT M.ID_Membre, M.Nom, M.Prenom, MAX(P.Date_PossedePaye) AS DernierPaiement
    FROM Membre M
    JOIN PossedePaye P ON M.ID_Membre = P.ID_Membre
    GROUP BY M.ID_Membre, M.Nom, M.Prenom;
    ```
    
- Vue des cours et du nombre de participants :
    
    ```sql
    CREATE VIEW ParticipantsParCours AS
    SELECT C.ID_Cours, C.Nom, COUNT(P.ID_Membre) AS NombreParticipants
    FROM Cours C
    JOIN Participe P ON C.ID_Cours = P.ID_Cours
    GROUP BY C.ID_Cours, C.Nom;
    ```
    
- Vue des entraîneurs et du nombre de cours qu'ils donnent :
    
    ```sql
    CREATE VIEW CoursParEntraineur AS
    SELECT E.ID_Entraineur, E.Nom, E.Prenom, COUNT(C.ID_Cours) AS NombreCours
    FROM Entraineur E
    JOIN Cours C ON E.ID_Entraineur = C.ID_Cours
    GROUP BY E.ID_Entraineur, E.Nom, E.Prenom;
    ```
    
- Rôle `Administrateur` (accès complet à toutes les données et fonctionnalités de la base de données, peut ajouter, modifier, supprimer et lire toutes les données, ainsi que gérer les utilisateurs et les rôles) :
    
    ```sql
    CREATE ROLE Administrateur;
    GRANT ALL PRIVILEGES ON DATABASE MaBaseDeDonnees TO Administrateur;
    ```
    
- Rôle `GestionnaireDeSalle` (peut gérer les informations relatives à une salle de musculation spécifique, y compris l'ajout, la modification et la suppression d'équipements et de cours, ainsi que les paiements effectués) :
    
    ```sql
    CREATE ROLE GestionnaireDeSalle;
    GRANT SELECT, INSERT, UPDATE, DELETE ON SalleMusculation, Equipement, Cours TO GestionnaireDeSalle;
    GRANT SELECT, INSERT, UPDATE ON Paiements, MoyenPaiement TO GestionnaireDeSalle;
    ```
    
- Rôle `Entraineur` (peut ajouter, modifier et supprimer des cours qu'il donne) :
    
    ```sql
    CREATE ROLE Entraineur;
    GRANT SELECT, INSERT, UPDATE, DELETE ON Cours TO Entraineur;
    ```
    
- Rôle `Membre` (accès en lecture seule à certaines informations pertinentes pour un membre de la salle de musculation, comme les détails des cours auxquels il participe, ou la possibilité de consulter ses moyens de paiements et de transactions, et les mettre à jour au besoin) :
    
    ```sql
    CREATE ROLE Membre;
    GRANT SELECT ON Cours, Participe TO Membre;
    GRANT SELECT, INSERT, UPDATE ON MoyenPaiement, Paiements TO Membre WHERE MembreID = USER_ID();
    ```
    

### E. Triggers

- Trigger `CheckDateOuverture` (avant d'insérer ou de mettre à jour une salle de musculation, ce trigger vérifie si la date d'ouverture indiquée est postérieure à la date actuelle) :
    
    ```sql
    CREATE OR REPLACE TRIGGER CheckDateOuverture
    BEFORE INSERT OR UPDATE ON SalleMusculation
    FOR EACH ROW
    BEGIN
        IF :NEW.DateOuverture > SYSDATE THEN
            RAISE_APPLICATION_ERROR(-20001, 'La date d''ouverture doit être inférieure ou égale à la date actuelle.');
        END IF;
    END;
    ```
    
- Trigger `CheckDateNaissance` (avant d'insérer ou de mettre à jour un membre, ce trigger vérifie si la date de naissance indiquée est postérieure à la date actuelle) :
    
    ```sql
    CREATE OR REPLACE TRIGGER CheckDateNaissance
    BEFORE INSERT OR UPDATE ON Membre
    FOR EACH ROW
    BEGIN
        IF :NEW.DateNaissance > SYSDATE THEN
            RAISE_APPLICATION_ERROR(-20002, 'La date de naissance doit être inférieure ou égale à la date actuelle.');
        END IF;
    END;
    ```
    
- Trigger `CheckEquipementDateAchat` (avant d'insérer ou de mettre à jour un équipement, ce trigger vérifie si la date d'achat indiquée est postérieure à la date actuelle) :
    
    ```sql
    CREATE OR REPLACE TRIGGER CheckEquipementDateAchat
    BEFORE INSERT OR UPDATE ON Equipement
    FOR EACH ROW
    BEGIN
        IF :NEW.DateAchat > SYSDATE THEN
            RAISE_APPLICATION_ERROR(-20007, 'La date d''achat de l''équipement doit être inférieure ou égale à la date actuelle.');
        END IF;
    END;
    ```
    
- Trigger `CheckEntraineurDateEmbauche` (avant d'insérer ou de mettre à jour un entraîneur, ce trigger vérifie si la date d'embauche indiquée est postérieure à la date actuelle) :
    
    ```sql
    CREATE OR REPLACE TRIGGER CheckEntraineurDateEmbauche
    BEFORE INSERT OR UPDATE ON Entraineur
    FOR EACH ROW
    BEGIN
        IF :NEW.DateEmbauche > SYSDATE THEN
            RAISE_APPLICATION_ERROR(-20008, 'La date d''embauche de l''entraineur doit être inférieure ou égale à la date actuelle.');
        END IF;
    END;
    ```
    
- Trigger `CheckCoursHoraireDebut` (après avoir inséré ou mis à jour un cours dans la table `SeTientDansPropose`, ce trigger vérifie si l'horaire de début du cours est postérieur à l'horaire d'ouverture de la salle de musculation associée) :
    
    ```sql
    CREATE OR REPLACE TRIGGER CheckCoursHoraireDebut
    AFTER INSERT OR UPDATE ON SeTientDansPropose
    FOR EACH ROW
    DECLARE
        v_HoraireOuverture TIMESTAMP;
    BEGIN
        SELECT HoraireOuverture INTO v_HoraireOuverture FROM SalleMusculation WHERE ID_Salle = :NEW.ID_Salle;
        IF :NEW.HoraireDebut < v_HoraireOuverture THEN
            RAISE_APPLICATION_ERROR(-20009, 'L''horaire de début du cours doit être après l''horaire d''ouverture de la salle.');
        END IF;
    END;
    ```
    
- Trigger `CheckCoursHoraireFin` (après avoir inséré ou mis à jour un cours dans la table `SeTientDansPropose`, ce trigger vérifie si l'horaire de fin du cours est antérieur à l'horaire de fermeture de la salle de musculation associée) :
    
    ```sql
    CREATE OR REPLACE TRIGGER CheckCoursHoraireFin
    AFTER INSERT OR UPDATE ON SeTientDansPropose
    FOR EACH ROW
    DECLARE
        v_HoraireFermeture TIMESTAMP;
    BEGIN
        SELECT HoraireFermeture INTO v_HoraireFermeture FROM SalleMusculation WHERE ID_Salle = :NEW.ID_Salle;
        IF :NEW.HoraireFin > v_HoraireFermeture THEN
            RAISE_APPLICATION_ERROR(-20010, 'L''horaire de fin du cours doit être avant l''horaire de fermeture de la salle.');
        END IF;
    END;
    ```
    
- Trigger `CheckCoursJour` (avant d'insérer un cours dans la table `SeTientDansPropose`, ce trigger vérifie si le jour programmé pour le cours est au moins le lendemain de la date actuelle) :
    
    ```sql
    CREATE OR REPLACE TRIGGER CheckCoursJour
    BEFORE INSERT ON SeTientDansPropose
    FOR EACH ROW
    BEGIN
        IF :NEW.Jour < SYSDATE + 1 THEN
            RAISE_APPLICATION_ERROR(-20011, 'Les cours doivent être créés pour au moins le jour suivant.');
        END IF;
    END;
    ```
    

### F. Méta-données
