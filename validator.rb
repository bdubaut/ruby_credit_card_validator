require "./app/credit_card"
require "./app/amex"
require "./app/visa"
require "./app/discover"
require "./app/mastercard"


amex = Amex.new
discover = Discover.new
mastercard = Mastercard.new
visa = Visa.new

puts "Enter card number : "
while entry = STDIN.gets
  break if entry.chomp == 'quit'
  array = [amex, discover, mastercard, visa]
  array.each do |c|
  	c.ccnumber = entry.strip
  	if c.check_card_type
  		message = c.check_luhn ? 'valid' : 'invalid'
  		p "#{c.class.name}: #{c.ccnumber} #{message}"
  		break
  	end
  end
end

