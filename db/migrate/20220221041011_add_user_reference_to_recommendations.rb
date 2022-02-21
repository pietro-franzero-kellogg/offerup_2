class AddUserReferenceToRecommendations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recommendations, :users
    add_index :recommendations, :user_id
    change_column_null :recommendations, :user_id, false
  end
end
