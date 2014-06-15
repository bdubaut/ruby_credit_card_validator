class Mastercard < CreditCard
	def initialize
		@starts_with = ["51", "52", "53", "54", "55"]
		@length = [16]
	end
end