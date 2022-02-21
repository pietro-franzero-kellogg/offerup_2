class AddBuyerReferenceToNegotiations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :negotiations, :users, column: :buyer_id
    add_index :negotiations, :buyer_id
    change_column_null :negotiations, :buyer_id, false
  end
end
