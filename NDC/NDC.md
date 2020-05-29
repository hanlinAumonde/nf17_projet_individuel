# Note de clarification : Outil de gestion du patrimoine

## Objectif
L'objectif de ce projet est de créé une base de données pour gérer la totalité du patrimoine humain, immobilier et industrie de notre entreprise avec notre système intelligent et autonome.

## Acteur du projet
__Maître d'ouvrage__ : Alessandro Victorino

__Maître d'oeuvre__ : Hanlin WU

## Livrables
 - README
 - Note de clarification
 - Modèle UML (MCD)
 - Modèle logique (MLD relationnel)
 - Code SQL : données , tables et vues

## Objets gérés et ses propriétés
* __Bâtiment__ : nom(unique) , superficieB , addrGPS , nbEtage.Un bâtiment compose plusieurs __etage__ s , chacun possède un plan de lui-même.En même temps , un bâtiment compose plusieurs salles.
* __Salle__ : nom(unique) , superficieS , capaciteHumMax , photos , planSalle , airComprime , gazSpec(Butane, Méthane, O2, Azote,...) , ElecTriphase , nbPriseElec , nbPriseResaux. Dans une salle , on peut trouver les objets suivant :
  * __Machine__ : codeMach(unique) , modele , description , puissanceElec , BesoinTriphase , BesoinResaux , NCM(numéro contrat maintenance) , EM(entreprise de maintenance) , besoinGaz(Butane, Méthane, O2, Azote,...) , taille.
  * __PosteTele__ : numInt(unique) , numExt , type , modeleTele , marque , host.
  * __MoyenIT__ : nom(unique) , type(PC,portable,serveur) , OS , addrMAC , responsable , projetCharge , lienMachine.
* C'est très important de gérer les informations des employés suivant:
  * __Employe__ : numBadge(unique) , nom , prenom , e-mail , statut(CDI,CDD,stagiaire) , emplacement. Les employés peuvent être trouvés dans les salles.
* __Organisation__ : nom. Une organisation peut être:
  * __Laboratoire__ : sigleL(unique) , logo , thematique.
  * __Departement__ : sigleD(unique) , domaine.
  * __Projet__ : sigleP(unique) , date_start , date_end , description.Un laboratoire/departement peut travailler sur plusieurs projets.


Rq :
* Chaque étage possède aussi son numéro.
* Dans la classe Salle, gazSpec est l'attribut multivalué.
* Pour identifier les différents machines, on ajout une clé codeMach qui est unique pour chaque machine,ex: 'Imp1-1'.
* On fait le gestion des images au niveaux application

## Choix des associations :
* Un laboratoire / département possede plusieurs projets
* Pour gérer les relation hiérarchiques entre les employés, on crée les classes d'association entre la classe employe et les organisations:
  * __RHlabo__
  * __RHdepartement__
  * __RHprojet__
* Plusieurs employees , machines , moyens informatiques , postes telephoniques peuvent se trouver dans un salle
* Un projet peut utiliser plusieurs moyens informatiques
* Un employé peut posséder un poste téléphonique ou non
* Un moyen informatique peut être responsable par un employé
* Un moyen informatique peut être lié a une machine

## Contraintes entre les objets et les propriétés :
* Chaque salle est situé dans un seul étage
* Le téléphone peut ne pas avoir de propriétaire
* Chaque projet appartient à un seul laboratoire / département
* L'acteur du projet ne peut être sélectionné que dans le laboratoire / département correspondant au projet
* Une organisation est soit un laboratoire , soit un département ,soit un projet
* Un employé ne peut être membre/directeur que d'un seul laboratoire à la fois
* Un employé ne peut être membre/directeur que d'un seul département à la fois
* Le nombre d'employés dans la salle ne peut pas dépasser la capacité maximale de la salle
* Les employés n'ont pas le droit d'attribuer des patrimoines
* Seul les directeurs ont le droit de changer les membres du laboratoire/département, ainsi que de sélectionner les acteurs du projet
* Un chef d'un projet a le droit de définir le role des acteurs

## Vues pour consulter des données

## Liste des fonctions que les utilisateurs pourront effectués
 * Administrateur système :
      - Gestion de tous les données
 * Directeur de laboratoire/departement :
      - Gestion des membres de laboratoire/departement
      - Gestion des choix du employé sur les projets
 * Chef d'un projet:
      - Gestion des roles des acteurs
 * Employé :
      - Consulter les patrimoines de notre entreprise
      - Consulter les relations hiérarchiques
