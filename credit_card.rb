require "singleton"
class CreditCard
	include Singleton

	attr_accessor :ccnumber
	attr_reader :card_type

	def initialize
		@card_type = {
		visa: {name: "VISA", length: [13, 16], start: ['4']},
		mastercard: {name: "Mastercard", length: [16], start: ["51", "52", "53", "54", "55"]},
		discover: {name: "Discover", length: [16], start: ['6011']},
		amex: {name: "American Express", length: [15], start: ['34', '37']}
	}
	end

	#
	# Checks if the credit card number is valid
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

	# Returns the type and luhn validity of the credit card
	#
	#
	# @return [String]
	#
	def get_card_type
		self.ccnumber = self.ccnumber.strip.delete(' ')
		case self.ccnumber
		when /^(34)|^(37)/
			check_luhn ? "AMEX: #{self.ccnumber} (valid)" : "AMEX: #{self.ccnumber} (invalid)"
		when /^5[1-5]/
			check_luhn ? "MasterCard: #{self.ccnumber} (valid)" : "MasterCard: #{self.ccnumber} (invalid)"
		when /^4/
			check_luhn ? "VISA: #{self.ccnumber} (valid)" : "VISA: #{self.ccnumber} (invalid)"
		when /^6011/
			check_luhn ? "Discover: #{self.ccnumber} (valid)" : "Discover: #{self.ccnumber} (invalid)"
		else
			check_luhn ? "Unknown: #{self.ccnumber} (valid)" : "Unknown: #{self.ccnumber} (invalid)"
		end
	end
end
