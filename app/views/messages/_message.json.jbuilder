json.extract! message, :id, :negotiation_id, :message, :sender_id, :receiver_id, :created_at, :updated_at
json.url message_url(message, format: :json)
