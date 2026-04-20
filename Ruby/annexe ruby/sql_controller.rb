EXEC SQL BEGIN DECLARE SECTION; #inclue la section de déclaration des variables à la compilation de l'application
    int     id; #déclare une variable id de type entier
    float   amount; #déclare une variable amount de type flottant
EXEC SQL END DECLARE SECTION; #indique la fin de la section de déclaration des variables
EXEC SQL DECLARE c1 AS CURSOR FOR # déclare un curseur nommé c1 pour exécuter la requête suivante
select id, amount from orders; #sélectionne les colonnes id et amount de la table orders
while(1) { #boucle infinie pour traiter les résultats du curseur
    float tax; #déclare une variable tax de type flottant pour stocker le résultat du calcul de la taxe
    EXEC SQL WHENEVER NOT FOUND DO break; #indique que lorsque le curseur ne trouve plus de résultats, la boucle doit être interrompue
    EXEC SQL FETCH c1 INTO :id, :amount; #exécute la requête du curseur et stocke les résultats dans les variables id et amount
        tax = calc_sales_tax(amount); #calcule la taxe de vente en appelant une fonction calc_sales_tax avec le montant comme argument
    EXEC SQL UPDATE orders set tax = :tax where id = :id; #met à jour la table orders en définissant la colonne tax avec la valeur calculée pour le montant correspondant à l'id
}
EXEC SQL CLOSE c1; #ferme le curseur c1 après avoir traité tous les résultats
EXEC SQL COMMIT WORK; #valide les modifications apportées à la base de données après avoir mis à jour les taxes pour tous les enregistrements traités