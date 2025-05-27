-- Commerciaux (2 lignes)
INSERT INTO commerciaux (nom, prenom, email, tel) VALUES
('Durand', 'Sophie', 'sophie.durand@villagegreen.fr', '0102030405'),
('Lemoine', 'Marc', 'marc.lemoine@villagegreen.fr', '0607080910');

-- Clients (5 lignes)
INSERT INTO clients (nom, prenom, email, mot_de_passe, type_client, coefficient_vente, id_commercial) VALUES
('Martin', 'Claire', 'claire.martin@gmail.com', 'mdp123', 'particulier', 1.2, 1),
('Dupont', 'Jean', 'jean.dupont@musicpro.fr', 'mdp456', 'professionnel', 1.1, 2),
('Moreau', 'Alice', 'alice.moreau@gmail.com', 'mdp789', 'particulier', 1.2, 1),
('Bernard', 'Luc', 'luc.bernard@proaudio.fr', 'mdp321', 'professionnel', 1.15, 2),
('Petit', 'Emma', 'emma.petit@gmail.com', 'mdp654', 'particulier', 1.2, 1);

-- Fournisseurs (5 lignes)
INSERT INTO fournisseurs (nom, email, tel) VALUES
('Yamaha', 'contact@yamaha.com', '0147203030'),
('Fender', 'contact@fender.com', '0147506060'),
('Roland', 'contact@roland.com', '0155603030'),
('Gibson', 'contact@gibson.com', '0155904040'),
('Korg', 'contact@korg.com', '0155705050');

-- Rubriques (2 lignes)
INSERT INTO rubriques (nom) VALUES
('Cordes'),
('Claviers');

-- Sous-rubriques (5 lignes)
INSERT INTO sous_rubriques (nom, id_rubrique) VALUES
('Guitares électriques', 1),
('Guitares acoustiques', 1),
('Basses', 1),
('Pianos numériques', 2),
('Synthétiseurs', 2);

-- Produits (5 lignes)
INSERT INTO produits (libelle_court, libelle_long, ref_fournisseur, prix_achat, photo, stock, actif, id_sousrubrique, id_fournisseur) VALUES
('Stratocaster', 'Guitare électrique Fender Stratocaster', 'FEN123', 450.00, 'strat.jpg', 20, TRUE, 1, 2),
('Les Paul', 'Guitare électrique Gibson Les Paul', 'GIB456', 550.00, 'lespaul.jpg', 15, TRUE, 1, 4),
('D-28', 'Guitare acoustique Martin D-28', 'MAR789', 700.00, 'd28.jpg', 10, TRUE, 2, 4),
('P-125', 'Piano numérique Yamaha P-125', 'YAM456', 500.00, 'p125.jpg', 12, TRUE, 4, 1),
('Minilogue', 'Synthétiseur Korg Minilogue', 'KOR321', 600.00, 'minilogue.jpg', 8, TRUE, 5, 5);

-- Commandes (5 lignes)
INSERT INTO commandes (id_client, date_commande, reduction, total_ht, etat, adresse_livraison, adresse_facturation) VALUES
(1, '2024-05-01 10:00:00', 0, 540.00, 'en cours', '10 rue Musique, Paris', '10 rue Musique, Paris'),
(2, '2024-05-02 14:00:00', 5.00, 990.00, 'livrée', '55 avenue Pro, Lyon', '55 avenue Pro, Lyon'),
(3, '2024-05-03 11:30:00', 0, 840.00, 'en cours', '20 rue Jazz, Toulouse', '20 rue Jazz, Toulouse'),
(4, '2024-05-04 15:45:00', 10.00, 1300.00, 'livrée', '5 rue des Sons, Bordeaux', '5 rue des Sons, Bordeaux'),
(5, '2024-05-05 09:20:00', 0, 600.00, 'en cours', '33 rue Rythm, Lille', '33 rue Rythm, Lille');

-- Lignes de commande (6 lignes)
INSERT INTO lignes_commande (id_commande, id_produit, quantite, prix_unitaire) VALUES
(1, 1, 1, 540.00),
(2, 4, 2, 495.00),
(3, 3, 1, 840.00),
(4, 2, 2, 650.00),
(4, 5, 1, 600.00),
(5, 5, 1, 600.00);

-- Factures (3 lignes pour les commandes livrées)
INSERT INTO factures (id_commande, date_facture, montant_ht, mode_paiement, date_paiement) VALUES
(2, '2024-05-03 09:00:00', 990.00, 'virement', '2024-05-10 12:00:00'),
(4, '2024-05-06 13:00:00', 1300.00, 'chèque', '2024-05-12 10:00:00'),
(3, '2024-05-04 09:00:00', 840.00, 'carte', '2024-05-04 09:05:00');

-- Livraisons (5 lignes)
INSERT INTO livraisons (id_commande, date_livraison, statut) VALUES
(2, '2024-05-04 15:00:00', 'livré'),
(3, '2024-05-04 16:00:00', 'livré'),
(4, '2024-05-06 10:00:00', 'livré'),
(5, '2024-05-07 10:30:00', 'en cours'),
(1, '2024-05-02 10:30:00', 'en cours');

-- Lignes de livraison (5 lignes)
INSERT INTO lignes_livraison (id_livraison, id_produit, quantite) VALUES
(1, 4, 2),
(2, 3, 1),
(3, 2, 2),
(4, 5, 1),
(5, 1, 1);
