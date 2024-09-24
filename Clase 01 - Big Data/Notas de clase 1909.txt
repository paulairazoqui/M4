Comandos
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

