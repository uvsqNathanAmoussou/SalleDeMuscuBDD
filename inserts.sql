INSERT INTO SalleMusculation (ID_Salle, Nom, Adresse, DateOuverture, SurfaceTotale, HoraireOuverture, HoraireFermeture)
VALUES
(1, 'Fitness Paradise', '123 Avenue de la Forme, Paris', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 600, TO_DATE('2022-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-01 22:00:00', 'YYYY-MM-DD HH24:MI:SS')),
(2, 'Iron Strong Gym', '456 Rue de la Musculation, Lyon', TO_DATE('2021-05-15', 'YYYY-MM-DD'), 800, TO_DATE('2021-05-15 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-05-15 21:30:00', 'YYYY-MM-DD HH24:MI:SS')),
(3, 'FitZone Center', '789 Boulevard Fitness, Marseille', TO_DATE('2020-09-10', 'YYYY-MM-DD'), 500, TO_DATE('2020-09-10 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-09-10 23:00:00', 'YYYY-MM-DD HH24:MI:SS')),
(4, 'PowerLift Club', '987 Rue de la Force, Bordeaux', TO_DATE('2021-03-20', 'YYYY-MM-DD'), 700, TO_DATE('2021-03-20 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-03-20 20:00:00', 'YYYY-MM-DD HH24:MI:SS')),
(5, 'FlexFit Studio', '321 Rue de Flexibilité, Nice', TO_DATE('2023-02-05', 'YYYY-MM-DD'), 450, TO_DATE('2023-02-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-05 19:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Membre (ID_Membre, ID_Abonnement, Nom, Prénom, DateNaissance, Adresse, DateInscription, DateResiliation)
VALUES
(1, 1, 'Dupont', 'Alice', TO_DATE('1990-05-15', 'YYYY-MM-DD'), '123 Rue de la Forme, Paris', TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL),
(2, 2, 'Martin', 'Bob', TO_DATE('1985-08-22', 'YYYY-MM-DD'), '456 Avenue Musculaire, Lyon', TO_DATE('2021-06-10', 'YYYY-MM-DD'), TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(3, 3, 'Lefevre', 'Claire', TO_DATE('1993-03-08', 'YYYY-MM-DD'), '789 Boulevard Fitness, Marseille', TO_DATE('2020-11-20', 'YYYY-MM-DD'), NULL),
(4, 4, 'Beaulieu', 'David', TO_DATE('1988-12-03', 'YYYY-MM-DD'), '987 Rue Force, Bordeaux', TO_DATE('2021-04-05', 'YYYY-MM-DD'), NULL),
(5, 5, 'Roux', 'Sophie', TO_DATE('1995-07-19', 'YYYY-MM-DD'), '321 Rue Flexibilité, Nice', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD')),
(6, 6, 'Girard', 'Thomas', TO_DATE('1992-09-18', 'YYYY-MM-DD'), '456 Rue Musculaire, Lyon', TO_DATE('2022-02-15', 'YYYY-MM-DD'), NULL),
(7, 7, 'Lemoine', 'Laura', TO_DATE('1991-07-25', 'YYYY-MM-DD'), '789 Boulevard Fitness, Marseille', TO_DATE('2020-12-08', 'YYYY-MM-DD'), NULL),
(8, 8, 'Morel', 'Alexandre', TO_DATE('1987-04-30', 'YYYY-MM-DD'), '987 Rue Force, Bordeaux', TO_DATE('2021-05-20', 'YYYY-MM-DD'), TO_DATE('2022-10-15', 'YYYY-MM-DD')),
(9, 9, 'Lefevre', 'Julie', TO_DATE('1996-01-12', 'YYYY-MM-DD'), '321 Rue Flexibilité, Nice', TO_DATE('2023-03-15', 'YYYY-MM-DD'), NULL),
(10, 10, 'Roy', 'Luc', TO_DATE('1985-11-05', 'YYYY-MM-DD'), '234 Avenue Entraînement, Toulouse', TO_DATE('2022-07-01', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(11, 11, 'Boucher', 'Marie', TO_DATE('1993-06-28', 'YYYY-MM-DD'), '876 Rue Renforcement, Lille', TO_DATE('2020-09-22', 'YYYY-MM-DD'), NULL),
(12, 12, 'Gauthier', 'Nicolas', TO_DATE('1988-03-14', 'YYYY-MM-DD'), '567 Avenue Forme, Strasbourg', TO_DATE('2021-11-10', 'YYYY-MM-DD'), NULL),
(13, 13, 'Leroux', 'Sophie', TO_DATE('1990-08-09', 'YYYY-MM-DD'), '123 Rue Gym, Nantes', TO_DATE('2022-03-10', 'YYYY-MM-DD'), TO_DATE('2023-05-01', 'YYYY-MM-DD')),
(14, 14, 'Coulombe', 'Pierre', TO_DATE('1986-12-17', 'YYYY-MM-DD'), '345 Boulevard Renforcement, Montpellier', TO_DATE('2022-05-05', 'YYYY-MM-DD'), NULL),
(15, 15, 'Poirier', 'Céline', TO_DATE('1995-04-02', 'YYYY-MM-DD'), '678 Rue Fitness, Rennes', TO_DATE('2023-01-15', 'YYYY-MM-DD'), NULL),
(16, 16, 'Fournier', 'Mathieu', TO_DATE('1989-10-11', 'YYYY-MM-DD'), '987 Avenue Sport, Nice', TO_DATE('2021-08-12', 'YYYY-MM-DD'), TO_DATE('2022-02-28', 'YYYY-MM-DD')),
(17, 17, 'Lavoie', 'Isabelle', TO_DATE('1994-03-25', 'YYYY-MM-DD'), '456 Rue Exercice, Lyon', TO_DATE('2023-02-10', 'YYYY-MM-DD'), NULL),
(18, 18, 'Dubois', 'Antoine', TO_DATE('1987-06-20', 'YYYY-MM-DD'), '789 Boulevard Sport, Marseille', TO_DATE('2020-10-05', 'YYYY-MM-DD'), NULL),
(19, 19, 'Renaud', 'Camille', TO_DATE('1991-02-08', 'YYYY-MM-DD'), '543 Rue Musculation, Bordeaux', TO_DATE('2021-07-15', 'YYYY-MM-DD'), NULL),
(20, 20, 'Martin', 'Philippe', TO_DATE('1996-09-14', 'YYYY-MM-DD'), '876 Avenue Renforcement, Paris', TO_DATE('2022-04-20', 'YYYY-MM-DD'), NULL);
(21, 21, 'Gagnon', 'Émilie', TO_DATE('1993-11-02', 'YYYY-MM-DD'), '345 Rue Entraînement, Toulouse', TO_DATE('2022-11-01', 'YYYY-MM-DD'), NULL),
(22, 22, 'Lemieux', 'Gabriel', TO_DATE('1986-04-18', 'YYYY-MM-DD'), '678 Avenue Fitness, Nice', TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2023-10-31', 'YYYY-MM-DD')),
(23, 23, 'Bergeron', 'Julien', TO_DATE('1990-07-22', 'YYYY-MM-DD'), '123 Rue Renforcement, Lyon', TO_DATE('2022-02-28', 'YYYY-MM-DD'), NULL),
(24, 24, 'Morin', 'Mélanie', TO_DATE('1989-01-15', 'YYYY-MM-DD'), '456 Avenue Musculaire, Bordeaux', TO_DATE('2022-08-15', 'YYYY-MM-DD'), NULL),
(25, 25, 'Perron', 'Vincent', TO_DATE('1996-06-08', 'YYYY-MM-DD'), '789 Boulevard Forme, Marseille', TO_DATE('2021-05-05', 'YYYY-MM-DD'), TO_DATE('2022-04-30', 'YYYY-MM-DD')),
(26, 26, 'Caron', 'Stéphanie', TO_DATE('1992-03-20', 'YYYY-MM-DD'), '987 Rue Sport, Lille', TO_DATE('2022-10-10', 'YYYY-MM-DD'), NULL),
(27, 27, 'Dion', 'Marc', TO_DATE('1987-08-12', 'YYYY-MM-DD'), '321 Rue Exercice, Nantes', TO_DATE('2020-12-15', 'YYYY-MM-DD'), NULL),
(28, 28, 'Gosselin', 'Valérie', TO_DATE('1991-05-28', 'YYYY-MM-DD'), '543 Avenue Musculation, Rennes', TO_DATE('2023-02-01', 'YYYY-MM-DD'), NULL),
(29, 29, 'Simard', 'Étienne', TO_DATE('1988-10-03', 'YYYY-MM-DD'), '876 Boulevard Fitness, Strasbourg', TO_DATE('2022-04-10', 'YYYY-MM-DD'), NULL),
(30, 30, 'Larose', 'Nathalie', TO_DATE('1994-09-17', 'YYYY-MM-DD'), '234 Rue Sport, Montpellier', TO_DATE('2021-09-22', 'YYYY-MM-DD'), TO_DATE('2023-03-31', 'YYYY-MM-DD'));

INSERT INTO MoyenPaiement (ID_Paiement, Type_MoyenPaiement, Détails)
VALUES
(1, 'Carte Bancaire', 'Card Type: Visa, Card Number: 1234-5678-9012-3456, Expiry Date: 05/24'),
(2, 'Virement', 'Account Holder: John Doe, IBAN: FR76 3000 1234 5678 9012 3456 789, BIC: BNPAFRPPXXX'),
(3, 'Paypal', 'Account Email: john.doe@example.com'),
(4, 'Chèque', 'Payable to: Fitness Center, Address: 123 Gym Street, City: Fitnessville'),
(5, 'Carte Bancaire', 'Card Type: MasterCard, Card Number: 9876-5432-1098-7654, Expiry Date: 09/23'),
(6, 'Virement', 'Account Holder: Jane Smith, IBAN: FR76 3000 5678 9012 3456 7891 234, BIC: BNPAFRPPYYY'),
(7, 'Paypal', 'Account Email: jane.smith@example.com'),
(8, 'Chèque', 'Payable to: Fitness Center, Address: 456 Workout Avenue, City: Fitcity'),
(9, 'Carte Bancaire', 'Card Type: American Express, Card Number: 5678-9012-3456-7890, Expiry Date: 12/25'),
(10, 'Virement', 'Account Holder: Robert Johnson, IBAN: FR76 3000 9012 3456 7891 2345 678, BIC: BNPAFRPPZZZ'),
(11, 'Paypal', 'Account Email: robert.johnson@example.com'),
(12, 'Chèque', 'Payable to: Fitness Center, Address: 789 Exercise Street, City: Fitland'),
(13, 'Carte Bancaire', 'Card Type: Discover, Card Number: 9012-3456-7890-1234, Expiry Date: 03/22'),
(14, 'Virement', 'Account Holder: Sarah Davis, IBAN: FR76 3000 3456 7891 2345 6789 012, BIC: BNPAFRPPAAA'),
(15, 'Paypal', 'Account Email: sarah.davis@example.com'),
(16, 'Chèque', 'Payable to: Fitness Center, Address: 234 Strength Avenue, City: Fitville'),
(17, 'Carte Bancaire', 'Card Type: Diners Club, Card Number: 3456-7890-1234-5678, Expiry Date: 06/23'),
(18, 'Virement', 'Account Holder: Michael White, IBAN: FR76 3000 7891 2345 6789 0123 456, BIC: BNPAFRPPBBB'),
(19, 'Paypal', 'Account Email: michael.white@example.com'),
(20, 'Chèque', 'Payable to: Fitness Center, Address: 567 Health Street, City: Fitness City');
(21, 'Carte Bancaire', 'Card Type: Visa, Card Number: 5678-1234-9012-3456, Expiry Date: 08/23'),
(22, 'Virement', 'Account Holder: Jessica Miller, IBAN: FR76 3000 2345 6789 0123 4567 890, BIC: BNPAFRPPCCC'),
(23, 'Paypal', 'Account Email: jessica.miller@example.com'),
(24, 'Chèque', 'Payable to: Fitness Center, Address: 789 Fitness Street, City: Bodyville'),
(25, 'Carte Bancaire', 'Card Type: Maestro, Card Number: 7890-1234-5678-9012, Expiry Date: 02/24'),
(26, 'Virement', 'Account Holder: William Taylor, IBAN: FR76 3000 3456 7890 1234 5678 901, BIC: BNPAFRPPDDD'),
(27, 'Paypal', 'Account Email: william.taylor@example.com'),
(28, 'Chèque', 'Payable to: Fitness Center, Address: 123 Health Avenue, City: Wellness City'),
(29, 'Carte Bancaire', 'Card Type: JCB, Card Number: 3456-9012-1234-5678, Expiry Date: 11/22'),
(30, 'Virement', 'Account Holder: Emily Wilson, IBAN: FR76 3000 4567 8901 2345 6789 012, BIC: BNPAFRPPEEE');

INSERT INTO Abonnement (ID_Abonnement, Type_Abonnement, Prix, DateDebut, DateFin)
VALUES
(1, 'À la semaine', 10.00, TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-22', 'YYYY-MM-DD')),
(2, 'Mensuel', 30.00, TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-02-28', 'YYYY-MM-DD')),
(3, 'Annuel', 240.00, TO_DATE('2023-03-10', 'YYYY-MM-DD'), TO_DATE('2024-03-09', 'YYYY-MM-DD')),
(4, 'À la semaine', 10.00, TO_DATE('2023-04-05', 'YYYY-MM-DD'), TO_DATE('2023-04-12', 'YYYY-MM-DD')),
(5, 'Mensuel', 30.00, TO_DATE('2023-05-20', 'YYYY-MM-DD'), TO_DATE('2023-06-19', 'YYYY-MM-DD')),
(6, 'Annuel', 240.00, TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2024-05-31', 'YYYY-MM-DD')),
(7, 'À la semaine', 10.00, TO_DATE('2023-07-08', 'YYYY-MM-DD'), TO_DATE('2023-07-15', 'YYYY-MM-DD')),
(8, 'Mensuel', 30.00, TO_DATE('2023-08-12', 'YYYY-MM-DD'), TO_DATE('2023-09-11', 'YYYY-MM-DD')),
(9, 'Annuel', 240.00, TO_DATE('2023-09-25', 'YYYY-MM-DD'), TO_DATE('2024-09-24', 'YYYY-MM-DD')),
(10, 'À la semaine', 10.00, TO_DATE('2023-10-15', 'YYYY-MM-DD'), TO_DATE('2023-10-22', 'YYYY-MM-DD')),
(11, 'Mensuel', 30.00, TO_DATE('2023-11-05', 'YYYY-MM-DD'), TO_DATE('2023-12-04', 'YYYY-MM-DD')),
(12, 'Annuel', 240.00, TO_DATE('2023-12-18', 'YYYY-MM-DD'), TO_DATE('2024-12-17', 'YYYY-MM-DD')),
(13, 'À la semaine', 10.00, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-17', 'YYYY-MM-DD')),
(14, 'Mensuel', 30.00, TO_DATE('2024-02-15', 'YYYY-MM-DD'), TO_DATE('2024-03-14', 'YYYY-MM-DD')),
(15, 'Annuel', 240.00, TO_DATE('2024-03-28', 'YYYY-MM-DD'), TO_DATE('2025-03-27', 'YYYY-MM-DD')),
(16, 'À la semaine', 10.00, TO_DATE('2024-04-05', 'YYYY-MM-DD'), TO_DATE('2024-04-12', 'YYYY-MM-DD')),
(17, 'Mensuel', 30.00, TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-06-09', 'YYYY-MM-DD')),
(18, 'Annuel', 240.00, TO_DATE('2024-06-20', 'YYYY-MM-DD'), TO_DATE('2025-06-19', 'YYYY-MM-DD')),
(19, 'À la semaine', 10.00, TO_DATE('2024-07-05', 'YYYY-MM-DD'), TO_DATE('2024-07-12', 'YYYY-MM-DD')),
(20, 'Mensuel', 30.00, TO_DATE('2024-08-10', 'YYYY-MM-DD'), TO_DATE('2024-09-09', 'YYYY-MM-DD'));
(21, 'À la semaine', 10.00, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-22', 'YYYY-MM-DD')),
(22, 'Mensuel', 30.00, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-29', 'YYYY-MM-DD')),
(23, 'Annuel', 240.00, TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2025-03-09', 'YYYY-MM-DD')),
(24, 'À la semaine', 10.00, TO_DATE('2024-04-05', 'YYYY-MM-DD'), TO_DATE('2024-04-12', 'YYYY-MM-DD')),
(25, 'Mensuel', 30.00, TO_DATE('2024-05-20', 'YYYY-MM-DD'), TO_DATE('2024-06-19', 'YYYY-MM-DD')),
(26, 'Annuel', 240.00, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2025-05-31', 'YYYY-MM-DD')),
(27, 'À la semaine', 10.00, TO_DATE('2024-07-08', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD')),
(28, 'Mensuel', 30.00, TO_DATE('2024-08-12', 'YYYY-MM-DD'), TO_DATE('2024-09-11', 'YYYY-MM-DD')),
(29, 'Annuel', 240.00, TO_DATE('2024-09-25', 'YYYY-MM-DD'), TO_DATE('2025-09-24', 'YYYY-MM-DD')),
(30, 'À la semaine', 10.00, TO_DATE('2024-10-15', 'YYYY-MM-DD'), TO_DATE('2024-10-22', 'YYYY-MM-DD'));


INSERT INTO Equipement (ID_Equipement, Nom, Type_Equipement, DateAchat, Prix)
VALUES
(1, 'Seated leg press', 'machine', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 700),
(2, 'Decline leg press', 'machine', TO_DATE('2022-02-01', 'YYYY-MM-DD'), 700),
(3, 'Leg extension', 'machine', TO_DATE('2022-03-01', 'YYYY-MM-DD'), 700),
(4, 'Seated leg curl', 'machine', TO_DATE('2022-04-01', 'YYYY-MM-DD'), 700),
(5, 'Lying leg curl', 'machine', TO_DATE('2022-05-01', 'YYYY-MM-DD'), 700),
(6, 'Shoulder press', 'machine', TO_DATE('2022-06-01', 'YYYY-MM-DD'), 700),
(7, 'Converging chest press', 'machine', TO_DATE('2022-07-01', 'YYYY-MM-DD'), 700),
(8, 'Pec deck', 'machine', TO_DATE('2022-08-01', 'YYYY-MM-DD'), 700),
(9, 'Chest press', 'machine', TO_DATE('2022-09-01', 'YYYY-MM-DD'), 700),
(10, 'Lat pulldown', 'machine', TO_DATE('2022-10-01', 'YYYY-MM-DD'), 700),
(11, 'Seated row', 'machine', TO_DATE('2022-11-01', 'YYYY-MM-DD'), 700),
(12, 'Converging seated row', 'machine', TO_DATE('2022-12-01', 'YYYY-MM-DD'), 700),
(13, 'Preacher curl', 'machine', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 700),
(14, 'Seated dips', 'machine', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 700),
(15, 'Long barbell', 'poids libre', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 800),
(16, 'Mid barbell', 'poids libre', TO_DATE('2023-04-01', 'YYYY-MM-DD'), 800),
(17, 'Dumbbell (lot)', 'poids libre', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 800),
(18, 'Weight disk (lot)', 'poids libre', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 800),
(19, 'Adjustable bench', 'banc et cadres', TO_DATE('2023-07-01', 'YYYY-MM-DD'), 700),
(20, 'Smith machine', 'banc et cadres', TO_DATE('2023-08-01', 'YYYY-MM-DD'), 700);

INSERT INTO Cours (ID_Cours, ID_TypeDeCours, ID_Entraineur, Nom, Description)
VALUES
(1, 1, 10, 'Yoga Flow', 'Séance de yoga dynamique pour renforcer et assouplir le corps.'),
(2, 2, 9, 'Pilates Core', 'Cours de Pilates axé sur le renforcement des muscles profonds et la stabilité du tronc.'),
(3, 3, 8, 'CrossFit Challenge', 'Entraînement intensif mêlant différents exercices pour développer la force et l''endurance.'),
(4, 4, 3, 'Booty Blast', 'Séance ciblée sur les muscles des fesses et des jambes pour un renforcement efficace.'),
(5, 5, 1, 'Spinning Adventure', 'Voyage virtuel à travers différents terrains en pédalant sur un vélo stationnaire.'),
(6, 6, 4, 'Kickboxing Cardio', 'Combinaison de mouvements de kickboxing pour améliorer la condition physique.'),
(7, 7, 2, 'Dance Fusion', 'Cours de danse énergique combinant différents styles pour brûler des calories.'),
(8, 8, 5, 'Jumping Jack Joy', 'Entraînement cardio avec des sauts et des mouvements de jumping jack.'),
(9, 9, 7, 'Bodybuilding Basics', 'Introduction aux exercices de musculation pour le renforcement musculaire.'),
(10, 10, 6, 'HIIT Intense', 'Entraînement fractionné de haute intensité pour améliorer la condition physique globale.');

INSERT INTO Entraineur (ID_Entraineur, Nom, Prenom, Specialite, DateEmbauche)
VALUES
(1, 'Colas', 'Stéphanie', 'Spinning', TO_DATE('2023-03-15', 'YYYY-MM-DD')),
(2, 'Perrin', 'Denis', 'Danse Fitness', TO_DATE('2023-08-09', 'YYYY-MM-DD')),
(3, 'Leclercq', 'Xavier', 'Abdo Fessier', TO_DATE('2019-07-16', 'YYYY-MM-DD')),
(4, 'Schneider', 'Hugues', 'Kickboxing', TO_DATE('2018-08-11', 'YYYY-MM-DD')),
(5, 'Charles', 'Frédéric', 'Bodybuilding', TO_DATE('2020-08-31', 'YYYY-MM-DD')),
(6, 'Vincent', 'Christiane', 'Jumping Jack', TO_DATE('2014-10-03', 'YYYY-MM-DD')),
(7, 'Antoine', 'Aimée', 'HIIT', TO_DATE('2014-10-26', 'YYYY-MM-DD')),
(8, 'Barbier', 'Victor', 'CrossFit', TO_DATE('2018-05-26', 'YYYY-MM-DD')),
(9, 'Neveu', 'Capucine', 'Pilates', TO_DATE('2023-06-07', 'YYYY-MM-DD')),
(10, 'Gosselin', 'Valentine', 'Yoga', TO_DATE('2020-11-17', 'YYYY-MM-DD')),

INSERT INTO TypeDeCours (ID_TypeDeCours, Type_TypeDeCours)
VALUES
(1, 'Yoga'),
(2, 'Pilates'),
(3, 'CrossFit'),
(4, 'Abdos Fessier'),
(5, 'Spinning'),
(6, 'Kickboxing'),
(7, 'Danse Fitness'),
(8, 'Jumping Jack'),
(9, 'Bodybuilding'),
(10, 'HIIT');

INSERT INTO EstMembreDe (ID_Salle, ID_Membre)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10),
(1, 11),
(2, 12),
(3, 13),
(4, 14),
(5, 15),
(1, 16),
(2, 17),
(3, 18),
(4, 19),
(5, 20);
(1, 21),
(2, 22),
(3, 23),
(4, 24),
(5, 25),
(1, 26),
(2, 27),
(3, 28),
(4, 29),
(5, 30);


INSERT INTO PossedePaye (ID_Membre, ID_Paiement, ID_Abonnement, Date_PossedePaye)
VALUES
(1, 1, 1, TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(2, 2, 2, TO_DATE('2023-02-01', 'YYYY-MM-DD')),
(3, 3, 3, TO_DATE('2023-03-10', 'YYYY-MM-DD')),
(4, 4, 4, TO_DATE('2023-04-05', 'YYYY-MM-DD')),
(5, 5, 5, TO_DATE('2023-05-20', 'YYYY-MM-DD')),
(6, 6, 6, TO_DATE('2023-06-01', 'YYYY-MM-DD')),
(7, 7, 7, TO_DATE('2023-07-08', 'YYYY-MM-DD')),
(8, 8, 8, TO_DATE('2023-08-12', 'YYYY-MM-DD')),
(9, 9, 9, TO_DATE('2023-09-25', 'YYYY-MM-DD')),
(10, 10, 10, TO_DATE('2023-10-03', 'YYYY-MM-DD')),
(11, 11, 11, TO_DATE('2023-11-18', 'YYYY-MM-DD')),
(12, 12, 12, TO_DATE('2024-01-07', 'YYYY-MM-DD')),
(13, 13, 13, TO_DATE('2024-02-14', 'YYYY-MM-DD')),
(14, 14, 14, TO_DATE('2024-03-02', 'YYYY-MM-DD')),
(15, 15, 15, TO_DATE('2024-04-15', 'YYYY-MM-DD')),
(16, 16, 16, TO_DATE('2024-05-22', 'YYYY-MM-DD')),
(17, 17, 17, TO_DATE('2024-06-10', 'YYYY-MM-DD')),
(18, 18, 18, TO_DATE('2024-07-01', 'YYYY-MM-DD')),
(19, 19, 19, TO_DATE('2024-08-05', 'YYYY-MM-DD')),
(20, 20, 20, TO_DATE('2024-09-20', 'YYYY-MM-DD'));
(21, 21, 21, TO_DATE('2024-10-15', 'YYYY-MM-DD')),
(22, 22, 22, TO_DATE('2024-11-01', 'YYYY-MM-DD')),
(23, 23, 23, TO_DATE('2024-12-10', 'YYYY-MM-DD')),
(24, 24, 24, TO_DATE('2025-01-05', 'YYYY-MM-DD')),
(25, 25, 25, TO_DATE('2025-02-20', 'YYYY-MM-DD')),
(26, 26, 26, TO_DATE('2025-03-01', 'YYYY-MM-DD')),
(27, 27, 27, TO_DATE('2025-04-08', 'YYYY-MM-DD')),
(28, 28, 28, TO_DATE('2025-05-12', 'YYYY-MM-DD')),
(29, 29, 29, TO_DATE('2025-06-25', 'YYYY-MM-DD')),
(30, 30, 30, TO_DATE('2025-07-03', 'YYYY-MM-DD'));

-- Équipement pour Salle 1
INSERT INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
VALUES
(1, 1, 3),
(1, 2, 2),
(1, 3, 2),
(1, 4, 3),
(1, 5, 2),
(1, 6, 2),
(1, 7, 3),
(1, 8, 2),
(1, 9, 2),
(1, 10, 3),
(1, 11, 2),
(1, 12, 2),
(1, 13, 3),
(1, 14, 2),
(1, 15, 4),
(1, 16, 4),
(1, 17, 4),
(1, 18, 4),
(1, 19, 3),
(1, 20, 3);

-- Équipement pour Salle 2
INSERT INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
VALUES
(2, 1, 2),
(2, 2, 3),
(2, 3, 2),
(2, 4, 2),
(2, 5, 3),
(2, 6, 2),
(2, 7, 2),
(2, 8, 3),
(2, 9, 3),
(2, 10, 2),
(2, 11, 2),
(2, 12, 3),
(2, 13, 2),
(2, 14, 2),
(2, 15, 4),
(2, 16, 4),
(2, 17, 4),
(2, 18, 4),
(2, 19, 3),
(2, 20, 3);

-- Équipement pour Salle 3
INSERT INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
VALUES
(3, 1, 2),
(3, 2, 2),
(3, 3, 3),
(3, 4, 2),
(3, 5, 3),
(3, 6, 2),
(3, 7, 2),
(3, 8, 2),
(3, 9, 3),
(3, 10, 3),
(3, 11, 2),
(3, 12, 3),
(3, 13, 2),
(3, 14, 3),
(3, 15, 4),
(3, 16, 4),
(3, 17, 4),
(3, 18, 4),
(3, 19, 3),
(3, 20, 2);

-- Équipement pour Salle 4
INSERT INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
VALUES
(4, 1, 3),
(4, 2, 2),
(4, 3, 3),
(4, 4, 2),
(4, 5, 2),
(4, 6, 3),
(4, 7, 2),
(4, 8, 3),
(4, 9, 3),
(4, 10, 2),
(4, 11, 2),
(4, 12, 2),
(4, 13, 3),
(4, 14, 2),
(4, 15, 4),
(4, 16, 4),
(4, 17, 4),
(4, 18, 4),
(4, 19, 3),
(4, 20, 2);

-- Équipement pour Salle 5
INSERT INTO EstEquipeDe (ID_Salle, ID_Equipement, Quantite)
VALUES
(5, 1, 2),
(5, 2, 3),
(5, 3, 2),
(5, 4, 2),
(5, 5, 3),
(5, 6, 2),
(5, 7, 2),
(5, 8, 3),
(5, 9, 3),
(5, 10, 2),
(5, 11, 3),
(5, 12, 2),
(5, 13, 2),
(5, 14, 3),
(5, 15, 3),
(5, 16, 3),
(5, 17, 4),
(5, 18, 4),
(5, 19, 3),
(5, 20, 3);

INSERT INTO SeTientDansPropose (ID_Salle, ID_Cours, HoraireDebut, HoraireFin, Jour)
VALUES
(1, 1, TO_TIMESTAMP('2023-01-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-15 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(2, 2, TO_TIMESTAMP('2023-02-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-02-01 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-01', 'YYYY-MM-DD')),
(3, 3, TO_TIMESTAMP('2023-03-10 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-03-10 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-10', 'YYYY-MM-DD')),
(4, 4, TO_TIMESTAMP('2023-04-05 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-04-05 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-05', 'YYYY-MM-DD')),
(5, 5, TO_TIMESTAMP('2023-05-20 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-05-20 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-05-20', 'YYYY-MM-DD')),
(1, 6, TO_TIMESTAMP('2023-06-01 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-06-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-01', 'YYYY-MM-DD')),
(2, 7, TO_TIMESTAMP('2023-07-08 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-08 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-08', 'YYYY-MM-DD')),
(3, 8, TO_TIMESTAMP('2023-08-12 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-08-12 21:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-12', 'YYYY-MM-DD')),
(4, 9, TO_TIMESTAMP('2023-09-25 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-09-25 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-25', 'YYYY-MM-DD')),
(5, 10, TO_TIMESTAMP('2023-10-03 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-10-03 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-10-03', 'YYYY-MM-DD'));

INSERT INTO Participe (ID_Membre, ID_Cours, Date_Participe)
VALUES
(1, 1, TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(2, 2, TO_DATE('2023-02-01', 'YYYY-MM-DD')),
(3, 3, TO_DATE('2023-03-10', 'YYYY-MM-DD')),
(4, 4, TO_DATE('2023-04-05', 'YYYY-MM-DD')),
(5, 5, TO_DATE('2023-05-20', 'YYYY-MM-DD')),
(6, 6, TO_DATE('2023-06-01', 'YYYY-MM-DD')),
(7, 7, TO_DATE('2023-07-08', 'YYYY-MM-DD')),
(8, 8, TO_DATE('2023-08-12', 'YYYY-MM-DD')),
(9, 9, TO_DATE('2023-09-25', 'YYYY-MM-DD')),
(10, 10, TO_DATE('2023-10-03', 'YYYY-MM-DD'));