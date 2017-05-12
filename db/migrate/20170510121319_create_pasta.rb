class CreatePasta < ActiveRecord::Migration
  def change
    create_table :pasta do |t|

      t.timestamps null: false
    end
  end
end
