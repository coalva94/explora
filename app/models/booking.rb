class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  has_many :reviews
  validates :start_date, presence: true
  validates :quantity, presence: true
end
