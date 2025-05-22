-- Active: 1733929630764@@127.0.0.1@3306@VILLAGEGREEN
CREATE DATABASE VILLAGEGREEN;

USE VILLAGEGREEN;

CREATE TABLE rubrique(
   Id_rubrique INT NOT NULL AUTO_INCREMENT,
   nom VARCHAR(50),
   PRIMARY KEY(Id_rubrique)
);

CREATE TABLE sous_rubrique(
   Id_sous_rubrique INT NOT NULL AUTO_INCREMENT,
   nom VARCHAR(50),
   Id_rubrique INT NOT NULL,
   PRIMARY KEY(Id_sous_rubrique),
   FOREIGN KEY(Id_rubrique) REFERENCES rubrique(Id_rubrique)
);

CREATE TABLE client_Pro(
   Id_client INT NOT NULL AUTO_INCREMENT,
   nom VARCHAR(50),
   adresse VARCHAR(50),
   mail VARCHAR(50),
   telephone VARCHAR(50),
   nom_commercial VARCHAR(50),
   coeff_taxe DECIMAL(5,2),
   PRIMARY KEY(Id_client)
);

CREATE TABLE commerciale_particulier(
   Id_commerciale_particulier INT NOT NULL AUTO_INCREMENT,
   nom VARCHAR(50),
   PRIMARY KEY(Id_commerciale_particulier)
);

CREATE TABLE client_particulier(
   Id_client_particulier INT NOT NULL AUTO_INCREMENT,
   adresse VARCHAR(50),
   mail VARCHAR(50),
   telephone VARCHAR(50),
   nom VARCHAR(50),
   coeff_taxe DECIMAL(5,2),
   Id_commerciale_particulier INT NOT NULL,
   PRIMARY KEY(Id_client_particulier),
   FOREIGN KEY(Id_commerciale_particulier) REFERENCES commerciale_particulier(Id_commerciale_particulier)
);

CREATE TABLE fournisseur(
   Id_fournisseur INT NOT NULL AUTO_INCREMENT,
   nom VARCHAR(50),
   PRIMARY KEY(Id_fournisseur)
);

CREATE TABLE Produit(
   Id_Produit INT NOT NULL AUTO_INCREMENT,
   Nom VARCHAR(50),
   Description VARCHAR(50),
   Ref_Fournisseur VARCHAR(50),
   PrixHA DECIMAL(7,2),
   PrixHt DECIMAL(7,2),
   image VARCHAR(50),
   Id_fournisseur INT NOT NULL,
   Id_sous_rubrique INT NOT NULL,
   PRIMARY KEY(Id_Produit),
   FOREIGN KEY(Id_fournisseur) REFERENCES fournisseur(Id_fournisseur),
   FOREIGN KEY(Id_sous_rubrique) REFERENCES sous_rubrique(Id_sous_rubrique)
);

CREATE TABLE commande(
   Id_commande INT NOT NULL AUTO_INCREMENT,
   adresse_livraison VARCHAR(50),
   adresse_facturation VARCHAR(50),
   date_archivage DATETIME,
   paiement Bool,
   reduction VARCHAR(50),
   Id_client_particulier INT NOT NULL,
   Id_client INT NOT NULL,
   PRIMARY KEY(Id_commande),
   FOREIGN KEY(Id_client_particulier) REFERENCES client_particulier(Id_client_particulier),
   FOREIGN KEY(Id_client) REFERENCES client_Pro(Id_client)
);

CREATE TABLE livraison(
   Id_livraison INT NOT NULL AUTO_INCREMENT,
   adresse VARCHAR(50),
   quantite VARCHAR(50),
   date_archivage DATETIME,
   Id_commande INT NOT NULL,
   PRIMARY KEY(Id_livraison),
   FOREIGN KEY(Id_commande) REFERENCES commande(Id_commande)
);

CREATE TABLE contient(
   Id_Produit INT,
   Id_commande INT,
   quantité INT,
   PRIMARY KEY(Id_Produit, Id_commande),
   FOREIGN KEY(Id_Produit) REFERENCES Produit(Id_Produit),
   FOREIGN KEY(Id_commande) REFERENCES commande(Id_commande)
);
