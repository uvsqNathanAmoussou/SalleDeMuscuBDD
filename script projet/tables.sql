-- A/ Creation du schema de la base de donnees

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

CREATE TABLE MoyenPaiement (
    ID_Paiement NUMBER NOT NULL,
    Type_MoyenPaiement VARCHAR2(50) NOT NULL,
    Détails VARCHAR2(255),
    PRIMARY KEY (ID_Paiement)
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
    Prénom VARCHAR2(100) NOT NULL,
    DateNaissance DATE NOT NULL,
    Adresse VARCHAR2(255) NOT NULL,
    DateInscription DATE NOT NULL,
    DateResiliation DATE,
    PRIMARY KEY (ID_Membre),
    FOREIGN KEY (ID_Abonnement) REFERENCES Abonnement(ID_Abonnement)
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
    Prénom VARCHAR2(100) NOT NULL,
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
