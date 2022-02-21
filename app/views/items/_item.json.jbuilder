json.extract! item, :id, :name, :price, :description, :seller_id, :image,
              :location, :category_id, :available, :created_at, :updated_at
json.url item_url(item, format: :json)
