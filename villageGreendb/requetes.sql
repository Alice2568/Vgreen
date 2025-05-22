USE VILLAGEGREEN;
--requetes CA mois par mois pour une année selectionnée
SELECT
    YEAR(c.date_archivage) AS annee,
    MONTH(c.date_archivage) AS mois,
    SUM(p.PrixHt * ct.quantité) AS chiffre_affaires
FROM
    commande c
JOIN
    contient ct ON c.Id_commande = ct.Id_commande
JOIN
    Produit p ON ct.Id_Produit = p.Id_Produit
GROUP BY
    YEAR(c.date_archivage),
    MONTH(c.date_archivage)
ORDER BY
    annee, mois;

--requete CA pour un fournisseur
SELECT
    `Id_fournisseur`,
    SUM(p.PrixHt * ct.quantité) AS chiffre_affaires
FROM
    commande c
JOIN
    contient ct ON c.Id_commande = ct.Id_commande
JOIN
    Produit p ON ct.Id_Produit = p.Id_Produit
GROUP BY
    `Id_fournisseur`
ORDER BY
   `Id_fournisseur` ;
--TOP 10 des produits les plus commandés pour une année sélectionnée(référence et nom du produit, quantité commandée, fournisseur)
SELECT * FROM Produit JOIN contient ON contient.Id_Produit = Produit.Id_Produit GROUP BY Nom ORDER BY contient.quantité DESC LIMIT 10;
--TOP 10 des produits les plus rémunérateurs pour une année sélectionnée (référence et nom du produit, marge, fournisseur)
SELECT * FROM Produit JOIN contient ON contient.Id_Produit = Produit.Id_Produit GROUP BY Nom ORDER BY contient.quantité DESC LIMIT 10;
--Top 10 des clients en nombre de commandes ou chiffre d'affaires
--commandes
SELECT cp.nom, cp.Id_client_particulier, COUNT(c.Id_commande) AS nb_commande FROM commande c JOIN client_particulier cp ON cp.Id_client_particulier= c.Id_client_particulier GROUP BY cp.Id_client_particulier ORDER BY nb_commande DESC LIMIT 10;
SELECT cp.nom, cp.Id_client, COUNT(c.Id_commande) AS nb_commande FROM commande c JOIN client_Pro cp ON cp.Id_client= c.Id_client GROUP BY cp.Id_client ORDER BY nb_commande DESC LIMIT 10;

--CA

SELECT cp.nom, cp.Id_client, SUM(p.PrixHt * ct.quantité) AS chiffre_affaires
FROM
    commande c
JOIN
    contient ct ON c.Id_commande = ct.Id_commande
JOIN
    Produit p ON ct.Id_Produit = p.Id_Produit
JOIN
    client_Pro cp ON c.Id_client = cp.Id_client;

SELECT cp.nom, cp.Id_client_particulier, SUM(p.PrixHt * ct.quantité) AS chiffre_affaires
FROM
    commande c
JOIN
    contient ct ON c.Id_commande = ct.Id_commande
JOIN
    Produit p ON ct.Id_Produit = p.Id_Produit
JOIN
    client_particulier cp ON c.Id_client_particulier = cp.Id_client_particulier;    

--Répartition du chiffre d'affaires par type de client

--Nombre de commandes en cours de livraison.