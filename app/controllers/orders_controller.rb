class OrdersController < ApplicationController

	def index
		@order_status = OrderStatus.all
		@orders = Order.all
		if logged_in? and is_administrator(current_user)
			@orders = sort_orders
		end
	end

	# def show
	# end

	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		@order.order_items = current_order.order_items
		@order.user = current_user
		if @order.save
			redirect_to '/products'

		else
			flash[:error] = "Ocorreu um erro, tente novamente"
			render :new	
		end
	end

	def update
		if current_order.update(order_params)

			if current_order.payment_mode == "Cartão de Crédito"
				redirect_to :controller => 'credit_card_payments', :action => 'new'
			else
				redirect_to :controller => 'bank_billet_payments', :action => 'new'
			end
			
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
