Rails.application.routes.draw do
 #Usuarios 
 get 'perfil', to: 'usuarios#mostrar', as: 'usuario'
 get 'iniciar_sesion', to: 'usuarios#iniciar_sesion', as: 'iniciar_sesion'
 post 'iniciar_sesion', to: 'usuarios#crear_sesion'
 patch 'perfil', to: 'usuarios#actualizar' 
 delete 'cerrar_sesion', to: 'usuarios#cerrar_sesion', as: 'cerrar_sesion'
 # Principal
 root  'paginas#principal'
 get   'paginas/:id_hotel', to: 'paginas#info_hotel', as: 'info_hotel'
 get   'paginas/ciudad/:id', to: 'paginas#info_ciudad', as: 'info_ciudad'

 # Registros
 get  'registro',         to: 'registros#crear', as: 'registro'
 post 'usuarios',      to: 'registros#guardar',  as: 'usuarios' # crear usuarios normales

 # Reservaciones
 get   'reservas/:id_habitacion', to: 'reservas#nueva', as: 'reservas'
 post  'reservas/:id_habitacion', to:  'reservas#guardar'
 
#Roles
 get 'roles', to: 'roles#listar', as: 'roles'   
 get 'roles/nuevo', to: 'roles#crear' , as: 'nuevo_rol'
 get 'roles/:id/editar', to: 'roles#editar', as: 'editar_rol'
 get 'roles/:id', to: 'roles#mostrar', as: 'rol'
 post 'roles', to: 'roles#guardar'
 patch 'roles/:id', to: 'roles#actualizar'
 delete 'roles/:id', to: 'roles#eliminar'

 #Ciudades
 get  'ciudades',            to: 'ciudades#listar',  as: 'ciudades' 
 get  'ciudades/nuevo',      to: 'ciudades#crear', as: 'nueva_ciudad'
 get  'ciudades/:id/editar', to: 'ciudades#editar', as: 'editar_ciudad'
 get   'ciudades/:id',         to: 'ciudades#mostrar', as: 'ciudad'
 post 'ciudades',            to: 'ciudades#guardar'
 patch 'ciudades/:id', to: 'ciudades#actualizar'
 delete  'ciudades/:id',   to: 'ciudades#eliminar'

 #Hoteles
get  'hoteles',            to: 'hoteles#listar',  as: 'hoteles'  
get  'hoteles/nuevo',      to: 'hoteles#crear', as: 'nuevo_hotel'
get 'hoteles/nuevo/:id_ciudad',     to: 'hoteles#crear',  as: 'nuevo_hotel_con_ciudad'
get  'hoteles/:id/editar', to: 'hoteles#editar',  as: 'editar_hotel'
get   'hoteles/:id',         to: 'hoteles#mostrar', as: 'hotel'
post 'hoteles',            to: 'hoteles#guardar'
patch 'hoteles/:id', to: 'hoteles#actualizar'
delete  'hoteles/:id',   to: 'hoteles#eliminar'

#Habitaciones
get  'habitaciones',            to: 'habitaciones#listar',  as: 'habitaciones'  
get  'habitaciones/nuevo',      to: 'habitaciones#crear', as: 'nueva_habitacion'
get  'habitaciones/:id/editar', to: 'habitaciones#editar',  as: 'editar_habitacion'
get   'habitaciones/:id',         to: 'habitaciones#mostrar', as: 'habitacion'
post 'habitaciones',            to: 'habitaciones#guardar'
patch 'habitaciones/:id', to: 'habitaciones#actualizar'
delete  'habitaciones/:id',   to: 'habitaciones#eliminar'
 
end