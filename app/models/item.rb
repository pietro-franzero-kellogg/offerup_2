class Item < ApplicationRecord
  # Direct associations

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
