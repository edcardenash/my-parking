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
  has_one_attached :photo
  belongs_to :city
end
