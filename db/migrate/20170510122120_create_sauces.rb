class CreateSauces < ActiveRecord::Migration
  def change
    create_table :sauces do |t|

      t.timestamps null: false
    end
  end
end
