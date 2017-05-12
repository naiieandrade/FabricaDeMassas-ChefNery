class AddPaymentModeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_mode, :integer
  end
end
