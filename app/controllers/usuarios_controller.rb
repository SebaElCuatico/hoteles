class UsuariosController < ApplicationController
  layout 'layout_cliente'
  before_action :validar_sesion_dirigiendo_al_registro, only: [:mostrar, :cerrar_sesion, :actualizar]
  before_action :validar_sesion_para_el_registro, only: [:iniciar_sesion]

  def mostrar
  end
  
  def actualizar
    if @usuario_actual.update(params_usuario)
      flash[:actualizar_datos] = 'Actualización completada'
      redirect_to usuario_path          
    else
      render :mostrar
    end

  end

  def crear_sesion
    usuario_encontrado = Usuario.find_by(identificacion: params[:identificacion])
      if usuario_encontrado 
        if usuario_encontrado.authenticate(params[:password])
          session[:usuario_id] = usuario_encontrado.id
          redirect_to root_path        
      else
        flash[:error_iniciar_sesion] = "Contraseña incorrecta"
        render :iniciar_sesion
      end
    else
      flash[:error_iniciar_sesion] = "Usuario no encontrado"
      render :iniciar_sesion
    end

  end

  def iniciar_sesion
    
  end

  def cerrar_sesion
    session[:usuario_id] = nil
    redirect_to root_path    
  end
  
  private
  def params_usuario
    return params.require(:usuario).permit(:nombre, :identificacion, :telefono, :password, :password_confirmation)
  end

end