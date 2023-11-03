**Entités et leurs attributs :**

```plaintext
1. SalleMusculation(ID_Salle, Nom, Adresse, DateOuverture, SurfaceTotale, HoraireOuverture, HoraireFermeture)
2. Membre(ID_Membre, ID_Abonnement, Nom, Prenom, DateNaissance, Adresse, DateInscription, DateResiliation)
3. Abonnement(ID_Abonnement, Type, Prix, DateDebut, DateFin)
4. Equipement(ID_Equipement, Nom, Type, DateAchat, Prix)
5. Cours(ID_Cours, ID_Salle, Nom, Type, Date, HoraireDebut, HoraireFin)
6. Entraineur(ID_Entraineur, Nom, Prénom, Spécialité, DateEmbauche)
```

**Relations :**

```plaintext
1. EstMembreDe(Membre:ID_Membre N -- N SalleMusculation:ID_Salle)
2. Possède(Membre:ID_Membre 1 -- N Abonnement:ID_Abonnement)
3. EstEquipéDe(SalleMusculation:ID_Salle N -- N Equipement:ID_Equipement)
4. Donne(Entraineur:ID_Entraineur 1 -- N Cours:ID_Cours)
5. Participe(Membre:ID_Membre N -- N Cours:ID_Cours)
```

**Contraintes d'intégrité :**

```plaintext
1. SalleMusculation :
   - ID_Salle : NOT NULL, PRIMARY KEY
   - Nom : NOT NULL
   - Adresse : NOT NULL UNIQUE
   - DateOuverture : NOT NULL CHECK (DateOuverture <= Date actuelle)
   - SurfaceTotale : NOT NULL CHECK (SurfaceTotale > 0)
   - HoraireOuverture: NOT NULL CHECK (HoraireOuverture < HoraireFermeture)
   - HoraireFermeture: NOT NULL CHECK (HoraireFermeture > HoraireOuverture)

2. Membre :
   - ID_Membre : NOT NULL PRIMARY KEY
   - ID_Abonnement: NOT NULL FOREIGN KEY
   - Nom : NOT NULL
   - Prénom : NOT NULL
   - DateNaissance : NOT NULL CHECK (DateNaissance <= Date actuelle)
   - Adresse : NOT NULL
   - DateInscription : NOT NULL CHECK (DateInscription = DateDebut)
   - DateResiliation: DEFAULT NULL CHECK (DateResiliation = DateFin)

3. Abonnement :
   - ID_Abonnement : NOT NULL PRIMARY KEY
   - Type : NOT NULL
   - Prix : NOT NULL CHECK (Prix >= 0)
   - DateDebut : NOT NULL CHECK (DateDebut = DateInscription)
   - DateFin : DEFAULT NULL CHECK (DateFin = DateResiliation)

4. Equipement :
   - ID_Equipement : NOT NULL PRIMARY KEY
   - Nom : NOT NULL
   - Type : NOT NULL
   - DateAchat : NOT NULL CHECK (DateAchat <= Date actuelle)
   - Prix : NOT NULL CHECK (Prix >= 0)

5. Cours :
   - ID_Cours : NOT NULL PRIMARY KEY
   - ID_Salle : NOT NULL FOREIGN KEY
   - Nom : NOT NULL
   - Type : NOT NULL
   - Date : NOT NULL CHECK (Date >= Date actuelle)
   - HoraireDebut: NOT NULL CHECK (HoraireDebut < HoraireFin)
   - HoraireFin: NOT NULL CHECK (HoraireFin > HoraireDebut)

6. Entraineur :
   - ID_Entraineur : NOT NULL PRIMARY KEY
   - Nom : NOT NULL
   - Prénom : NOT NULL
   - Spécialité : NOT NULL
   - DateEmbauche : NOT NULL CHECK (DateEmbauche <= Date actuelle)
```
