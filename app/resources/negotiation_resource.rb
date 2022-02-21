class NegotiationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :buyer_id, :integer
  attribute :seller_id, :integer
  attribute :item_id, :integer
  attribute :completed, :boolean

  # Direct associations

  belongs_to :item

  belongs_to :buyer,
             resource: UserResource

  # Indirect associations

end
