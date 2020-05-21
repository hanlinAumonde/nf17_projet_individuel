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
* __Bâtiment__ : nom(unique) , superficie , addrGPS , nbEtage.Un bâtiment compose plusieurs étages , chacun possède un plan de lui-même.En même temps , un bâtiment compose plusieurs salles.
* __Salle__ : nom(unique) , superficie , nbMaxHum , photos , planSalle , airComprime , gazSpec(Butane, Méthane, O2, Azote,...) , ElecTriphase , nbPriseElec , nbPriseResaux. Dans une salle , on peut trouver les objets suivant :
  * __Machine__ : codeMach(unique) , modele , description , puissanceElec , BesoinTriphase , BesoinResaux , NCM(numéro contrat maintenance) , EM(entreprise de maintenance) , BesoinGaz(Butane, Méthane, O2, Azote,...) , taille.
  * __PosteTele__ : numInt(unique) , numExt , type , modeleTele , marque , host.
  * __MoyenIT__ : nom(unique) , type(PC,portable,serveur) , OS , addrMAC , responsable , projetCharge , lienMachine.
* C'est très important de gérer les informations des employés suivant:
  * __Employe__ : numBadge(unique) , nom , prenom , e-mail , statut(CDI,CDD,stagiaire) , emplacement. Les employés peuvent être trouvés dans les salles.
* __Organisation__ : sigle(unique) , nom. Une organisation peut être:
  * __Laboratoire__ : logo.
  * __Departement__ : domaine.
  * __Projet__ : date_start , date_end , description.Un laboratoire/departement peut travailler sur plusieurs projets.
* Pour gérer les relation hiérarchiques entre les employés, on crée les classes d'association entre le classe employe et les organisations:
  * __RHlabo__
  * __RHdepartement__
  * __RHprojet__

