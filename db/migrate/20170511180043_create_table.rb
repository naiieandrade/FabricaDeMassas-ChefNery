class CreateTable < ActiveRecord::Migration
  def change
    add_reference :products, :ingredients, index: true
    add_reference :ingredients, :products, index: true
  end
end
