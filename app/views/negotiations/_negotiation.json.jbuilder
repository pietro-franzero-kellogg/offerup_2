json.extract! negotiation, :id, :buyer_id, :seller_id, :item_id, :completed,
              :created_at, :updated_at
json.url negotiation_url(negotiation, format: :json)
