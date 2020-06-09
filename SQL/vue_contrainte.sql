-- Projection(Batiment,nomB) = Projection(Etage,nomBat) 
-- Projection(Etage,numEtage) = Projection(Salle,numE)
-- Projection(Salle,Bati) = Projection(Batiment,nomB)
-- Projection(Salle,Bati) = Projection(Batiment,nomB)
-- Projection(PhotoSalle,nom_salle) = Projection(Salle,nomS)
-- Projection(GazSpecifique,nom_Salle) = Projection(Salle,nomS)
-- Projection(Salle,nomS) = Proection(Machine,salleMach)
-- Projection(Salle,nomS) = Proection(MoyenIT,salleIT)
-- Projection(Salle,nomS) = Proection(PosteTele,salletele)
-- Projection(Salle,nomS) = Proection(Employe,salleEmploye)
-- Projection(Machine,NCM) = Projection(Num_Entreprise_Mach,NumCM)
/*les vues suivantes doivent être vides
   comme ca vEtage_Batiment=NULL,etc..
*/


CREATE OR REPLACE VIEW vEtage_Batiment AS
SELECT nomBat FROM Etage
EXCEPT
SELECT nomB FROM Batiment;


CREATE OR REPLACE VIEW vBatiment_Etage_Salle AS
SELECT Bati,numE FROM Salle
EXCEPT
SELECT nomBat,numEtage FROM Etage;


CREATE OR REPLACE VIEW vSalle_Photo AS
SELECT nom_salle FROM PhotoSalle
EXCEPT
SELECT nomS FROM Salle;


CREATE OR REPLACE VIEW vSalle_GazSpecifique AS
SELECT nom_Salle FROM GazSpecifique
EXCEPT
SELECT nomS FROM Salle;


CREATE OR REPLACE VIEW vSalle_Mach AS
SELECT salleMach FROM Machine
EXCEPT
SELECT nomS FROM Salle;


CREATE OR REPLACE VIEW vSalle_Moyen AS
SELECT salleIT FROM MoyenIT
EXCEPT
SELECT nomS FROM Salle;

CREATE OR REPLACE VIEW vSalle_Poste AS
SELECT salletele FROM PosteTele
EXCEPT
SELECT nomS FROM Salle;


CREATE OR REPLACE VIEW vSalle_Employe AS
SELECT salleEmploye FROM Employe
EXCEPT
SELECT nomS FROM Salle;

CREATE OR REPLACE VIEW vMach_Num AS
SELECT NCM FROM Machine
EXCEPT
SELECT NumCM FROM Num_Entreprise_Mach;


-- Si un objet est associé à un autre objet, les deux objets doivent être dans la même salle
/*les vues suivantes doivent être vides*/
CREATE OR REPLACE VIEW vPoste_Empl_Salle AS
SELECT P.salletele FROM PosteTele P WHERE P.hostID IS NOT NULL
EXCEPT
SELECT E.salleEmploye FROM Employe E LEFT JOIN PosteTele P ON P.hostID=E.numBadge; 

CREATE OR REPLACE VIEW vMoyen_Empl_Salle AS
SELECT M.salleIT FROM MoyenIT M WHERE M.resp IS NOT NULL
EXCEPT
SELECT E.salleEmploye FROM Employe E LEFT JOIN MoyenIT M ON M.resp=E.numBadge;

CREATE OR REPLACE VIEW vMoyen_Machine_Salle AS
SELECT M.salleIT FROM MoyenIT M WHERE M.MachineLie IS NOT NULL
EXCEPT
SELECT MA.sallemach FROM Machine MA LEFT JOIN MoyenIT M ON M.MachineLie=MA.codeMach;

-- Intersection(Projection(Laboratoire,sigle),Projection(Departement,sigle),Projection(Projet,sigle)) = {}

CREATE OR REPLACE VIEW vIntersec_org AS
SELECT L.sigle FROM Laboratoire L
INTERSECT
SELECT D.sigle FROM Departement D
INTERSECT
SELECT P.sigle FROM Projet P;

/*on doit avoir vIntersec_org=NULL*/

-- Union((Projection(Laboratoire,sigle),Projection(Departement,sigle),Projection(Projet,sigle)) = Projection(Organisation,sigle)

CREATE OR REPLACE VIEW vSigle_union AS
SELECT L.sigle AS S FROM Laboratoire L
UNION
SELECT D.sigle FROM Departement D
UNION
SELECT P.sigle FROM Projet P;

CREATE OR REPLACE VIEW verif_union AS
SELECT O.sigle FROM Organisation O
EXCEPT
SELECT S AS sigle FROM vSigle_union;

/*on doit verifier que verif_union=NULL*/