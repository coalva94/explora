class Companion < ApplicationRecord
  belongs_to :booking
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :document_number, length: { is: 8 }
end
