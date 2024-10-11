Notas clases:

Los cuatro componentes de Docker con los que podemos interactuar son: imágenes, contenedores, volúmenes y networks.

**IMAGENES:** instalaciones de software y darle instrucciones al contenedor de cómo correr

**CONTENEDOR:** serie de procesos indicados por la imagen

**VOLÚMENES:** nos sirve para (persistir?) data

**NETWORKS:** RED. nos sirva para crear un cluster de Hadoop

En la parte interna de Docker es donde entra cliente de Docker, Daemon, etc.

# HIVE
Es una interfaz de SQL que posteriormente se va a traducir a MapReduce, que sirve principalmente para crear data warehouse

*¿Por qué un data warehouse sobre un cluster?*
Una vez que llegamos a big data --> en cuanto volumen y variedad, se puede hacer un data warehouse en hive.

Hive nos permite crear infraestructuras del tipo data warehouse, lo que nos permite hacer analítica sobre data distribuida. Muy parecido a SQL

La metadata se va a almacenar en tabla de MySQL

## HiveQL (Hive Query Language)
Es el análogo a SQL que utiliza Hive

- Hive utiliza un subconjunto de comandos SQL --> utiliza gran parte, pero hay ligeras diferencias.

- Data Definition Language --> para crear objetos, funciones, etc.

- Data Manipulation Language --> para la manipulación de esa información

- Las operaciones de UPDATE y DELETE no están habilitadas por defecto --> esto sucede porque Hive está pensado para ser un data warehouse y no un sistema transaccional.
Data warehouse, no está pensado para ser usado en el día a día

Al final de cuentas, Hive es un traductor, todo lo que está pasando se va a traducir un código de MapReduce.
También se puede pensar como una interfaz, donde se accede a MapReduce a través de código SQL.

## Tipo de carpetas (está en el README)

## Tipo de datos
Vamos a tener los mismos tipos de datos que manejamos en SQL: VARCHAR, int, decimal, etc.

Pero también vamos a encontrarnos con <br>
**- ARRAY**(ARREGLOS)<data_type>, que se pueden pensar como listas de Python.<br>
**- MAP** <primitive_type, data_type>, es el análogo a un diccionario de Python, donde hay una clave y un valor. Siempre va a ser un tipo de dato asociado a otro tipo de dato.<br>
**- STRUCTURE** <col_name: data_type,...>, se puede pensar como una clase de Python, pero sin métodos, solo con atributos. Acá será un nombre asociado un tipo de dato.<br>

Preguntas:
1. *Para utilizar Hive ¿es necesario aprender un lenguaje nuevo?* NO, es ~70-80% similar a SQL. Si hay algo que no se, se googlea

2. *¿Qué tipo de sistema de manejo de datos se puede armar con HDSF y Hive?* Un **data warehouse**.

3. *¿Por qué Hive acepta tipos de datos más complejos?* se utilizan tipos de datos que no son necesariamente tabulares, por ejemplo tipo json. Entonces como pueden contener distintos tipos de datos, necesitamos más tipos de datos para poder manejarlos.

## Formato de datos
Los formatos csv y json son secuenciales.
Los formatos parquet y avro son binarios, quiere decir que no almacenan la información en forma secuencial, sino que lo hace de manera de optimizar el espacio. En otros casos, se pueden optimizar por query, hace que se mejore la performance (por ejemplo de un group by).

*¿Por qué se utiliza "bastante" el formato?* por las APIs, cualquier sistema que requiera comunicación entre entidades, se comunican a través de APIs, y las APIs se comunican a través de JSON. es el formato estándar para la comunicación.
Generalmente la data cruda viene en formato JSON. 

## Particiones
Es análogo al proceso de ETL que hicimos, es decir armar índices

La partición sirve para la eficiencia, permite hacer querys más rápido porque son menos pesadas, y si estamos trabajando en la nube (como es habitual) se reducen costos. En definitiva aumenta la eficiencia en tiempo (son más rápidos) y en costos.

***Siempre se debe pensar quién es el usuario y sus necesidades para realizar la particiones que más le convenga***
> si utiliza uno u otro filtro, una u otra arquitectura, etc.

## Hive SerDes (está en el README)

Preguntas:
1. *¿Qué ventaja ofrece el uso de particiones?* Eficiencia en tiempo y eficiencia en costos

2. *¿Qué formatos de datos soporta HDFS y podemos ver con Hive?* específicamente en esta clase vimos: csv, json, parquet y avro 

# Governanza del dato
- Ownership: suele haber una persona (sola o que lidera un equipo) que es la encargada/responsable de la data de una organización y si esta es muy grande, de un área de la organización

- Knowledge: se refiere a todos los reportes que realizamos a partir de la data

- Quality: *calidad del dato* la persona encargada (ownership) es la responsable de validar o dirigir el equito que realice la validación del dato

- Security: a qué personas les damos permisos para que puedan acceder a la información, o más aún para modificarla/eliminarla (este último es más sensible, no suele hacerse, hay que hacer backups).

- Accessibility: nuevamente, qué personas tienen permisos de acceder a la data

La organización debe tener una persona que conozca la información a grandes rasgos. (ejemplo de banco: cantidad de usuarios, si son activos, si este número cambió a lo largo del tiempo, etc). que también va a servir de validación del dato.