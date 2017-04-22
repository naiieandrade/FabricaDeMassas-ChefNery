class OrdersController < ApplicationController
  def index
		@orders = Order.all
  end

	def show
	end

  def new
		@order = Order.new
  end

	def create
		@order = Order.create(order_params)
		@order.order_items = current_order.order_items
		@order.user = current_user
    order_status = OrderStatus.find(1)
    puts order_status.id
    @order.order_status = order_status
		if @order.save
			
			current_order.order_items.each do |order_item|
				order_item.destroy
			end

			flash[:success] = "Pedido realizado com sucesso"
			redirect_to root_path
		
		else
			flash[:error] = "Ocorreu um erro, tente novamente"
			render :new	
		end
	end

	def destroy
		@order = Order.find params[:id]
		@order.destroy
		redirect_to orders_path
	end

	private

		def order_params
			params.require(:order).permit(:shippment_address)
		end

end
