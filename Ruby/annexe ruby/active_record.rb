require 'active_record' # 1. require 'active_record' pour utiliser ActiveRecord
class Order < ActiveRecord::Base # 2. définir une classe Order qui hérite de ActiveRecord::Base
end # 3. créer une instance de Order, modifier son attribut discount et sauvegarder les changements
order = Order.find(1) # 4. trouver une commande avec l'id 1
order.discount = 0.5 # 5. modifier l'attribut discount de la commande
order.save # 6. sauvegarder les changements dans la base de données