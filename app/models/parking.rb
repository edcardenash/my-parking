class Parking < ApplicationRecord
  belongs_to :city
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true, numericality: true
  validates :description, presence: true
  validates :covered, inclusion: { in: [true, false] }
  validates :vehicle_type, presence: true
  validates :rented, inclusion: { in: [true, false] }
end
