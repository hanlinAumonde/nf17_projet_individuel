-- methode 1
/*cette methode est pour s'assurer que le nombre de personnes dans la salle ne dépasse pas la capacité de la salle*/

CREATE OR REPLACE VIEW vNb_RESTE_empl_salle AS
SELECT S.nomS , (S.capaciteHumMax-COUNT(E.numBadge)) AS NB_reste
FROM Salle S
LEFT JOIN Employe E ON S.nomS=E.salleEmploye
GROUP BY S,nomS;

-- methode 2
/*cette methode est pour connaitre la proportion d'ordinateurs occupant la salle pour assurer la sécurité des employés*/

CREATE OR REPLACE VIEW vPropMach_Salle AS
SELECT S.nomS , (SUM(M.taille)/S.superficieS) AS Prop_Mach
FROM Salle S
LEFT JOIN Machine M ON S.nomS=M.sallemach
GROUP BY S,nomS;


-- methode 3
/*cette methode est pour confirmer l'état du projet*/

CREATE OR REPLACE VIEW vProjet_En_Cours AS
SELECT sigle,nom,date_start FROM Projet WHERE date_end IS NULL AND date_start <= CURRENT_DATE
UNION 
SELECT sigle,nom,date_start FROM Projet WHERE date_end IS NOT NULL AND date_start <= CURRENT_DATE AND date_end >=CURRENT_DATE;

CREATE OR REPLACE VIEW vProjet_Pret AS
SELECT sigle,nom,date_end 
FROM Projet 
WHERE date_end IS NOT NULL 
AND date_end < CURRENT_DATE;

-- methode 4 (droit_chef_IT)
/*cette methode est pour donner une liste des moyenITs disponibles(Utiliser uniquement moyenIT, qui est en charge des membres du projet)*/
/*on fait le choix de projet au niveau applicatif,ici,on suppose que le projet est 'DNCV'*/

CREATE OR REPLACE VIEW vMoyen_Projet_Liste AS
SELECT M.nomIT 
FROM RHprojet RH,Employe E,MoyenIT M
WHERE RH.proj='DNCV'
AND RH.EmployeP=E.numBadge
AND E.numBadge=M.resp;

/*on doit verifier qu'un moyenIT est isponible ou pas,ici on suppose que le moyenIT est 'por1004'*/

CREATE OR REPLACE VIEW verif_moyen_dispo AS
SELECT nomIT FROM MoyenIT WHERE nomIT='por1004'
INTERSECT
SELECT RIT.moyen FROM RessouceProjet_IT RIT LEFT JOIN vProjet_En_Cours V ON RIT.Proj=V.sigle;

/*verif_moyen_dispo=NULL <=> moyenIT est disponible*/

-- methode 5
/*cette methode est pour recherche d'employés sans aucun projet*/

CREATE OR REPLACE VIEW vNB_Proj_Empl AS
SELECT E.numBadge AS num_empl,E.nom AS nom_empl,E.prenom AS prenom_empl,COUNT(RH.proj) AS NB_Proj
FROM Employe E
LEFT JOIN RHprojet RH
ON E.numBadge=RH.EmployeP
GROUP BY E.numBadge;

CREATE OR REPLACE VIEW vEmployeZombie AS
SELECT num_empl,nom_empl,prenom_empl FROM vNB_Proj_Empl WHERE NB_Proj=0
INTERSECT
SELECT numBadge,nom,prenom FROM Employe;

-- methode 6
/*cette methode est pour trouver des employés responsables de plusieurs moyensIT*/

CREATE OR REPLACE VIEW vNB_Moyen_Empl AS
SELECT E.numBadge AS num_empl,E.nom AS nom_empl,E.prenom AS prenom_empl,COUNT(M.nomIT) AS NB_MoyenIT
FROM Employe E
LEFT JOIN MoyenIT M
ON E.numBadge=M.resp
GROUP BY E.numBadge;