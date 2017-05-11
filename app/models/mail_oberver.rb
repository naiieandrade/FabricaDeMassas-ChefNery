require "#{Rails.root}/app/mailers/order_email.rb" 

class MailObserver  < ActiveRecord::Observer

	observer :order
	
	def after_submit_order(current_user, current_order)
		OrderEmail.order_request(current_user, current_order).deliver
        OrderEmail.order_confirmation(current_user, current_order).deliver
	end


end

