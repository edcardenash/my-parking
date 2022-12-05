class Review < ApplicationRecord
  belongs_to :user
  belongs_to :parking

  validates :comment, presence: true, length: { minimum: 10 }
  validates :rating, presence: true, numericality: true, length: { in: 1..5 }
end
