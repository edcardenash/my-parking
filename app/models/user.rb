class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :parkings, dependent: :destroy
  # Dependencia contra rentals, no destructiva para almacenar el historico de rentals
  has_many :rentals
  # Dependencia contra rentals, no destructiva para almacenar el historico de reviews
  has_many :reviews

  belongs_to :city

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }

  validates :phone, length: { minimum: 7 }
  validates :address, length: { minimum: 5 }
end
