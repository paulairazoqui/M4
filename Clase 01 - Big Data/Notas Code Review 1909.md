# Comandos
clear --> para limpiar la terminal
sudo --> indica permiso de administrador

- sudo docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

En docker, hay "docker image" (una imagen) que tiene los archivos necesarios para correr el programa, por ejemplo phyton, MySQL, MongoDB. La imagen es únicamente el software, todos los archivos necesarios, pero no me va a ejecutar el programa.
Teniendo la imagen es necesario un contenedor para ejecutar/correr el programa.

El comando utilizado levanta un contenedor para correr la imagen hello-world
las imágenes se pueden descargar de https://hub.docker.com/

1. The Docker client contacted the Docker daemon --> EL cliente de docker es lo que nos permite interactuar a traves de cliente de docker con el docker daemon, es el corazón
2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64) --> El docker daemon lo que hace es copiarla local (en nuestra computadora)
3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading. --> Crea una máquina para ejecutar la imagen descargada.
4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal --> el docker daemon envía a la terminal.

Al entrar el comando sudo run, ejecuta la imagen.

Para especificar la versión deseada, lo que se hace es luego del nombre poner dos puntos (:) y la versión que se quiere --> ejemplo: python:3.8

docker ps --> muestra solo los contenedores activos. Si se está ejecutando. En el caso de hello-world, muestra el mensaje  y se apaga

docker ps -a --> muestra todos los contenedores, activos o no. 

Cada vez que se ejecuta una imagen, se crea un nuevo contenedor.
Los contenedores son descartables, una vez que se usan, y se apagan, se eliminan (con el tiempo, no instantáneamente). Los contenedores tienen nombres, si no se los damos, docker se los da aleatoriamente.

3) $ docker run --name hola-mundo hello-world
 el siguiente permite cambiar el nombre.
docker remane hola-mundo hola-a-todos

4) docker rm <ID o nombre> (solo los que no esten activos)

puerto: espacio que nos permite conectar dos extremos (puertos)
comando -p --> le indica a docker que puerto quiero exponer del contenedor

para hacer la búsqueda de la pagína de ngixn con el IP, hay que entrar en el Chrome y escribir:
 http://<IP-de-tu-máquina-virtual>:8081

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
