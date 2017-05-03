class AddImageproductToProduct < ActiveRecord::Migration
  def change
    add_column :products, :imageproduct, :string
  end
end
