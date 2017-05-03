class AddDocumentsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :documents, :json
  end
end
