class CreateReviewHistories < ActiveRecord::Migration
  def change
    create_table :review_histories do |t|
      t.integer :version_number
      t.integer :versions, array: true, default: '{}'
    end
  end
end
