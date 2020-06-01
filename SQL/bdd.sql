-- Suppression des tables et types

DROP TABLE IF EXISTS Batiment
DROP TABLE IF EXISTS Etage
DROP TABLE IF EXISTS Salle
DROP TABLE IF EXISTS PosteTele
DROP TABLE IF EXISTS Employe
DROP TABLE IF EXISTS MoyenIT
DROP TABLE IF EXISTS Machine
DROP TABLE IF EXISTS Organisation
DROP TABLE IF EXISTS Laboratoire
DROP TABLE IF EXISTS Departement
DROP TABLE IF EXISTS Projet
DROP TABLE IF EXISTS RHprojet
DROP TABLE IF EXISTS RessouceProjet_IT

-- Creation des types

CREATE TYPE typetele AS ENUM ('VOIP','TOIP','Landline')
CREATE TYPE etat AS ENUM ('CDI','CDD','stagiaire')
CREATE TYPE typeit AS ENUM ('PC','portable','serveur')
CREATE TYPE gaz AS ENUM ('Butane','methane','oxygene','azote','hydrogene','helium')

-- Creation des tables

CREATE TABLE Batiment(
    nomB VARCHAR PRIMARY KEY,
    superficieB INT NOT NULL,
    addrGPS_lat VARCHAR(15) UNIQUE NOT NULL,
    addrGPS_lng VARCHAR(15) UNIQUE NOT NULL,
    nbEtage INT NOT NULL
);

CREATE TABLE Etage(
    nomBat VARCHAR,
    numEtage INT,
    planEtage IMAGE,
    FOREIGN KEY(nomBat) REFERENCES Batiment(nomB),
    PRIMARY KEY(nomBat,numEtage)
);

CREATE TABLE Salle(
    nomS VARCHAR,
    Bati VARCHAR NOT NULL,
    numE INT NOT NULL,
    superficieS INT NOT NULL,
    capaciteHumMax INT NOT NULL,
    planSalle IMAGE,
    airComprime BOOL NOT NULL,
    elecTriphase BOOL NOT NULL,
    nbPriseElec INT NOT NULL,
    nbPriseResaux INT NOT NULL
    FOREIGN KEY(Bati) REFERENCES Batiment(nomB),
    FOREIGN KEY(numE) REFERENCES Etage(numEtage),
    PRIMARY KEY(nomS)
);

CREATE TABLE PhotoSalle(
    nom_salle VARCHAR REFERENCES Salle(nomS),
    photos IMAGE,
    PRIMARY KEY(nom_salle)
);

CREATE TABLE GazSpecifique(
    nom_Salle VARCHAR REFERENCES Salle(nomS),
    Gaz gaz,
    PRIMARY KEY(nom_Salle)
);

CREATE TABLE Machine(
    codeMach VARCHAR PRIMARY KEY,
    type VARCHAR NOT NULL CHECK (type = 'Mach_labo' OR type = 'Mach_fabr'),
    sallemach VARCHAR,
    modeleMach IMAGE,
    description TEXT NOT NULL,
    puissanceElec INT NOT NULL,
    besoinTriphase BOOL NOT NULL,
    besoinResaux BOOL NOT NULL,
    besoinGaz gaz,
    taille INT NOT NULL,
    NCM INT,
    FOREIGN KEY(sallemach) REFERENCES Salle(nomS),
    FOREIGN KEY(NCM) REFERENCES Num_Entreprise_Mach(NumCM)
);

CREATE TABLE Num_Entreprise_Mach(
    NumCM INT PRIMARY KEY,
    EentrepriseMach VARCHAR NOT NULL
);

CREATE TABLE Employe(
    numBadge INT PRIMARY KEY,
    salleEmploye VARCHAR NOT NULL,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    E-mail VARCHAR NOT NULL,
    statut etat NOT NULL,
    emplacement TEXT NOT NULL,
    empl_labo VARCHAR(6),
    empl_depa VARCHAR(6),
    FOREIGN KEY(salleEmploye) REFERENCES Salle(nomS),
    FOREIGN KEY(empl_labo) REFERENCES Laboratoire(sigle),
    FOREIGN KEY(empl_depa) REFERENCES Departement(sigle),
    CHECK (((empl_labo IS NULL) AND (empl_depa IS NOT NULL)) OR ((empl_labo IS NOT NULL) AND (empl_depa IS NULL)) OR ((empl_labo IS NOT NULL) AND (empl_depa IS NOT NULL)))
);

CREATE TABLE MoyenIT(
    nomIT VARCHAR PRIMARY KEY,
    salleIT VARCHAR NOT NULL,
    MachineLie VARCHAR,
    resp INT,
    typeIT typeit NOT NULL,
    OS VARCHAR NOT NULL,
    FOREIGN KEY(salleIT) REFERENCES Salle(nomS),
    FOREIGN KEY(MachineLie) REFERENCES Machine(codeMach),
    FOREIGN KEY(RESP) REFERENCES Employe(numBadge)
);

CREATE TABLE PosteTele(
    numInt INT PRIMARY KEY,
    numExt INT,
    salletele VARCHAR NOT NULL,
    hostID INT NOT NULL, 
    typeTele typetele NOT NULL,
    modeleTele IMAGE,
    marque TEXT NOT NULL,
    FOREIGN KEY(salletele) REFERENCES Salle(nomS),
    FOREIGN KEY(hostID) REFERENCES Employe(numBadge)
);

CREATE TABLE Organisation(
    sigle VARCHAR(6) PRIMARY KEY,
    nom VARCHAR
);

CREATE TABLE Laboratoire(
    sigle VARCHAR(6) PRIMARY KEY,
    nom VARCHAR NOT NULL,
    directeur INT NOT NULL,
    logo IMAGE,
    thmatique_etude TEXT NOT NULL,
    FOREIGN KEY(sigle,nom) REFERENCES Organisation(sigle,nom),
    FOREIGN KEY(directeur) REFERENCES Employe(numBadge)
);

CREATE TABLE Departement(
    sigle VARCHAR(6) PRIMARY KEY,
    nom VARCHAR NOT NULL,
    directeur INT NOT NULL,
    domaine TEXT NOT NULL,
    FOREIGN KEY(sigle,nom) REFERENCES Organisation(sigle,nom),
    FOREIGN KEY(directeur) REFERENCES Employe(numBadge)
);

CREATE TABLE Projet(
    sigle VARCHAR(6) PRIMARY KEY,
    nom VARCHAR NOT NULL,
    description TEXT NOT NULL,
    date_start DATE NOT NULL,
    date_end DATE,
    FOREIGN KEY(sigle,nom) REFERENCES Organisation(sigle,nom),
    CHECK ((date_end >= date_start) OR date_end IS NULL)
);

CREATE TABLE RHprojet(
    proj VARCHAR(6),
    EmployeP INT,
    chef BOOL NOT NULL,
    role TEXT,
    FOREIGN KEY(proj) REFERENCES Projet(sigle),
    FOREIGN KEY(EmployeP) REFERENCES Employe(numBadge),
    PRIMARY KEY(proj,EmployeP),
    CHECK ((chef=1) AND (role IS NULL)) OR ((chef=0) AND (role IS NOT NULL))
);

CREATE TABLE RessouceProjet_IT(
    Proj VARCHAR(6),
    moyen VARCHAR,
    FOREIGN KEY(Proj) REFERENCES Projet(sigle),
    FOREIGN KEY(moyen) REFERENCES MoyenIT(nomIT),
    PRIMARY KEY(Proj,moyen)
);