class CreateIngredientFactories < ActiveRecord::Migration
  def change
    create_table :ingredient_factories do |t|
      
      t.timestamps null: false
    end
  end
end
