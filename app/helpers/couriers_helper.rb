module CouriersHelper
	def List_all_orders_from(courier)
		
		Order.find(:all,:conditions => {:courier_id => courier.id})

	end
end
