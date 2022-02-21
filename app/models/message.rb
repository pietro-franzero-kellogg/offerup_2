class Message < ApplicationRecord
  # Direct associations

  belongs_to :negotiation

  belongs_to :sender,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    id
  end

end
