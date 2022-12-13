class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :parking
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_amount, presence: true, numericality: true
end
