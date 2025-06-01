USE VILLAGEGREEN;
--requetes CA mois par mois pour une année selectionnée
SELECT
    YEAR(c.date_commande) AS annee,
    MONTH(c.date_commande) AS mois,
    SUM(lg.prix_unitaire * lg.quantite) AS chiffre_affaires
FROM
    commandes c
JOIN
    lignes_commande lg ON lg.id_commande = c.id_commande
GROUP BY
    YEAR(c.date_commande),
    MONTH(c.date_commande)
ORDER BY
    annee, mois;


--requete CA pour un fournisseur
SELECT
    f.id_fournisseur,
    SUM(lc.prix_unitaire * lc.quantite) AS chiffre_affaires
FROM
    fournisseurs f
JOIN
    produits p ON f.id_fournisseur = p.id_fournisseur
JOIN
    lignes_commande lc ON lc.id_produit = p.id_produit
GROUP BY
    id_fournisseur
ORDER BY
   id_fournisseur;


--TOP 10 des produits les plus commandés pour une année sélectionnée(référence et nom du produit, quantité commandée, fournisseur)
SELECT libelle_court, p.id_produit, p.ref_fournisseur, p.id_fournisseur, c.date_commande, SUM(lc.quantite) AS qte
FROM 
    produits p
JOIN 
    fournisseurs f ON f.id_fournisseur = p.id_fournisseur
JOIN 
    lignes_commande lc ON lc.id_produit = p.id_produit
JOIN commandes c ON c.id_commande= lc.id_commande 
WHERE YEAR(c.date_commande) = 2024
GROUP BY 
    libelle_court
ORDER BY 
    qte DESC LIMIT 10;
--TOP 10 des produits les plus rémunérateurs pour une année sélectionnée (référence et nom du produit, marge, fournisseur)

SELECT libelle_court, p.id_produit, p.ref_fournisseur, p.id_fournisseur, c.date_commande, SUM((lc.quantite*lc.prix_unitaire)-(lc.quantite*p.prix_achat)) AS marge
FROM 
    produits p
JOIN 
    fournisseurs f ON f.id_fournisseur = p.id_fournisseur
JOIN 
    lignes_commande lc ON lc.id_produit = p.id_produit
JOIN commandes c ON c.id_commande= lc.id_commande 
WHERE YEAR(c.date_commande) = 2024
GROUP BY 
    libelle_court
ORDER BY 
    marge DESC LIMIT 10;


--Top 10 des clients en nombre de commandes ou chiffre d'affaires
--commandes
SELECT 
    cl.nom, cl.id_client, COUNT(c.id_commande) AS nb_commande 
FROM commandes c 
JOIN clients cl ON cl.id_client= c.id_client 
GROUP BY cl.id_client ORDER BY nb_commande DESC LIMIT 10;

--CA

SELECT cl.nom, cl.id_client, SUM(p.prix_achat * lc.quantite) AS chiffre_affaires
FROM
    commandes c
JOIN
    clients cl ON cl.id_client = c.id_client
JOIN 
    lignes_commande lc ON lc.id_commande = c.id_commande
JOIN
    produits p ON lc.id_Produit = p.id_Produit
GROUP BY cl.id_client ORDER BY chiffre_affaires DESC LIMIT 10;


--Répartition du chiffre d'affaires par type de client

SELECT cl.nom, cl.id_client, cl.type_client, SUM(p.prix_achat * lc.quantite) AS chiffre_affaires
FROM
    commandes c
JOIN
    clients cl ON cl.id_client = c.id_client
JOIN 
    lignes_commande lc ON lc.id_commande = c.id_commande
JOIN
    produits p ON lc.id_Produit = p.id_Produit
GROUP BY cl.type_client ORDER BY chiffre_affaires DESC LIMIT 10;

--Nombre de commandes en cours de livraison.

SELECT COUNT(*) AS nb_commandes_en_cours
FROM commandes c
WHERE c.etat = 'en cours';


