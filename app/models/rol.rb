class Rol < ApplicationRecord
    has_many :usuarios

    before_validation :capitalizar_nombre

    validates :rol, presence: true
    validates :rol, uniqueness: true

    private
  def capitalizar_nombre
      self.nombre = self.nombre.split(" ").map(&:capitalize).join(" ")
  end
end