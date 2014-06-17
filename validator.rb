require "./credit_card"


cc = CreditCard.instance

puts "Enter card number : "
while entry = STDIN.gets
  break if entry.chomp == 'quit'
  cc.ccnumber = entry
  p cc.get_card_type
end

