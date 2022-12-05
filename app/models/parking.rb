class Parking < ApplicationRecord
  belongs_to :city
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true
  validates :description, presence: true
  validates :covered, presence: true
  validates :vehicle_type, presence: true
end
