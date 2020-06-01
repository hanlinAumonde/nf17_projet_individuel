-- Insretion des donnees :

-- Insertion des batiments :

INSERT INTO Batiment VALUES('Siège social de la société umbrella','5000'，'38.587040','-98.304525');
INSERT INTO Batiment VALUES('Centre de recherche médicale','15000'，'36.597641','-99.409520');
INSERT INTO Batiment VALUES('Centre de production cosmétique','15500'，'38.812040','-101.39037');

-- Insertion des etages :

INSERT INTO Etage(nomBat,numEtage) VALUES('Siège social de la société umbrella','1');
INSERT INTO Etage(nomBat,numEtage) VALUES('Siège social de la société umbrella','2');
INSERT INTO Etage(nomBat,numEtage) VALUES('Siège social de la société umbrella','3');
INSERT INTO Etage(nomBat,numEtage) VALUES('Siège social de la société umbrella','4');
INSERT INTO Etage(nomBat,numEtage) VALUES('Siège social de la société umbrella','5');

INSERT INTO Etage(nomBat,numEtage) VALUES('Centre de recherche médicale','1');
INSERT INTO Etage(nomBat,numEtage) VALUES('Centre de recherche médicale','2');
INSERT INTO Etage(nomBat,numEtage) VALUES('Centre de recherche médicale','3');

INSERT INTO Etage(nomBat,numEtage) VALUES('Centre de production cosmétique','1');
INSERT INTO Etage(nomBat,numEtage) VALUES('Centre de production cosmétique','2');

-- Insertion des salles :

INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('aaa0000','Siège social de la société umbrella','1','120','15','1','1','5','2');
INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('aaa0001','Siège social de la société umbrella','1','100','12','1','1','4','2');
INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('aaa0010','Siège social de la société umbrella','2','95','10','0','1','3','1');
INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('aaa0015','Siège social de la société umbrella','2','130','16','1','1','6','3');
INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('aaa0023','Siège social de la société umbrella','3','50','5','0','1','3','0');
INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('aaa0105','Siège social de la société umbrella','3','120','15','1','1','5','2');
INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('aaa0112','Siège social de la société umbrella','4','40','13','0','0','2','0');
INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('aaa0121','Siège social de la société umbrella','4','100','9','1','0','4','2');
INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('aaa0129','Siège social de la société umbrella','5','115','12','1','1','4','2');

   INSERT INTO GazSpecifique VALUES('aaa0112','helium');
   INSERT INTO GazSpecifique VALUES('aaa0112','Butane');
   INSERT INTO GazSpecifique VALUES('aaa0129','azote');

INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('abw0000','Centre de recherche médicale','1','100','8','1','0','5','1');
INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('abw0004','Centre de recherche médicale','2','120','10','1','1','5','2');
INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('abw0023','Centre de recherche médicale','2','130','11','1','1','4','3');
INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('abw0031','Centre de recherche médicale','3','95','7','0','1','4','1');
  
   INSERT INTO GazSpecifique VALUES('abw0004','oxygene');
   INSERT INTO GazSpecifique VALUES('abe0004','hydrogene');
   INSERT INTO GazSpecifique VALUES('abw0023','methane');
   INSERT INTO GazSpecifique VALUES('abw0031','Butane');
   INSERT INTO GazSpecifique VALUES('abw0031','methane');
   INSERT INTO GazSpecifique VALUES('abw0031','helium');
   
INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('bay0000','Centre de production cosmétique','1','70','5','0','0','3','1');
INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('bay0002','Centre de production cosmétique','2','180','18','1','1','8','5');
INSERT INTO Salle(nomS,Bati,numE,superficieS,capaciteHumMax,airComprime,elecTriphase,nbPriseElec,nbPriseResaux) VALUES('bay0011','Centre de production cosmétique','2','120','11','0','1','5','2');

   INSERT INTO GazSpecifique VALUES('bay0002','azote');
   INSERT INTO GazSpecifique VALUES('bay0011','oxygene');

-- Insertion des organisations :

INSERT INTO Organisation VALUES('LC','Laboratoire de chimie');
INSERT INTO Organisation VALUES('CCE','Centre de contrôle expérimental');
INSERT INTO Organisation VALUES('LS1','Laboratoire de soufflerie n°1');
INSERT INTO Organisation VALUES('LS2','Laboratoire de soufflerie n°2');
INSERT INTO Organisation VALUES('DRMC','Département de recherche de marché des cosmétiques');
INSERT INTO Organisation VALUES('DDNP','Département de développement de nouveaux produits');
INSERT INTO Organisation VALUES('SIQ','Services d inspection de la qualité');
INSERT INTO Organisation VALUES('LVS','Laboratoire de virus spécifique');
INSERT INTO Organisation VALUES('IEQNP','Inspection et évaluation de la qualité des nouveaux produits');
INSERT INTO Organisation VALUES('EMMPR','Enquêter sur les marques de maquillage populaires récemment');
INSERT INTO Organisation VALUES('DNCV','Développement d un nouveau vaccin contre le coronavirus');

INSERT INTO Laboratoire(sigle,nom,thmatique_etude) VALUES('LC','Laboratoire de chimie','chimie');
INSERT INTO Laboratoire(sigle,nom,thmatique_etude) VALUES('LS1','Laboratoire de soufflerie n°1');
INSERT INTO Laboratoire(sigle,nom,thmatique_etude) VALUES('LS2','Laboratoire de soufflerie n°2');
INSERT INTO Laboratoire(sigle,nom,thmatique_etude) VALUES('LVS','Laboratoire de virus spécifique');

INSERT INTO Departement(sigle,nom,domaine) VALUES('CCE','Centre de contrôle expérimental','IT_controle');
INSERT INTO Departement(sigle,nom,domaine) VALUES('DRMC','Département de recherche de marché des cosmétiques','etude_marche');
INSERT INTO Departement(sigle,nom,domaine) VALUES('DDNP','Département de développement de nouveaux produits','production');
INSERT INTO Departement(sigle,nom,domaine) VALUES('SIQ','Services d inspection de la qualité','sondage');

INSERT INTO Projet VALUES('IEQNP','Inspection et évaluation de la qualité des nouveaux produits','Prélevez un certain échantillon pour une évaluation globale','2020-05-01','2020-05-31');
INSERT INTO Projet VALUES('EMMPR','Enquêter sur les marques de maquillage populaires récemment','Décider de la direction de production du produit en fonction des résultats de l enquête','2020-03-03','2020-04-01');
INSERT INTO Projet VALUES('DNCV','Développement d un nouveau vaccin contre le coronavirus','Le développement des vaccins doit se poursuivre le plus tôt possible','2020-01-25',NULL);

-- Insertion des employes:

INSERT INTO Employe VALUES('aa1000ez','aaa0015','shane','Jacob','shane_j@gmail.com','CDD','bureau_01',NULL,'DRMC');
INSERT INTO Employe VALUES('ac0120ef','aaa0023','Frank','Aiden','FA1234@hotmail.com','CDI','bureau_03',NULL,'DRMC');
INSERT INTO Employe VALUES('bh2019qz','abw0004','John','Jastin','789J_J@gmail.com','stagiaire','tab_labo_02','LVS',NULL);
INSERT INTO Employe VALUES('ad0401ez','abw0023','Peter','Aiden','peter111@domains.com','CDD','tab_labo_01','LVS','DDNP');
INSERT INTO Employe VALUES('as1900oz','bay0000','Mark','Ryan','Mryan@gmail.com','CDI','bureau_01',NULL,'SIQ');
INSERT INTO Employe VALUES('ca9000ep','bay0002','Mike','Ethan','Methan@gmail.com','stagiaire','bureau_01',NULL,'SIQ');
INSERT INTO Employe VALUES('cv1102qw','abw0023','Jade','William','Jwilliam@gmail.com','CDI','labo_02','LSV','CCE');
INSERT INTO Employe VALUES('jk1034gh','bay0011','Bob','Kevin','Bkevin@hotmail.com','CDD','bureau_a01','LC',NULL);

-- Insertion des 

-- Insertion des