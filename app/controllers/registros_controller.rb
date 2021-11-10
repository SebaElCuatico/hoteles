class RegistrosController < ApplicationController

    
    def crear
        @usuario = Usuario.new
    end
    
    
    # POST /registros
    def guardar
        @usuario = Usuario.new(params_usuario)
        @usuario.rol = Rol.find_by(rol: 'Cliente')
        if @usuario.save
            redirect_to root_path
        else
            render :crear
        end
    end

    private 

    def params_usuario
        return params
        .require(:usuario)
        .permit(:nombre, :identificacion, :telefono, :password, :password_confirmation)
    end
end