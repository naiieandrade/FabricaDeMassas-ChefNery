module OrdersHelper

	def current_order
	    @current_order ||= Order.find_by(id: session[:order_id])
	end

	def set_session_order(order)
		session[:order_id] = order.id
	end

	def current_order?
	  !current_order.nil?
	end

	def destroy_session_order
		session.delete(:order_id)
		@current_order = nil
	end

	#def set_current_order
	#	@order = Order.create
	#	set_session_order(@order)
	#	current_order
	#	current_order.user = current_user
	#	order_status = OrderStatus.find(1)
	#	current_order.order_status = order_status
	#	current_order.save!
	#end
end
