--vues: jointure Produits -Fournisseurs
CREATE VIEW Joint_p_f AS
SELECT p.Id_Produit, p.Nom, p.Ref_Fournisseur, p.PrixHA, p.PrixHt, p.image, p.Id_fournisseur, p.Id_sous_rubrique FROM Produit p JOIN fournisseur f ON f.Id_fournisseur = p.Id_fournisseur ;
--vues: Produits- Catégorie/Sous catégorie
CREATE VIEW Joint_p_r AS
SELECT p.Id_Produit, p.Nom, p.Ref_Fournisseur, p.PrixHA, p.PrixHt, p.image, p.Id_fournisseur, p.Id_sous_rubrique, r.Id_rubrique FROM Produit p JOIN sous_rubrique ss ON ss.Id_sous_rubrique = p.Id_sous_rubrique JOIN rubrique r ON r.Id_rubrique= ss.Id_rubrique ;