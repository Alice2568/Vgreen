-- Création des tables pour Village Green

-- Table des commerciaux
CREATE TABLE commerciaux (
    id_commercial INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(100),
    tel VARCHAR(20)
);

-- Table des clients
CREATE TABLE clients (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    mot_de_passe VARCHAR(255),
    type_client VARCHAR(50),
    coefficient_vente DECIMAL(5,2),
    id_commercial INT,
    FOREIGN KEY (id_commercial) REFERENCES commerciaux(id_commercial)
);

-- Table des fournisseurs
CREATE TABLE fournisseurs (
    id_fournisseur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(100),
    tel VARCHAR(20)
);

-- Table des rubriques
CREATE TABLE rubriques (
    id_rubrique INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100)
);

-- Table des sous-rubriques
CREATE TABLE sous_rubriques (
    id_sousrubrique INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    id_rubrique INT,
    FOREIGN KEY (id_rubrique) REFERENCES rubriques(id_rubrique)
);

-- Table des produits
CREATE TABLE produits (
    id_produit INT AUTO_INCREMENT PRIMARY KEY,
    libelle_court VARCHAR(100),
    libelle_long TEXT,
    ref_fournisseur VARCHAR(100),
    prix_achat DECIMAL(10,2),
    photo VARCHAR(255),
    stock INT,
    actif BOOLEAN DEFAULT TRUE,
    id_sousrubrique INT,
    id_fournisseur INT,
    FOREIGN KEY (id_sousrubrique) REFERENCES sous_rubriques(id_sousrubrique),
    FOREIGN KEY (id_fournisseur) REFERENCES fournisseurs(id_fournisseur)
);

-- Table des commandes
CREATE TABLE commandes (
    id_commande INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT,
    date_commande DATETIME DEFAULT CURRENT_TIMESTAMP(),
    reduction DECIMAL(5,2),
    total_ht DECIMAL(10,2),
    etat VARCHAR(50),
    adresse_livraison TEXT,
    adresse_facturation TEXT,
    FOREIGN KEY (id_client) REFERENCES clients(id_client)
);

-- Table des lignes de commande
CREATE TABLE lignes_commande (
    id_ligne INT AUTO_INCREMENT PRIMARY KEY,
    id_commande INT,
    id_produit INT,
    quantite INT,
    prix_unitaire DECIMAL(10,2),
    FOREIGN KEY (id_commande) REFERENCES commandes(id_commande),
    FOREIGN KEY (id_produit) REFERENCES produits(id_produit)
);

-- Table des factures
CREATE TABLE factures (
    id_facture INT AUTO_INCREMENT PRIMARY KEY,
    id_commande INT,
    date_facture DATETIME DEFAULT CURRENT_TIMESTAMP(),
    montant_ht DECIMAL(10,2),
    mode_paiement VARCHAR(50),
    date_paiement DATETIME,
    FOREIGN KEY (id_commande) REFERENCES commandes(id_commande)
);

-- Table des livraisons
CREATE TABLE livraisons (
    id_livraison INT AUTO_INCREMENT PRIMARY KEY,
    id_commande INT,
    date_livraison DATETIME,
    statut VARCHAR(100),
    FOREIGN KEY (id_commande) REFERENCES commandes(id_commande)
);

-- Table des lignes de livraison
CREATE TABLE lignes_livraison (
    id_ligne INT AUTO_INCREMENT PRIMARY KEY,
    id_livraison INT,
    id_produit INT,
    quantite INT,
    FOREIGN KEY (id_livraison) REFERENCES livraisons(id_livraison),
    FOREIGN KEY (id_produit) REFERENCES produits(id_produit)
);
