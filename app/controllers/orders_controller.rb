class OrdersController < ApplicationController
  def show
		@orders = Order.all
  end

  def new
		@order = Order.new
  end

	def create
		@order = Order.create(order_params)
		if @order.save
			flash[:success] = "Pedido realizado com sucesso"
			redirect_to root_path

		else
			flash[:error] = "Ocorreu um erro, tente novamente"
			render :new	
		end
	end

	private

		def order_params
			params.require(:order).permit(:shippment_address)
		end

end
