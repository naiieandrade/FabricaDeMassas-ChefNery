class AddRelationsOrderCourier < ActiveRecord::Migration
  def change
  	add_column :orders, :courier_id, :integer, null: true
  end
end
