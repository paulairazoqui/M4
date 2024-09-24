# Notas de clase
## Configuración virtual box
- Abrir virtual box
- Crear una nueva máquina virtual
- Seleccionar la imagen de Ubuntu Server
- Seleccionar terminar

### Para configurar (antes de abrir).
- Seleccionar configurar (íconos de arriba):
    - Network/red 
        - habilitar el adaptador 1 
                    *Conectado a:* adaptador puente
                    *Modo promiscuo:* Permitir todo<br>
        - habilitar el adaptador 2
                    *Conectado a:* Adaptador solo anfitrion
                    *Modo promiscuo:* Permitir todo<br> 

- Prender la máquina, haciendo doble click y va a cargar todo. Si no hay inconvenientes va a aperecer "servidor_ubuntu login"
- Va a pedir las credenciales. Para nosotros el usuario es ubuntu y la contraseña también es ubuntu (*prestar atención que* el puntero del mouse se pierde cuando está sobre la pantalla negra, tampoco se "ve" cuando se escribe la contraseña)

## Configuración Putty
Para que podamos interactuar de manera más amigable con la interfaz, utillizamos Putty.
- Al ingresar a Putty nos pide una dirección IP, para obtenerla, en VirtualBox entramos con el comando **hostname -I**.
- Copiamos la primera que aparece (en mi caso 192.168.100.72) El puerto es el mismo para todos.
- Le damos **Open** --> Si es la 1ra vez que entramos a una dirección IP, nos va a pedir que confirmemos que confiamos en esa dirección IP (hay que aceptar). 
- Nuevamente va a pedir las credenciales: 
    - usuario: ubuntu
    - contraseña: ubuntu
- Ya esta listo para comenzar a cargar líneas de comando.
