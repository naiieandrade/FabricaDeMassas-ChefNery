module OrderItemsHelper

	def current_order_item
		if !session[:order_items].nil?
			@current_order_item = session[:order_items]
		end
	end

	def set_current_order_item(order_item)
		session[:order_items] = order_item
	end

	def current_order_item?
		!session[:order_items].nil?
	end

end
