class AddTypeToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :type_ingredient, :string
  end
end
