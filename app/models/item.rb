require "open-uri"
class Item < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_base64_uploader :image, ImageUploader

  # Direct associations

  belongs_to :category

  has_many   :transactions,
             class_name: "Negotiation",
             dependent: :destroy

  has_many   :recommendations,
             dependent: :destroy

  belongs_to :user,
             foreign_key: "seller_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    id
  end
end
