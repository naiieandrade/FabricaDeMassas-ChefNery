class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
			t.text :shippment_address
			t.float :amount
			t.integer :products_number	
      t.timestamps null: false
    end
  end
end
