class Parking < ApplicationRecord
  include PgSearch::Model
  belongs_to :city
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true, numericality: true
  validates :description, presence: true
  validates :covered, inclusion: { in: [true, false] }
  validates :vehicle_type, presence: true
  validates :rented, inclusion: { in: [true, false] }

  pg_search_scope :global_search, against: [:city_id.to_s],
                  associated_against: { city: [:name] },
                  using: { tsearch: { prefix: true } }
end
