--vues: jointure Produits -Fournisseurs
CREATE VIEW Jointure_p_f AS
SELECT 
    p.id_produit, p.libelle_court, p.ref_fournisseur, p.prix_achat, p.photo, p.id_fournisseur, p.id_sousrubrique, f.nom, f.email, f.tel
FROM produits p 
JOIN fournisseurs f ON f.id_fournisseur = p.id_fournisseur ;
--vues: Produits- Catégorie/Sous catégorie
CREATE VIEW Jointure_p_rub AS
SELECT 
    p.id_produit, p.libelle_court, p.ref_fournisseur, p.prix_achat, p.photo, p.id_fournisseur, p.id_sousrubrique, ss.nom AS nom_ssrubrique, r.nom AS nom_rubrique
FROM produits p 
JOIN sous_rubriques ss ON ss.id_sousrubrique = p.id_sousrubrique 
JOIN rubriques r ON r.id_rubrique= ss.id_rubrique ;