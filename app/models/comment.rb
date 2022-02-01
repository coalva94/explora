class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  validates :question, presence: true, length: { minimum: 10 }
  validates :answer, presence: true, length: { minimum: 10 }
end
