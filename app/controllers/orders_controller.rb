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
		@order = Order.create
		set_session_order(@order)
		current_order
		current_order.user = current_user
		order_status = OrderStatus.find(1)
		current_order.order_status = order_status
		if current_order.save
			#flash[:success] = "Pedido realizado com sucesso"
			redirect_to '/products'
		
		else
			flash[:error] = "Ocorreu um erro, tente novamente"
			render :new	
		end
	end

	def update
        if current_order.update(order_params)
            flash[:success] = "Pedido atualizado"
            redirect_to root_path
            destroy_session_order
        else
          render 'edit'
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
