class AddNegotiationReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :negotiations
    add_index :messages, :negotiation_id
    change_column_null :messages, :negotiation_id, false
  end
end
