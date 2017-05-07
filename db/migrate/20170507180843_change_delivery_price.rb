class ChangeDeliveryPrice < ActiveRecord::Migration
  def change
  	change_column :orders, :delivery_price, :decimal, precision: 8, scale: 2, default: 10
  end
end
