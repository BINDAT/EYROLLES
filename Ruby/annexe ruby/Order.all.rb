Order.find(:all, :conditions => "name = 'dave'") do |order| # Trouve tous les ordres dont le nom est 'dave'
  puts order.amount # Affiche le montant de tous les ordres dont le nom est 'dave'
end # Affiche le montant de tous les ordres dont le nom est 'dave'