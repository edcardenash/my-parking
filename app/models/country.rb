class Country < ApplicationRecord
  has_many :citys, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
