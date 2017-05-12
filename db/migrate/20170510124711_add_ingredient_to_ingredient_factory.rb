class AddIngredientToIngredientFactory < ActiveRecord::Migration
  def change
    add_column :ingredient_factories, :ingredient_id, :integer
  end
end
