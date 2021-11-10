class HotelesController < ApplicationController

    before_action :asignar_hotel, only: [:editar, :actualizar, :eliminar, :mostrar]

    def crear
        @hotel = Hotel.new
        @ciudades = Ciudad.all
        @texto = "Crear"

        if params[:id_ciudad] 
            @hotel.ciudad_id = params[:id_ciudad]
        end
    end

    def guardar
        @hotel = Hotel.new(params_hotel)
        if @hotel.save
            redirect_to hoteles_path
        else
            @ciudades = Ciudad.all
            @texto = "Crear"
            render :crear
        end
    end

    def actualizar
        @hotel.nombre = params_hotel[:nombre]
        @hotel.estrellas = params_hotel[:estrellas]
        @hotel.ciudad_id = params_hotel[:ciudad_id]
        if @hotel.save
            redirect_to hoteles_path
        else
            @ciudades = Ciudad.all
            @texto = "Actualizar"
            render :editar
        end                
    end

    def editar
        @ciudades = Ciudad.all
        @texto = "Actualizar"
    end

    def mostrar
        @lista_hoteles = Hotel.all
    end

    def listar
        @lista_hoteles = Hotel.all
    end 

    def eliminar
        @hotel.destroy
        redirect_to hoteles_path
    rescue
        flash[:error_hotel] = "No se puede elimiar el hotel #{@hotel.nombre} porque exite una habitación ahí"
        redirect_to hoteles_path
    end


    private
    def params_hotel
        return params.require(:hotel).permit(:nombre, :estrellas, :ciudad_id)
    end

    def asignar_hotel
        @hotel = Hotel.find_by(id: params[:id])
        puts "ANTES ASIGNAR UN HOTEL".center(50, "🚥")
    end
end
