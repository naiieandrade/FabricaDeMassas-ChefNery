class AddColumnCourier < ActiveRecord::Migration
  def change
  	add_column :couriers, :status, :integer, default: 0
  end
end
