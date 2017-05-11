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
		@order = Order.create
		set_session_order(@order)
		current_order.user = current_user
		order_status = OrderStatus.find(1)
		current_order.order_status = order_status
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

    def update_status
    	@order = Order.find(params[:order_id])
    	@order_status = OrderStatus.find(params[:order_status_id])
    	@order.order_status = @order_status
  		@order.save!
  		flash[:success] = "Pedido atualizado"
  		redirect_to orders_path
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
