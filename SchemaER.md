### Entités et leurs attributs :

1. **SalleMusculation**
   - ID_Salle (Primary Key)
   - Nom
   - Adresse
   - DateOuverture
   - SurfaceTotale

2. **Membre**
   - ID_Membre (Primary Key)
   - Nom
   - Prenom
   - DateNaissance
   - Adresse
   - DateInscription

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
   - Duree

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

2. **Membre** :
   - ID_Membre : NOT NULL, PRIMARY KEY
   - Nom : NOT NULL
   - Prénom : NOT NULL
   - DateNaissance : NOT NULL, CHECK (DateNaissance <= Date actuelle)
   - Adresse : NOT NULL
   - DateInscription : NOT NULL, CHECK (DateInscription <= Date actuelle)

3. **Abonnement** :
   - ID_Abonnement : NOT NULL, PRIMARY KEY
   - Type : NOT NULL
   - Prix : NOT NULL, CHECK (Prix >= 0)
   - DateDebut : NOT NULL, CHECK (DateDebut <= Date actuelle)
   - DateFin : NOT NULL, CHECK (DateFin >= DateDebut)

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
   - Durée : NOT NULL, CHECK (Durée > 0)

6. **Entraineur** :
   - ID_Entraineur : NOT NULL, PRIMARY KEY
   - Nom : NOT NULL
   - Prénom : NOT NULL
   - Spécialité : NOT NULL
   - DateEmbauche : NOT NULL, CHECK (DateEmbauche <= Date actuelle)
