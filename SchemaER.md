### Entités et leurs attributs :

1. **SalleMusculation**
   - ID_Salle (Primary Key)
   - Nom
   - Adresse
   - DateOuverture
   - SurfaceTotale
   - HoraireOuverture
   - HoraireFermeture

2. **Membre**
   - ID_Membre (Primary Key)
   - ID_Abonnement (Foreign Key)
   - Nom
   - Prenom
   - DateNaissance
   - Adresse
   - DateInscription
   - DateResiliation

3. **Abonnement**
   - ID_Abonnement (Primary Key)
   - Type (par exemple : mensuel, annuel, etc.)
   - Prix
   - DateDebut
   - DateFin

4. **Equipement**
   - ID_Equipement (Primary Key)
   - Nom
   - Type (par exemple : cardio, poids, etc.)
   - DateAchat
   - Prix

5. **Cours**
   - ID_Cours (Primary Key)
   - Nom
   - Type (par exemple : yoga, spinning, etc.)
   - Date
   - HoraireDebut
   - HoraireFin

6. **Entraineur**
   - ID_Entraineur (Primary Key)
   - Nom
   - Prénom
   - Spécialité
   - DateEmbauche

### Relations :

1. **EstMembreDe** : entre **Membre** et **SalleMusculation**
   - ID_Membre (Foreign Key)
   - ID_Salle (Foreign Key)

2. **Possède** : entre **Membre** et **Abonnement**
   - ID_Membre (Foreign Key)
   - ID_Abonnement (Foreign Key)

3. **EstEquipéDe** : entre **SalleMusculation** et **Equipement**
   - ID_Salle (Foreign Key)
   - ID_Equipement (Foreign Key)

4. **Donne** : entre **Entraineur** et **Cours**
   - ID_Entraineur (Foreign Key)
   - ID_Cours (Foreign Key)

5. **Participe** : entre **Membre** et **Cours**
   - ID_Membre (Foreign Key)
   - ID_Cours (Foreign Key)

### Contraintes d'intégrité :

1. **SalleMusculation** :
   - ID_Salle : NOT NULL, PRIMARY KEY
   - Nom : NOT NULL
   - Adresse : NOT NULL, UNIQUE
   - DateOuverture : NOT NULL, CHECK (DateOuverture <= Date actuelle)
   - SurfaceTotale : NOT NULL, CHECK (SurfaceTotale > 0)
   - HoraireOuverture:  NOT NULL, CHECK (HoraireOuverture < HoraireFermeture)
   - HoraireFermeture: NOT NULL, CHECK (HoraireFermeture > HoraireOuverture)

2. **Membre** :
   - ID_Membre : NOT NULL, PRIMARY KEY
   - ID_Abonnement: NOT NULL, FOREIGN KEY
   - Nom : NOT NULL
   - Prénom : NOT NULL
   - DateNaissance : NOT NULL, CHECK (DateNaissance <= Date actuelle)
   - Adresse : NOT NULL
   - DateInscription : NOT NULL, CHECK (DateInscription = DateDebut)
   - DateResiliation: DEFAULT NULL, CHECK (DateResiliation = DateFin)

3. **Abonnement** :
   - ID_Abonnement : NOT NULL, PRIMARY KEY
   - Type : NOT NULL
   - Prix : NOT NULL, CHECK (Prix >= 0)
   - DateDebut : NOT NULL, CHECK (DateDebut = DateInscription)
   - DateFin : DEFAULT NULL, CHECK (DateFin = DateResiliation)

4. **Equipement** :
   - ID_Equipement : NOT NULL, PRIMARY KEY
   - Nom : NOT NULL
   - Type : NOT NULL
   - DateAchat : NOT NULL, CHECK (DateAchat <= Date actuelle)
   - Prix : NOT NULL, CHECK (Prix >= 0)

5. **Cours** :
   - ID_Cours : NOT NULL, PRIMARY KEY
   - Nom : NOT NULL
   - Type : NOT NULL
   - Date : NOT NULL, CHECK (Date >= Date actuelle)
   - HoraireDebut: NOT NULL, CHECK (HoraireDebut < HoraireFin)
   - HoraireFin: NOT NULL, CHECK (HoraireFin > HoraireDebut)

6. **Entraineur** :
   - ID_Entraineur : NOT NULL, PRIMARY KEY
   - Nom : NOT NULL
   - Prénom : NOT NULL
   - Spécialité : NOT NULL
   - DateEmbauche : NOT NULL, CHECK (DateEmbauche <= Date actuelle)
