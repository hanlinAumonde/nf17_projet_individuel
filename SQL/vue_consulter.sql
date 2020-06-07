-- Afficher tous les etages avec leurs plans d'un batiment

  /*ici,suppose que le batiment est 'Centre de recherche médicale' */

CREATE OR REPLACE VIEW vEtagePlan AS
SELECT E.nomBat , E.numEtage , E.planEtage 
FROM  Etage E,Batiment B
WHERE E.nomBat='Centre de recherche médicale'
AND E.nomBat=B.nomB;

-- Afficher tous les salles d'un batiment dans un etage

  /*ici,batiment:'Centre de recherche médicale',numetage='2'*/

CREATE OR REPLACE VIEW vEtageSalle AS
SELECT S.Bati , S.numE, S.nomS
FROM  Salle S , Batiment B , Etage E
WHERE S.Bati='Centre de recherche médicale'
AND S.numE=2
AND E.nomBat=B.nomB
AND E.nomBat=S.Bati
AND E.numEtage=S.numE;

-- Afficher tous les objets d'un salle
   
   /*ici, salle:'abw0004'*/

CREATE OR REPLACE VIEW vSalleMach AS
SELECT  S.nomS , M.codeMach
FROM Salle S , Machine M
WHERE S.nomS=M.sallemach 
AND S.nomS='abw0004';

CREATE OR REPLACE VIEW vSallePost AS
SELECT S.nomS , P.numInt
FROM Salle S , PosteTele P
WHERE S.nomS=P.salletele
AND S.nomS='abw0004';

CREATE OR REPLACE VIEW vSalleMoyen AS
SELECT S.nomS , M.nomIT
FROM Salle S , MoyenIT M
WHERE S.nomS=M.salleIT 
AND S.nomS='abw0004';

CREATE OR REPLACE VIEW vSalleEmpl AS
SELECT S.nomS , E.numBadge , E.nom , E.prenom
FROM Salle S , Employe E
WHERE S.nomS=E.salleEmploye  
AND S.nomS='abw0004';
   
   /*les utilisateurs peuvent choisir le type des objet(au niveau applcatif) pour afficher le vue correspond*/


-- Afficher les nbs des employes de tous les organisations
  
  --Les laboratoires:
  
    CREATE OR REPLACE VIEW vNbLabo AS
    SELECT O.sigle , COUNT(E.numBadge) AS nb_empl
    FROM Organisation O , Employe E
    WHERE O.sigle=E.empl_labo
    GROUP BY O.sigle;
    
  --Les departements:
  
    CREATE OR REPLACE VIEW vNbDepa AS
    SELECT O.sigle , COUNT(E.numBadge) AS nb_empl
    FROM Organisation O , Employe E
    WHERE O.sigle=E.empl_depa
    GROUP BY O.sigle;
