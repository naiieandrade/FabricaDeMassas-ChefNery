class CreateJoinTableIngredientRecipe < ActiveRecord::Migration
  def change
	  create_join_table :ingredients, :products do |t|
	    t.index [:ingredient_id, :product_id]
	    t.index [:product_id, :ingredient_id]
	  end
	  add_foreign_key :ingredients_products, :ingredients
	  add_foreign_key :ingredients_products, :products
	end
end
