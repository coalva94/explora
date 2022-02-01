class Agency < ApplicationRecord
  belongs_to :user
  has_many :tours
end
