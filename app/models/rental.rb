class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :parking
  # validates :start_date, presence: true, comparison: { greater_than_or_equal_to: :end_date }
  validates :end_date, presence: true
  validates :total_amount, presence: true, numericality: true
end
