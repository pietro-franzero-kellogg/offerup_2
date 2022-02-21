class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.text :description
      t.integer :seller_id
      t.string :image
      t.string :location
      t.integer :category_id
      t.boolean :available

      t.timestamps
    end
  end
end
