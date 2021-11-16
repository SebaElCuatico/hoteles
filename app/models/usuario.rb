class Usuario < ApplicationRecord
  has_secure_password
  
  belongs_to :rol
  has_many :reservas
  has_many :habitaciones, through: :reservas

  validates :nombre,          presence: true
  validates :identificacion,  presence: true, uniqueness: true
  validates :telefono,        presence: true
  validates :rol_id,          presence: true
end
