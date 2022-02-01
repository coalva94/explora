class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  has_many :reviews
end
