class Ciudad < ApplicationRecord
    has_many :hoteles

    before_validation :capitalizar_nombre

    validates :nombre, presence: true
    validates :nombre, uniqueness: true

    private
    def capitalizar_nombre
        self.nombre = self.nombre.split(" ").map(&:capitalize).join(" ")
    end
end
