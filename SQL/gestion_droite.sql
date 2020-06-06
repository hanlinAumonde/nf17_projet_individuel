CREATE USER Admin;

CREATE USER RH;

CREATE USER Directeur;

CREATE USER Chef;

GRANT ALL PRIVILEGES ON Batiment,Etage,Salle,GazSpecifique,PhotoSalle,Employe,PosteTele,MoyenIT,AddressMoyenIT,Num_Entreprise_Mach,Machine,Organisation,Laboratoire,Departement,Projet,RHprojet,RessouceProjet_IT TO Admin;

GRANT INSERT,SELECT,UPDATE ON Laboratoire,Departement,RHprojet,Employe TO RH;

GRANT INSERT,SELECT,UPDATE ON Employe,RHprojet TO Directeur;

GRANT INSERT,SELECT,UPDATE ON RHprojet,RessouceProjet_IT TO Chef;