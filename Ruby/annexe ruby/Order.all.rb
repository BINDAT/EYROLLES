Order.find(:all, :conditions => "name = 'dave'") do |order|
  puts order.amount
end