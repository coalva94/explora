class Tour < ApplicationRecord
  belongs_to :agency
  has_many :bookings
  has_many :comments
  has_many_attached :photos
  validates :title_tour, presence: true
  validates :destination, presence: true
  validates :description, presence: true
  validates :price, presence: true
  geocoded_by :destination # Geocoding
  after_validation :geocode, if: :will_save_change_to_destination? # Geocoding
end
