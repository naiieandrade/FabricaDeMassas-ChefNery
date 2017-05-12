class AddOrderIdToPayment < ActiveRecord::Migration
  def change
    add_column :payment_strategies, :order_id, :integer
  end
end
