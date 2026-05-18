Order.find(:all, :conditions => "name= 'dave'") do |order| # Trouve tous les ordres dont le nom est 'dave'
  order.discount = 0.5 # Applique une remise de 50% à tous les ordres dont le nom est 'dave'
  order.save # Enregistre les modifications apportées à chaque ordre dont le nom est 'dave'
end