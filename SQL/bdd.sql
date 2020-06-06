-- Suppression des tables et types

DROP TABLE IF EXISTS Batiment
DROP TABLE IF EXISTS Etage
DROP TABLE IF EXISTS Salle
DROP TABLE IF EXISTS GazSpecifique
DROP TABLE IF EXISTS PhotoSalle
DROP TABLE IF EXISTS Employe
DROP TABLE IF EXISTS PosteTele
DROP TABLE IF EXISTS MoyenIT
DROP TABLE IF EXISTS AddressMoyenIT
DROP TABLE IF EXISTS Num_Entreprise_Mach
DROP TABLE IF EXISTS Machine
DROP TABLE IF EXISTS Organisation
DROP TABLE IF EXISTS Laboratoire
DROP TABLE IF EXISTS Departement
DROP TABLE IF EXISTS Projet
DROP TABLE IF EXISTS RHprojet
DROP TABLE IF EXISTS RessouceProjet_IT

-- Creation des types

CREATE TYPE typetele AS ENUM ('VOIP','TOIP','Landline');
CREATE TYPE etat AS ENUM ('CDI','CDD','stagiaire');
CREATE TYPE typeit AS ENUM ('PC','portable','serveur');
CREATE TYPE gaz AS ENUM ('Butane','methane','oxygene','azote','hydrogene','helium');
CREATE TYPE verifier AS ENUM ('1','0');



-- Creation des tables

CREATE TABLE Batiment(
    nomB VARCHAR PRIMARY KEY,
    superficieB INT NOT NULL,
    addrGPS_lat VARCHAR(15) UNIQUE NOT NULL,
    addrGPS_lng VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE Etage(
    nomBat VARCHAR,
    numEtage INT,
    planEtage VARCHAR,
    UNIQUE (nomBat,numEtage),
    PRIMARY KEY(nomBat,numEtage),
    FOREIGN KEY(nomBat) REFERENCES Batiment(nomB)
);

CREATE TABLE Salle(
    nomS VARCHAR PRIMARY KEY,
    Bati VARCHAR NOT NULL,
    numE INT NOT NULL,
    superficieS INT NOT NULL,
    capaciteHumMax INT NOT NULL,
    planSalle VARCHAR,
    airComprime verifier NOT NULL,
    elecTriphase verifier NOT NULL,
    nbPriseElec INT NOT NULL,
    nbPriseResaux INT NOT NULL,
    FOREIGN KEY(numE,Bati) REFERENCES Etage(numEtage,nomBat)
);

CREATE TABLE PhotoSalle(
    nom_salle VARCHAR REFERENCES Salle(nomS),
    photos VARCHAR,
    PRIMARY KEY(nom_salle)
);

CREATE TABLE GazSpecifique(
    nom_Salle VARCHAR REFERENCES Salle(nomS),
    Gaz gaz,
    PRIMARY KEY(nom_Salle,Gaz)
);

CREATE TABLE Num_Entreprise_Mach(
    NumCM VARCHAR PRIMARY KEY,
    EentrepriseMach VARCHAR NOT NULL
);

CREATE TABLE Machine(
    codeMach VARCHAR PRIMARY KEY,
    type VARCHAR NOT NULL CHECK (type = 'Mach_labo' OR type = 'Mach_fabr'),
    sallemach VARCHAR,
    modeleMach VARCHAR,
    description TEXT NOT NULL,
    puissanceElec INT NOT NULL,
    besoinTriphase verifier NOT NULL,
    besoinResaux verifier NOT NULL,
    besoinGaz gaz,
    taille INT NOT NULL,
    NCM VARCHAR,
    FOREIGN KEY(sallemach) REFERENCES Salle(nomS),
    FOREIGN KEY(NCM) REFERENCES Num_Entreprise_Mach(NumCM)
);

CREATE TABLE Organisation(
    sigle VARCHAR(6) UNIQUE,
    PRIMARY KEY(sigle)
);

CREATE TABLE Employe(
    numBadge VARCHAR(8) PRIMARY KEY,
    salleEmploye VARCHAR NOT NULL,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    E_mail VARCHAR NOT NULL,
    statut etat NOT NULL,
    emplacement TEXT NOT NULL,
    empl_labo VARCHAR(6),
    empl_depa VARCHAR(6),
    FOREIGN KEY(salleEmploye) REFERENCES Salle(nomS),
    CHECK (((empl_labo IS NULL) AND (empl_depa IS NOT NULL)) OR ((empl_labo IS NOT NULL) AND (empl_depa IS NULL)) OR ((empl_labo IS NOT NULL) AND (empl_depa IS NOT NULL)))
);

CREATE TABLE Laboratoire(
    sigle VARCHAR(6) PRIMARY KEY,
    nom VARCHAR NOT NULL,
    directeur VARCHAR(8) UNIQUE,
    logo VARCHAR,
    thmatique_etude TEXT NOT NULL,
    FOREIGN KEY(sigle) REFERENCES Organisation(sigle),
    FOREIGN KEY(directeur) REFERENCES Employe(numBadge)
);

CREATE TABLE Departement(
    sigle VARCHAR(6) PRIMARY KEY,
    nom VARCHAR NOT NULL,
    directeur VARCHAR(8) UNIQUE,
    domaine TEXT NOT NULL,
    FOREIGN KEY(sigle) REFERENCES Organisation(sigle),
    FOREIGN KEY(directeur) REFERENCES Employe(numBadge)
);

ALTER TABLE Employe
    ADD CONSTRAINT fk_employe_labo FOREIGN KEY (empl_labo) REFERENCES Laboratoire (sigle),
	ADD CONSTRAINT fk_employe_depa FOREIGN KEY (empl_depa) REFERENCES Departement (sigle)
;

CREATE TABLE MoyenIT(
    nomIT VARCHAR PRIMARY KEY,
    salleIT VARCHAR NOT NULL,
    MachineLie VARCHAR,
    resp VARCHAR(8),
    typeIT typeit NOT NULL,
    OS VARCHAR NOT NULL,
    FOREIGN KEY(salleIT) REFERENCES Salle(nomS),
    FOREIGN KEY(MachineLie) REFERENCES Machine(codeMach),
    FOREIGN KEY(resp) REFERENCES Employe(numBadge)
);

CREATE TABLE AddressMoyenIT(
    mIT VARCHAR REFERENCES MoyenIT(nomIT),
    addrMAC VARCHAR(17),
    PRIMARY KEY(mIT,addrMAC)
);

CREATE TABLE PosteTele(
    numInt INT PRIMARY KEY,
    numExt INT,
    salletele VARCHAR NOT NULL,
    hostID VARCHAR(8), 
    typeTele typetele NOT NULL,
    modeleTele VARCHAR,
    marque TEXT NOT NULL,
    FOREIGN KEY(salletele) REFERENCES Salle(nomS),
    FOREIGN KEY(hostID) REFERENCES Employe(numBadge)
);




CREATE TABLE Projet(
    sigle VARCHAR(6) PRIMARY KEY,
    nom VARCHAR NOT NULL,
    description TEXT NOT NULL,
    date_start DATE NOT NULL,
    date_end DATE,
    FOREIGN KEY(sigle) REFERENCES Organisation(sigle),
    CHECK ((date_end >= date_start) OR (date_end IS NULL))
);

CREATE TABLE RHprojet(
    proj VARCHAR(6),
    EmployeP VARCHAR(8),
    chef verifier NOT NULL,
    role TEXT,
    FOREIGN KEY(proj) REFERENCES Projet(sigle),
    FOREIGN KEY(EmployeP) REFERENCES Employe(numBadge),
    PRIMARY KEY(proj,EmployeP),
    CHECK (((chef='1') AND (role IS NULL)) OR ((chef='0') AND (role IS NOT NULL)))
);

CREATE TABLE RessouceProjet_IT(
    Proj VARCHAR(6),
    moyen VARCHAR,
    FOREIGN KEY(Proj) REFERENCES Projet(sigle),
    FOREIGN KEY(moyen) REFERENCES MoyenIT(nomIT),
    PRIMARY KEY(Proj,moyen)
);