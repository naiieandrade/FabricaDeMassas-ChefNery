class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  helper_method :get_cost

  # GET /products
  def index
    #set_current_order
    @products = Product.search(params[:find])
    @order_item = current_order.order_items.new
    
  end

  # GET /products/1
  def show
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
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:title, :description, :category, :price, :quantity, {ingredient_ids: []})
    end
end
