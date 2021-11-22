class HabitacionesController < ApplicationController
    before_action :validar_sesion_administrador    
    before_action :asignar_habitacion, only: [:editar, :actualizar, :eliminar, :mostrar]

    def crear
        @habitacion= Habitacion.new
        @hoteles= Hotel.all
        @texto = "Crear"
    end

    def guardar
        @habitacion = Habitacion.new(params_habitacion)
        if @habitacion.save
            redirect_to habitaciones_path
        else
            @hoteles = Hotel.all
            @texto = "Crear"
            render :crear
        end
    end

    def mostrar
    end

    # GET /habitaciones
    def listar
        @lista_habitaciones = Habitacion.includes(:hotel)
    end

     # GET /habitaciones/:id/editar
     def editar
        @hoteles = Hotel.all
        @texto = "Actualizar"
     end
    
     # PATH /habitaciones/:id
    def actualizar
        @habitacion.nombre = params_habitacion[:nombre]
        @habitacion.esta_reservada = params_habitacion[:esta_reservada]
        @habitacion.precio = params_habitacion[:precio]
        @habitacion.hotel_id = params_habitacion[:hotel_id]
        @habitacion.foto_habitacion = params_habitacion[:foto_habitacion]
        if @habitacion.save
            redirect_to habitaciones_path
        else
            @hoteles = Hotel.all
            @texto = "Actualizar"
            render :editar
        end
    end

     # DELETE /habitaciones/:id
     def eliminar
        @habitacion.destroy
        redirect_to habitaciones_path
    end

    private # Todo lo que está abajo 👇👇 es PRIVADO
    
    # recuperamos el :id de la URL 📦 y lo buscamos en la base de datos
    def asignar_habitacion
        @habitacion = Habitacion.find_by(id: params[:id])
        puts "ANTES ASIGNAR UNA habitacion".center(50, "🚥")
    end

    # extraer los datos del formulario 📦
    def params_habitacion
        return params.require(:habitacion).permit(:nombre, :esta_reservada, :precio, :hotel_id, foto_habitacion: [])
    end
end