class Tour < ApplicationRecord
  belongs_to :agency
  has_many :bookings
  has_many :comments
  validates :title_tour, presence: true
  validates :destination, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
