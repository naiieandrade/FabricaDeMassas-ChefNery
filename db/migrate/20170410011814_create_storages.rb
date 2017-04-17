class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.integer :product_unit

      t.timestamps null: false
    end
  end
end
