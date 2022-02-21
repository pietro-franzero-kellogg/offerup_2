class Negotiation < ApplicationRecord
  # Direct associations

  has_many   :messages,
             :dependent => :destroy

  belongs_to :item

  belongs_to :buyer,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    buyer.to_s
  end

end
