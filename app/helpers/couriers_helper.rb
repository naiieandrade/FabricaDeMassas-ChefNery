module CouriersHelper
	def List_all_orders_from(courier)
		orders = Order.where(:courier_id => courier.id).all
		orders = orders.map { |f| f.shippment_address }
	end

	def Change_status(courier)
		if courier.status == "idle"
			Courier.find_by_id(courier.id).update_attribute(:status, :delivering) 
		else
			Courier.find_by_id(courier.id).update_attribute(:status, :idle)
		end
	end
end
