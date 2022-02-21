class Item < ApplicationRecord
  # Direct associations

  belongs_to :category

  has_many   :transactions,
             :class_name => "Negotiation",
             :dependent => :destroy

  has_many   :recommendations,
             :dependent => :destroy

  belongs_to :user,
             :foreign_key => "seller_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    id
  end

end
