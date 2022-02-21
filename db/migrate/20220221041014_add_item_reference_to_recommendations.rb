class AddItemReferenceToRecommendations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recommendations, :items
    add_index :recommendations, :item_id
    change_column_null :recommendations, :item_id, false
  end
end
