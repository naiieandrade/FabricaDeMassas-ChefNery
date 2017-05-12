class OrdersController < ApplicationController
  
  def index
  	@order_status = OrderStatus.all
	@orders = Order.all

	if logged_in? and is_administrator(current_user)
		@orders = sort_orders
	end
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
		if current_order.save
			redirect_to '/products'
		
		else
			flash[:error] = "Ocorreu um erro, tente novamente"
			render :new	
		end
	end

	def update
        if current_order.update(order_params)
            flash[:success] = "Pedido atualizado"
           	redirect_to '/invoices/create'
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
			params.require(:order).permit!
		end

end
