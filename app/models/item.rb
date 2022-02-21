class Item < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :foreign_key => "seller_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    id
  end

end
