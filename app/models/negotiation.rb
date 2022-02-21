class Negotiation < ApplicationRecord
  # Direct associations

  belongs_to :buyer,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    buyer.to_s
  end

end
