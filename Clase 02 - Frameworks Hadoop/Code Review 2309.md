Code Review 23/09
Network --> permite que los contenedores envíen información entre sí, si están dentro del cluster.
	- Master --> da instrucciones
	- Workers --> devuelve la acción, para que el maestro muestre el resultado por consola...
 
El código que termina en .sh es shell, podríamos decir que es un lenguaje de programación. Da instrucciones a la terminal.
Dentro del sh puedo dar instrucciones tipo cd, etc

Dentro del código .sh (start-container.sh) vemos que son comando que hemos ejecutado en la terminal directamente. Por ejemplo el rm (remove)
son comando agrupados en un archivo .sh
el primer comando es 	
		un **rm** (remove) 
		el **-f**(forzamos la remoción)
		luego viene el **hadoop master** --> nos aseguramos que no exista para luego crearlo sin problema
		**<> /dev/null**  --> es para no nos muestre el output, sino que lo mande a una carpeta que no lo vamos a ver, se pierde. 

en la siguiente linea hay un **echo** (es lo mismo que print de python)

lo que sigue es un docker run --> es la corrida de una imagen.
		Tiene varias flags 
		- itd --> iterativo y detach
		- p --> es para cambiar el puerto
		- net --> sirve para asociar el contenedor a la red
		- hostname --> hace referencia a darle un nombre dentro de la red a ese contenedor.
		- name --> es el nombre del contenedor. (es recomendable que ambos sean iguales).
		- finalmente está el nombre de la imagen
		- seguido de **<> /dev/null**

a continuación hay una iteración:
se inicializa una variable i =1
y luego viene un bucle while, para crear los workers.
en el caso del código que es N=3, va a crear 2 workers.
código dentro de la iteración:
	- primero elimina el contenedor de W1, por si existe.
	-luego lo inicializa e imprime el mensaje que inicializa el esclavo 1.
	luego usa los mismo flags ya mencionados: (-itd /; - -net /; - - name / ; - -hostname /; nombre de la imagen)
Hasta ahora solo creamos los contenedores, no estamos asignando los roles (de master y workers)

el último código es exec 
		-cuando quiero dejar la terminal dentro del maestro (sería para asignar el rol de master)
		- en este caso **entra** al contenedor

Vamos a ver cómo un contenedor pasa a formar parte de una red

Pregunta--> Por qué el comando ps lo hace en un putty diferente? porque lo quiere ver desde afuera del contenedor.
Ya que dentro de ese contenedor ni siquiera está instalado docker.

A continuación inicializamos el hadoop en el contenedor master(en el que estábamos posicionados)

El codigo wget es solo para descargar el archivo

/*
Objetivos --> poder interactuar con hadoop/hdfs
	---> hacer un procesamiento dentro de hadoop
*/

mkdir --> comando de linux --> crear un directorio/carpeta

Luego guardamos de manera comprimida el archivo txt
tar -czvf input/odisea.tar.gz odisea.txt
--> lo confirmamos entrando a la carpeta input (cd input)
	y luego comando ls.

Para salir de la carpeta, a la anterior el comando es cd ..

pregunta--> como estoy seguro de donde estoy parado?
Respuesta: usar el comando **pwd** (print working directory)

En el paso 8 del readme de DS-M4-Cluster_Hadoop, comenzamos a usar el herramientas hadoop

HDFS funciona como base para todas las otras herramientas, nos ayuda a almacenar información.
	- ayuda ante la caída de un worker
	- ayuda a la computación en paralelo.

Nos permite crear carpetas

hdfs dfs -mkdir -p test --> esto quiere decir que estamos creando


hdfs dfs -put input --> Se está copiando la carpeta input de afuera a adentro de hsdf

HDSF --> solo podemos hacer almacenamiento.
Para procesar es necesaria otra herramienta.
por ejemplo: MapReduce.

192.168.100.72:8088 --> en esta página nos muestra los nodos activos (entre otras cosas). 


Map--> en matemática es función

luego de ejecutar el comando del trabajo (job), hubo cambios en la página 192.168.100.72:8088 

------------- Hasta acá llega lo del DS-M4-Cluster_Hadoop