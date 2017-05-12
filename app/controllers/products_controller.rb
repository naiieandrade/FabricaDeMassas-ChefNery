class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :update, :destroy]
  helper_method :get_cost

  # GET /products
  def index
    if !current_user.nil?
      @order = Order.new(:user_id => current_user.id, :order_status_id => 1)
      set_session_order(@order)
      @products = Product.search(params[:find])
      @order_item = current_order.order_items.new
    else
      redirect_to root_path
    end
  end

  # GET /products/1
  def show
   @reviews = Review.where(product_id: @product.id).order("created_at DESC")

   if @reviews.blank?
    @avg_review = 0
  else
    @avg_review = @reviews.average(:rating).round(2)
  end

end

  # GET /products/new
  def new
    @product = Product.new
    # ingredients_ids = @product.ingredients
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'O Produto foi criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'O produto foi atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'O produto foi deletado.'
  end

  def italian_culinary
    redirect_to :controller => 'products', :action => 'show_category', :category_desc => 0
  end

  def oriental_culinary
    redirect_to :controller => 'products', :action => 'show_category', :category_desc => 1
  end

  def arabic_culinary
    redirect_to :controller => 'products', :action => 'show_category', :category_desc => 2
  end

  def brazilian_culinary
    redirect_to :controller => 'products', :action => 'show_category', :category_desc => 3
  end

  def show_category
    if logged_in?
      if @current_order.nil?
        @order = Order.new(:user_id => current_user.id, :order_status_id => 1)
        set_session_order(@order)
        @order_item = current_order.order_items.new
        if params[:category_desc] != nil
          @products = Product.all.where(:category => params[:category_desc])
        else
         redirect_to root_path
       end
     else
      @order_item = current_order.order_items.new
      if params[:category_desc] != nil
        @products = Product.all.where(:category => params[:category_desc])
      else
        redirect_to root_path
      end
    end
  else
    @products = Product.all.where(:category => params[:category_desc])
  end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:title, :description, :category, :price, :quantity, {ingredient_ids: []}, :imageproduct)
    end

    def check_admin
      if is_administrator(current_user)
        # do nothing
      else
        redirect_to root_path
      end 
    end
  end

