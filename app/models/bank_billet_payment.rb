require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'

class BankBilletPayment < PaymentStrategy
	belongs_to :order

	def api_access
		digit = rand(100000000000000000000000000000000000000000000000..999999999999999999999999999999999999999999999999)

		return Barby::Code128B.new(digit), digit
	end

end
