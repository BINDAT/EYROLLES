order = Order.find(1) # Trouve l'ordre avec l'ID 1
puts "Order #{order.client_id}, amount=#{order.amount}" # Affiche les détails de l'ordre