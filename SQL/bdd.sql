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
);