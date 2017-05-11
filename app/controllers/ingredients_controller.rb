require 'ingredient_factory'

class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /ingredients
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  def show
  end

  # GET /ingredients/new
  def new
    #@ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  def create
    factory = IngredientFactory.new
    @ingredient = factory.create_ingredient(params[:ingredient_type].to_s)

    @ingredient.title = params[:title]
    @ingredient.description = params[:desc]
    @ingredient.set_type(params[:ingredient_type])
    
    if @ingredient.save
      redirect_to ingredients_path, notice: 'Ingredient was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path , notice: 'Ingredient was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ingredients/1
  def destroy
    @ingredient.destroy
    redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ingredient_params
      params.require(:ingredient).permit(:title, :price)
    end

    def check_admin
      if is_administrator(current_user)
        # do nothing
      else
        redirect_to root_path
      end
    end
end
