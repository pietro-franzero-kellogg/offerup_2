class CreateNegotiations < ActiveRecord::Migration[6.0]
  def change
    create_table :negotiations do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :item_id
      t.boolean :completed

      t.timestamps
    end
  end
end
