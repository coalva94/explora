class Tour < ApplicationRecord
  belongs_to :agency
  has_many :bookings
  has_many :comments
end
