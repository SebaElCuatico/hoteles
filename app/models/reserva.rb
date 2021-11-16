class Reserva < ApplicationRecord
  belongs_to :habitacion
  belongs_to :usuario

  validates :fecha_ingreso, presence: true
  validates :fecha_salida, presence: true
end
