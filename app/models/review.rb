class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :content, presence: true, length: { minimum: 15 }
  validates :rating, presence: true
end
