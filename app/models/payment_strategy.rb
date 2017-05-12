class PaymentStrategy < ActiveRecord::Base

	def api_access
		raise 'Abstract method called'
	end

end
