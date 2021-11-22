class RolesController < ApplicationController
    before_action :validar_sesion_administrador
    before_action :asignar_rol , only: [:editar, :actualizar, :eliminar]

    def crear
    @rol = Rol.new
    end
           
    def guardar
        @nuevo_rol = Rol.new(params_rol)
        if @nuevo_rol.save
            redirect_to roles_path
        else
            render :crear
        end
        
    end

    def listar
        @roles = Rol.all
    end

    def editar
    end

    def actualizar
        @rol.rol = params_rol[:rol]
        if @rol.save
            redirect_to roles_path
        else
            render :editar
        end    
    end
    
    def eliminar
        @rol.destroy
        redirect_to roles_path
    end

    private
    def params_rol
        return params.require(:rol).permit(:rol)
    end

    def asignar_rol
        @rol = Rol.find_by(id: params[:id])
    end
end