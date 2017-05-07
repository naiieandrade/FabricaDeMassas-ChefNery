module CouriersHelper
	def List_all_orders_from(courier)
		orders = Order.where(:courier_id => courier.id).all
		orders = orders.map { |f| [User.find(f.user_id).name, f.shippment_address]}
	end

	def Change_status(courier)
		if courier.status == "idle"
			Courier.find_by_id(courier.id).update_attribute(:status, :delivering) 
		else
			Courier.find_by_id(courier.id).update_attribute(:status, :idle)
		end
	end

	def list_all_orders
		orders = Order.where(:courier_id => nil)

		orders.map{|order| [User.find(order.user_id).name, order]}
	end
end
