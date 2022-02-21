class ItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :price, :float
  attribute :description, :string
  attribute :seller_id, :integer
  attribute :image, :string
  attribute :location, :string
  attribute :category_id, :integer
  attribute :available, :boolean

  # Direct associations

  has_many   :transactions,
             resource: NegotiationResource

  has_many   :recommendations

  belongs_to :user,
             foreign_key: :seller_id

  # Indirect associations

end
