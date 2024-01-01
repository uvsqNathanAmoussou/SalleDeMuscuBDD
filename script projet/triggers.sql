CREATE OR REPLACE TRIGGER CheckDateOuverture
BEFORE INSERT OR UPDATE ON SalleMusculation
FOR EACH ROW
BEGIN
    IF :NEW.DateOuverture > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001, 'La date d''ouverture doit être inférieure ou égale à la date actuelle.');
    END IF;
END;

CREATE OR REPLACE TRIGGER CheckDateNaissance
BEFORE INSERT OR UPDATE ON Membre
FOR EACH ROW
BEGIN
    IF :NEW.DateNaissance > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20002, 'La date de naissance doit être inférieure ou égale à la date actuelle.');
    END IF;
END;

CREATE OR REPLACE TRIGGER CheckDateInscription
AFTER INSERT OR UPDATE ON Membre
FOR EACH ROW
DECLARE
    v_DateDebut DATE;
BEGIN
    SELECT DateDebut INTO v_DateDebut FROM Abonnement WHERE ID_Abonnement = :NEW.ID_Abonnement;
    IF v_DateDebut != :NEW.DateInscription THEN
        RAISE_APPLICATION_ERROR(-20003, 'La date d''inscription doit correspondre à la date de début de l''abonnement.');
    END IF;
END;

CREATE OR REPLACE TRIGGER CheckDateResiliation
AFTER INSERT OR UPDATE ON Membre
FOR EACH ROW
DECLARE
    v_DateFin DATE;
BEGIN
    SELECT DateFin INTO v_DateFin FROM Abonnement WHERE ID_Abonnement = :NEW.ID_Abonnement;
    IF :NEW.DateResiliation IS NOT NULL AND v_DateFin != :NEW.DateResiliation THEN
        RAISE_APPLICATION_ERROR(-20004, 'La date de résiliation doit correspondre à la date de fin de l''abonnement.');
    END IF;
END;


CREATE OR REPLACE TRIGGER CheckEquipementDateAchat
BEFORE INSERT OR UPDATE ON Equipement
FOR EACH ROW
BEGIN
    IF :NEW.DateAchat > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20007, 'La date d''achat de l''équipement doit être inférieure ou égale à la date actuelle.');
    END IF;
END;

CREATE OR REPLACE TRIGGER CheckEntraineurDateEmbauche
BEFORE INSERT OR UPDATE ON Entraineur
FOR EACH ROW
BEGIN
    IF :NEW.DateEmbauche > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20008, 'La date d''embauche de l''entraineur doit être inférieure ou égale à la date actuelle.');
    END IF;
END;


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

CREATE OR REPLACE TRIGGER CheckCoursJour
BEFORE INSERT ON SeTientDansPropose
FOR EACH ROW
BEGIN
    IF :NEW.Jour < SYSDATE + 1 THEN
        RAISE_APPLICATION_ERROR(-20011, 'Les cours doivent être créés pour au moins le jour suivant.');
    END IF;
END;

