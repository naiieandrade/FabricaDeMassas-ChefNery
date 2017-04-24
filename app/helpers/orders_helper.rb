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

	def change_order_status
		@order = Order.find(params[:id])
		@order.order_status = OrderStatus.find(params[:order_status_id])
		last_status = @order.order_status

	end

	def sort_orders
		orders = Order.all
		orders.order(:order_status_id)
	end


end
