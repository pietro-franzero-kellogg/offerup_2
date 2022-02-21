class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :transactions,
             resource: NegotiationResource,
             foreign_key: :buyer_id

  has_many   :recommendations

  has_many   :items,
             foreign_key: :seller_id

  # Indirect associations

end
