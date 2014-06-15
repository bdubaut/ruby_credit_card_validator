class CreditCard
	attr_accessor :ccnumber, :starts_with, :length

	#
	# Checks if the card number is valid using Luhn's Algorithm
	#
	#
	# @return [Boolean]
	#
	def check_luhn
	  s1 = 0
	  s2 = 0
	  self.ccnumber.to_s.reverse.chars.each_slice(2) do |odd, even|
	    s1 += odd.to_i

	    double = even.to_i * 2
	    double -= 9 if double >= 10
	    s2 += double
	  end
	  (s1 + s2) % 10 == 0
	end


	#
	# Checks the start of the card number (@see Visa, Amex or Discover)
	#
	#
	# @return [Boolean]
	#
	def check_start
		self.ccnumber.strip.start_with? *@starts_with
	end

	#
	# checks the length of the card number
	#
	#
	# @return [Boolean]
	#
	def check_length
		self.length.include?(self.ccnumber.strip.delete(' ').length)
	end

	#
	# Checks the card type (@see Visa or other Children)
	#
	#
	# @return [Boolean]
	#
	def check_card_type
		self.check_start && self.check_length
	end
end

