-- Active: 1736869092207@@127.0.0.1@3306@VILLAGEGREEN
-- Insertion dans la table rubrique
INSERT INTO rubrique (nom) VALUES
('Instruments de musique'),
('Accessoires'),
('Sonorisation');

-- Insertion dans la table sous_rubrique
INSERT INTO sous_rubrique (nom, Id_rubrique) VALUES
('Guitares', 1),
('Batteries', 1),
('Câbles audio', 2),
('Amplis', 3);

-- Insertion dans la table fournisseur
INSERT INTO fournisseur (nom) VALUES
('Yamaha'),
('Fender'),
('Shure');

-- Insertion dans la table Produit
INSERT INTO Produit (Nom, Description, Ref_Fournisseur, PrixHA, PrixHt, image, Id_fournisseur, Id_sous_rubrique) VALUES
('Guitare acoustique', 'Guitare folk 6 cordes', 'YAM-GA-001', 150.00, 220.00, 'guitare.jpg', 1, 1),
('Batterie électronique', 'Kit complet', 'YAM-DR-002', 500.00, 750.00, 'batterie.jpg', 1, 2),
('Câble XLR', 'Câble 5m XLR', 'SHU-CB-003', 10.00, 15.00, 'cable.jpg', 3, 3),
('Ampli guitare', 'Ampli 100W', 'FEN-AMP-004', 200.00, 300.00, 'ampli.jpg', 2, 4);

-- Insertion dans la table client_Pro
INSERT INTO client_Pro (nom, adresse, mail, telephone, nom_commercial, coeff_taxe) VALUES
('SARL MusicPro', '10 rue des instruments', 'pro@musicpro.com', '0123456789', 'MusicPro', 1.20);

-- Insertion dans la table commerciale_particulier
INSERT INTO commerciale_particulier (nom) VALUES
('Jean Dupont'),
('Marie Claire');

-- Insertion dans la table client_particulier
INSERT INTO client_particulier (adresse, mail, telephone, nom, coeff_taxe, Id_commerciale_particulier) VALUES
('12 avenue des artistes', 'client1@mail.com', '0612345678', 'Alice Mélodie', 1.20, 1),
('34 rue du son', 'client2@mail.com', '0698765432', 'Bob Harmonie', 1.20, 2);

-- Insertion dans la table commande
INSERT INTO commande (adresse_livraison, adresse_facturation, date_archivage, paiement, reduction, Id_client_particulier, Id_client) VALUES
('12 avenue des artistes', '12 avenue des artistes', '2025-04-01 10:00:00', TRUE, 'Aucune', 1, 1),
('34 rue du son', '34 rue du son', '2025-04-02 11:30:00', FALSE, '10%', 2, 1);

-- Insertion dans la table livraison
INSERT INTO livraison (adresse, quantite, date_archivage, Id_commande) VALUES
('12 avenue des artistes', '1', '2025-04-03 09:00:00', 1),
('34 rue du son', '2', '2025-04-04 15:00:00', 2);

-- Insertion dans la table contient
INSERT INTO contient (Id_Produit, Id_commande, quantité) VALUES
(1, 1, 1),
(3, 1, 2),
(2, 2, 1),
(4, 2, 1);
