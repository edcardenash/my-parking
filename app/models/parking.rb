class Parking < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :global_search, against: [:city_id.to_s],
    associated_against: { city: [:name] },
    using: { tsearch: { prefix: true } }

  belongs_to :city
  belongs_to :user

  has_one_attached :photo

  has_many :reviews, dependent: :destroy
  has_one :rentals, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true, numericality: true
  validates :description, presence: true
  validates :covered, inclusion: { in: [true, false] }
  validates :vehicle_type, presence: true
  validates :rented, inclusion: { in: [true, false] }
end
