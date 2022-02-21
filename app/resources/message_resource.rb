class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :negotiation_id, :integer
  attribute :message, :string
  attribute :sender_id, :integer
  attribute :receiver_id, :integer

  # Direct associations

  belongs_to :sender,
             resource: UserResource

  # Indirect associations

end
