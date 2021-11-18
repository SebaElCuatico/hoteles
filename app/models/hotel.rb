class Hotel < ApplicationRecord
  belongs_to :ciudad
  has_many :habitaciones
  has_one_attached :foto_portada
  
  before_validation :capitalizar_nombre
  
  validates :nombre, presence: true
  validates :estrellas, presence: true
  validates :ciudad_id, presence: true
  
  private
  def capitalizar_nombre
      self.nombre = self.nombre.split(" ").map(&:capitalize).join(" ")
  end
end