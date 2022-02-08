class Tour < ApplicationRecord
  belongs_to :agency
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :comments
  has_many_attached :photos

  validates :title_tour, presence: true
  validates :destination, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
