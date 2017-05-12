class OrderItemsController < ApplicationController
  def create
    @order = current_order
    if(!@order.nil?)
      @order_item = @order.order_items.new(order_item_params)
      @order.save
      session[:order_id] = @order.id
    end
    redirect_to "/products"
    set_session_order(@order)
  end

  def update
    if !current_order.nil?
      @order = current_order
      @order_item = @order.order_items.find(params[:id])
      @order_item.update_attributes(order_item_params)
      @order_items = @order.order_items
    end
  end

  def destroy
    if !current_order.nil?
      @order = current_order
      @order_item = @order.order_items.find(params[:id])
      @order_item.destroy
      @order_items = @order.order_items
    end
  end


private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
