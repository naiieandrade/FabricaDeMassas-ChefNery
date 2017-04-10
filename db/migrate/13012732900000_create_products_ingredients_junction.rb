class CreateProductsIngredientsJunction < ActiveRecord::Migration
  def change
    create_table :ingredients_products, id: false do |t|
     t.belongs_to :product, index: true
     t.belongs_to :ingredient, index: true
   end
  end
end
