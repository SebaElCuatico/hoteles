class CiudadesController < ApplicationController
    before_action :validar_sesion_administrador
    before_action :asignar_ciudad, only: [:editar, :actualizar, :eliminar, :mostrar]

    def crear
        @ciudad= Ciudad.new   
    end

    def guardar
        @ciudad = Ciudad.new
        @ciudad.nombre= params_ciudad[:nombre]
        if @ciudad.save
            # redirect_to "/ciudades"
            redirect_to ciudades_path
        else
            render :crear
        end
    end

    # GET /ciudades
    def listar
        @lista_ciudades = Ciudad.all
    end

    def mostrar
        @lista_ciudades = Ciudad.all
    end

     # GET /ciudades/:id/editar
     def editar
     end
    
     # PATH /ciudades/:id
    def actualizar
        @ciudad.nombre = params_ciudad[:nombre]
        if @ciudad.save
            redirect_to ciudades_path
        else
            render :editar
        end
    end

     # DELETE /ciudades/:id
     def eliminar
        @ciudad.destroy
        redirect_to ciudades_path
     rescue
        flash[:error_ciudad] = "No se puede elimiar la ciudadad #{@ciudad.nombre} porque exite un hotel ahí"
        redirect_to ciudades_path
    end

    private # Todo lo que está abajo 👇👇 es PRIVADO
    
    # recuperamos el :id de la URL 📦 y lo buscamos en la base de datos
    def asignar_ciudad
        @ciudad = Ciudad.find_by(id: params[:id])
        puts "ANTES ASIGNAR UNA CIUDAD".center(50, "🚥")
    end

    # extraer los datos del formulario 📦
    def params_ciudad
        return params.require(:ciudad).permit(:nombre)
    end
end