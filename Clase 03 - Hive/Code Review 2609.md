Code Review 3 --> 26/09

/Breve preámbulo:
Hoy nos centraremos en dar el siguiente paso en cómo procesamos la data que podemos tener.
En la clase anterior comentamos que dentro de hadoop hay varias herramientas entre las que se encuentra mapreduce.

Podemos hacer el procesamiento(tipo conteo de palabras) con otras alternativas a MapReduce

Vamos a asumir que mi archivo ya está en HDFS y luego vamos a procesarlo con Hive

Esta tiene como ventaja, que el procesamiento es  muy similar a SQL, (comparando MapReduce y Hive). Esto es útil ya que a pesar del cambio radical de datos, desde una base tabular, transaccional a una de Big Data, el lenguaje es muy similar.

# Hive
## Lenguaje HQL

1. Entrar al repositorio (git clone https://github.com/soyHenry/DS-M4-Hue_Hive)

Archivo docker-compose ---> permite utilizar varias herramientas, imágenes a la vez ---> por ejemplo Python y Jupiter

Cómo se crean los archivos docker-compose: No es difícil pero en general es útil el chatGPT.

A qué puerto debe entrar para interactual con hue, y para eso debo encontrar el contenedor que se llame así.

Hue, permite interactuar con varias herramientas, la principal es Hive, pero también se puede interactuar con Impala, Java, Spark, Shell, MapReduce, etc (están en el botón de consulta -> editor)

Para crear un nuevo usuario, ir a la u de ubuntu, agregar nuevo usuario, el nombre tiene que ser instructor (las contraseñas las mismas para no olvidar), el paso dos no se toca, y en el paso tres se activa la casilla de superusuario, finalmente se crea el usuario.

Hay que cerrar la sesión y finalmente volver a ingresar con estas nuevas credenciales.

Carga de archivos--> en la columna de la izquierda ubicar el botón de archivos y ahí cargar la carpeta con los archivos csv y txt (de la clase 3)

Luego en el botón de documentos se carga el archivo con los códigos para crear las carpetas (en este caso tuvimos que ir al botón con tres puntos, que está al lado de "mis documentos" y realizar la importaciones de un archivo json), una vez cargado aparece en la carpeta de mis documentos.

Luego comenzamos con la carga de la información, corriendo una a una las líneas de código que aparecen en el archivo "Clase 3".

En general para la construcción de la tabla el código es muy similar a MySQL, se pone el nombre de la columna y el tipo de dato que va a contener. En lugar de CREATE TABLE, se pone CREATE EXTERNAL TABLE.

EXTERNAL--> tablas que son manejadas de forma externa. Se tiene la capacidad de eliminar una tabla y mantener la data.  
MANAGED --> tablas que son manejadas de forma interna. Cuando se eliminan, se elimina la data. Cuando se crea una tabla desde una consulta, es una MANAGED TABLE, sí o sí.

Diferencia, en MySQL no podía entrar al archivo. La data era mi tabla, es la misma entidad
En Hive, por un lado está el archivo con la data, y por otro la tabla, son dos entidades diferentes
Por lo tanto al final de la tabla (después de los nombres de las columnas, es necesario poner una línea de código donde se consigne la ruta del archivo LOCATION 'RUTA/DE/ACCESO.csv') Estos archivos pueden estar en HDFS.

De forma análoga a MySQL, hay que aclara el carácter que separa los campos, en general los csv es una coma(,)


Hive, permite hacer JOINs
MongoDB NO permite hacer JOINs

REgex permite ver patrones en data (no tabular) pero estructurada

