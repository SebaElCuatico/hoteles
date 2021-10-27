class RolesController < ApplicationController
    def listar
        @roles = Rol.all
    end

    def crear
    @mi_nombre = "Seba El Cuatico" 
    @rol = Rol.new
    end          
    def guardar
        datos_rol = params.require(:rol).permit(:rol)
        @nuevo_rol = Rol.new(datos_rol)
        if @nuevo_rol.save
            redirect_to roles_path
        else
            
        end
        
    end
end