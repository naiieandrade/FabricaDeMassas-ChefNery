class CreateFillings < ActiveRecord::Migration
  def change
    create_table :fillings do |t|

      t.timestamps null: false
    end
  end
end
