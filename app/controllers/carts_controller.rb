class CartsController < ApplicationController
	before_action :logged_in_user
  def show
   	@order_items = current_order.order_items
		@order = Order.new
  end
end
