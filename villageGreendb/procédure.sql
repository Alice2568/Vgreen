--procédure : commandes non soldées ( en cours de livraison)
DELIMITER $$

CREATE PROCEDURE commande_en_cours()
BEGIN
SELECT COUNT(*) AS nb_commandes_en_cours
FROM commandes c
WHERE c.etat = 'en cours';
END$$

DELIMITER ;

--procédure: délai moyen entre la date de commande et la date de facturation
DELIMITER $$

CREATE PROCEDURE delai_moyen_facturation()
BEGIN
SELECT 
    AVG(DATEDIFF(l.date_livraison, c.date_commande)) AS delai_moyen_jours
FROM 
    commandes c
JOIN 
    livraisons l ON c.id_commande = l.id_commande;
END$$

DELIMITER ;