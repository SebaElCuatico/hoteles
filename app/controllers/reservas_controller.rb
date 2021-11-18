class ReservasController < ApplicationController

    layout 'layout_cliente'
    before_action :validar_sesion_dirigiendo_al_registro
    
    def nueva
        @habitacion = Habitacion.find(params[:id_habitacion])
        @reserva = Reserva.new
    end

    def guardar
        @habitacion = Habitacion.find(params[:id_habitacion])
        @reserva = Reserva.new(params_reserva)
        @reserva.habitacion = @habitacion
        @reserva.usuario = @usuario
        @codigo = SecureRandom.alphanumeric(5).upcase
        if @reserva.save
            flash[:reserva_creada] = "Su reserva ha sido creada"
            redirect_to root_path
        else
            render :nueva
        end
    end

    private
    def params_reserva
        return params.require(:reserva).permit(:fecha_ingreso, :fecha_salida)
    end

end