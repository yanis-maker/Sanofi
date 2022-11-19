-- Proposez 10 requêtes analytiques correspondant aux traitements que vous avez indiqués.

-- 1 La qantite de produit fabrique et le cout totale de fabrication par jour et par produit
SELECT Date_.date_fin, id_produit, sum(quantite), sum(cout_fabrication)
    FROM Production, Date_
    WHERE Production.id_date = Date_.id_date and type_operatyion LIKE "fabrication"
    GROUP BY id_produit, Date_.date_fin;

-- 2 Le nombre de produit perdu par jour
SELECT id_produit, Date_.date_fin, sum(quantite)
    FROM Production, Date_
    WHERE Production.id_date = Date_.id_date and type_operatyion LIKE "perte"
    GROUP BY id_produit, Date_.date_fin;

-- 4 Le cout totale de perte par jour
SELECT id_produit, Date_.date_fin, sum(cout_fabrication)
    FROM Production, Date_
    WHERE Production.id_date = Date_.id_date and type_operatyion LIKE "perte"
    GROUP BY id_produit, Date_.date_fin;

-- 5 Le nombre de produit livre par jour
SELECT id_produit, Date_.date_fin, sum(quantite)
    FROM Production, Date_
    WHERE Production.id_date = Date_.id_date and type_operatyion LIKE "livraison"
    GROUP BY id_produit, Date_.date_fin;

-- 6 Le cout totale de perte par jour
SELECT id_produit, Date_.date_fin, sum(cout_fabrication)
    FROM Production, Date_
    WHERE Production.id_date = Date_.id_date and type_operatyion LIKE "livraison"
    GROUP BY id_produit, Date_.date_fin;

-- 7 La duree moyenne de fabrication d'un produit 
SELECT id_produit, AVG(DATEDIFF(Date_.date_fin, Date_.date_debut))
    FROM Production, Date_
    WHERE Production.id_date = Date_.id_date and type_operatyion LIKE "fabrication"
    GROUP BY id_produit;

-- 8 La quantite de produit livre par chaque prestattaire depuis le debut de l'annee
SELECT Production.id_prestataire, sum(quantite)
    FROM Production, Prestataire, Date_ 
    WHERE (Production.id_prestataire = Prestataire.id_prestataire and type_operatyion LIKE "livraison") and Date_.date_debut >= "01/01/2022"
    GROUP BY id_prestataire;


-- 9 La quantite de produit livre pour chaque pays
SELECT lieu_arrive, sum(quantite)
    FROM Production, Lieu 
    WHERE (Production.id_prestataire = Prestataire.id_prestataire and type_operatyion LIKE "livraison") and Date_.date_debut >= "01/01/2022"
    GROUP BY id_prestataire;



-- Dans production On ajoute d'autre dimension (type produit(partie des vaccin)(parti des vitamine)(partie comprime .. gelule... liquide))(hierarchie)
-- Dans production on supprime prestataire et type d'operation, time
-- rendre conforme le texte et le datamart

-- DAns stock dimennsion1sd conditionnement
-- DAns stock supprimer quantitesorti

-- Dans le texte, eviter de mettre des infos de vente dans stock, de stock dans production aussi. FAire la difference quoi

-- -- 1 La quantite de produit fabrique par jour et par produit
-- SELECT id_produit, Date_.date_fin, sum(quantite)
--     FROM Production, Date_
--     WHERE Production.id_date = Date_.id_date and type_operatyion LIKE "fabrication"
--     GROUP BY id_produit, Date_.date_fin;

-- -- 2 Le cout totale de fabrication par jour
-- SELECT id_produit, Date_.date_fin, sum(cout_fabrication)
--     FROM production, Date_
--     WHERE Production.id_date = Date_.id_date and type_operatyion LIKE "fabrication"
--     GROUP BY id_produit, Date_.date_fin;
