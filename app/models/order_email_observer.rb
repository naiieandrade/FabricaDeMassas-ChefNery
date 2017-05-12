class OrderEmailObserver < ActiveRecord::Observer
	observe :order
	
	def after_commit(order)
		if !order.shippment_address.nil?
			OrderEmail.order_request(order.user, order).deliver
        	OrderEmail.order_confirmation(order.user, order).deliver
        end
	end
end
