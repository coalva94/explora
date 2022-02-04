class Agency < ApplicationRecord
  belongs_to :user
  has_many :tours
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :tax_number, presence: true, uniqueness: true
  validates :address, presence: true
  validates :state, presence: true

end
