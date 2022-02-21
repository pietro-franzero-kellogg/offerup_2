class AddItemReferenceToNegotiations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :negotiations, :items
    add_index :negotiations, :item_id
    change_column_null :negotiations, :item_id, false
  end
end
