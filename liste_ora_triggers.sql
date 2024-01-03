-- Liste des triggers pour la table SalleMusculation
SELECT
    SalleMusculation,
    CheckDateOuverture,
    BEFORE EACH ROW ,
    INSERT OR UPDATE,
FROM
    all_triggers
WHERE
    owner = 'GestionnaireDeSalle';

-- Liste des triggers pour la table Membre
SELECT
    Membre,
    CheckDateNaissance,
    BEFORE EACH ROW ,
    INSERT OR UPDATE,
FROM
    all_triggers
WHERE
    owner = 'GestionnaireDeSalle';

SELECT
    Membre,
    CheckDateInscription,
    AFTER EACH ROW ,
    INSERT OR UPDATE,
FROM
    all_triggers
WHERE
    owner = 'GestionnaireDeSalle';

SELECT
    Membre,
    CheckDateResiliation,
    AFTER EACH ROW ,
    INSERT OR UPDATE,
FROM
    all_triggers
WHERE
    owner = 'GestionnaireDeSalle';

-- Liste des triggers pour la table Equipement
SELECT
    Equipement,
    CheckEquipementDateAchat,
    BEFORE EACH ROW ,
    INSERT OR UPDATE,
FROM
    all_triggers
WHERE
    owner = 'GestionnaireDeSalle';

-- Liste des triggers pour la table Entraineur
SELECT
    Entraineur,
    CheckEntraineurDateEmbauche,
    BEFORE EACH ROW ,
    INSERT OR UPDATE,
FROM
    all_triggers
WHERE
    owner = 'GestionnaireDeSalle';

-- Liste des triggers pour la table SeTientDansPropose
SELECT
    SeTientDansPropose,
    CheckCoursHoraireDebut,
    AFTER EACH ROW ,
    INSERT OR UPDATE,
FROM
    all_triggers
WHERE
    owner = 'GestionnaireDeSalle';

SELECT
    SeTientDansPropose,
    CheckCoursHoraireFin,
    AFTER EACH ROW ,
    INSERT OR UPDATE,
FROM
    all_triggers
WHERE
    owner = 'GestionnaireDeSalle';

SELECT
    SeTientDansPropose,
    CheckCoursJour,
    BEFORE EACH ROW ,
    INSERT OR UPDATE,
FROM
    all_triggers
WHERE
    owner = 'GestionnaireDeSalle';

