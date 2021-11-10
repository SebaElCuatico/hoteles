class Habitacion < ApplicationRecord
  belongs_to :hotel
  has_many :reservas
  has_many :usuarios, through: :reservas

  validates :nombre, presence: true
  validates :precio, presence: true
  validates :hotel_id, presence: true
end
