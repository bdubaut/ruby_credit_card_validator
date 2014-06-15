class Visa < CreditCard

	def initialize
		@starts_with = ["4"]
		@length = [13, 16]
	end

end