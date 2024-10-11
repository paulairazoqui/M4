# Apache Spark
Apache Spark es un motor para procesamiento a gran escala de datos, integrado, rápido, "in memory" y de propósito general. Tienen su propio sistema de "Cluster Management" y utiliza Hadoop solo como almacenamiento. Spark está escrito en Scala y provee APIs en Java, Scala, Python y R.
**Características:**
1. Computación en memoria.
2. Tolerancia a fallos.
3. Multipropósito.

![Spark.jpg](../_src/assets/Spark.jpg)

Spark es ideal para tareas de procesamiento iterativo e interactivo de grandes "data sets" y flujos de datos ("streaming").

Brinda una performance entre 10-100x mayor que Hadoop operando con construcciones de datos ("data constructs") llamadas "Resilient Distributed Datasets" (RDDs), esto ayuda a evitar latencias en tareas de lectura y escritura en discos. Es una alternativa a MapReduce.

Algunos ejemplos...

![Algunos_ejemplos](../_src/assets/MapReduce_Spark.jpg)


Caso Uber: [VER](https://www.slideshare.net/databricks/spark-meetup-at-uber)
Caso Apple: [VER](https://www.slideshare.net/databricks/apache-spark-at-apple-with-sam-maclennan-and-vishwanath-lakkundi)
Caso Netflix: [VER](https://www.slideshare.net/databricks/migrating-to-apache-spark-at-netflix)

## Arquitectura Spark
Spark tiene una arquitectura de capas bien definida donde todos los componentes están relacionados e integrados con extensiones y librerías.

Está basado en dos abstracciones:
- RDD (Resilient Distributed Dataset)
- DAG (Directed Acylic Graph)

![Arquitectura_Spark.jpg](../_src/assets/Arquitectura_Spark.jpg)

Cada tarea de Spark crea un DAG de etapas de trabajo para que se ejecuten en un determinado cluster. En comparación con MapReduce, el cual crea un DAG con dos estados predefinidos (Map y Reduce), los grafos DAG creados por Spark pueden tener cualquier número de etapas Spark con DAG es más rápido que MapReduce por el hecho de que no tiene que escribir en disco los resultados obtenidos en las etapas intermedias del grafo. Gracias a una completa API, es posible programar complejos hilos de ejecución paralelos en unas pocas líneas de código.

![DAG.jpg](../_src/assets/DAG.jpg)

Es un grafo dirigido que no tiene ciclos, es decir, para cada nodo del grafo no hay un camino directo que comience y finalice en dicho nodo. Un vértice se conecta a otro, pero nunca a sí mismo; para cada vértice v, no hay un camino directo que empiece y termine en V. Spark soporta el flujo de datos acíclico.

![Spark_Cluster.jpg](../_src/assets/Spark_Cluster.jpg)

## Arquitectura Spark Hadoop
| **Características** | **Hadoop**     | **Spark**                                                                 |
|----------------|---------------------------|------------------------------------------------|
| **Propósito**   | Procesamiento y almacenamiento de grandes datasets                       | Motor de propósito general para procesamiento de datos a gran escala                     |
| **Componentes principales** | Hadoop Distributed File Systems                            | Spark core, motor de procesamiento en memoria                                             |
| **Almacenamiento** | HDFS administra colecciones de datos a través de múltiples nodos de un cluster de servidores “commodity” | Spark no realiza almacenamiento distribuido, opera en colecciones de datos distribuidas |
| **Tolerancia a fallos** | Replicación. Los datos son escritos a discos en varios nodos luego de cada operación | RDD’s minimizado “network I/O”. Los RDDs pueden ser reconstruidos ante fallos.         |
| **Velocidad de procesamiento** | MapReduce es más lento                                   | Hasta 10x más rápido que MAPReduce para “batch processing” y hasta 100x más rápido para “streaming processing” |
| **Soporte de lenguajes** | Java                                                            | Scala, APIs para Python, Java, R y otros                                                  |

## RDD
Es la estructura fundamental de datos de Apache Spark, una colección de objetos que se computan en diferentes nodos del Cluster.

![Spark_RDD.jpg](../_src/assets/Spark_RDD.jpg)

Resilient (tolerante a fallos), capacidad de recomponer particiones de datos dañadas o perdidas por fallos en nodos.
Distributed, los datos residen en varios nodos.
DataSet, representa registros de los datos, que el usuario puede cargar en forma de archivos JSON, CSV, texto o bases de datos por medio de JDBC sin una estructura de datos específica.
Todas las aplicaciones en Spark poseen un manejador central de programa (Driver) y varios ejecutores que se crean a lo largo del clúster, estas son las computadoras que realizarán las tareas en paralelo y finalmente devolverán los valores al driver, la aplicación central.

## Operaciones sobre RDD

Para poder realizar estas tareas, Spark posee desde su versión 1.0 los RDD (Resilient Distributed Dataset), los cuales son tolerantes a fallos y pueden ser distribuidos a lo largo de los nodos del clúster. Los RDD pueden ser creados al cargar datos de manera distribuida, como es desde un HDFS, Cassanda, Hbase o cualquier sistema de datos soportado por Hadoop, pero también por colecciones de datos de Scala o Python, además de poder ser leídos desde archivos en el sistema local. En visión general, un RDD puede ser visto como un set de datos los cuales soportan solo dos tipos de operaciones: transformaciones y acciones.

Las transformaciones permiten crear un nuevo RDD a partir de uno previamente existente, mientras que las acciones retornan un valor al driver de la aplicación. El núcleo de operación del paradigma de Spark es la ejecución perezosa (Lazy), es decir que las transformaciones solo serán calculadas posterior a una llamada de acción. Además, los RDD poseen una familiaridad con el paradigma orientado a objetos, lo cual permite que podamos realizar operaciones de bajo nivel a modo. Map, filter y reduce son tres de las operaciones más comunes. Una de las grandes ventajas que ofrecen los RDD es la compilación segura; por su particularidad de ejecución perezosa, se calcula si se generará un error o no antes de ejecutarse, lo cual permite identificar problemas antes de lanzar la aplicación.

El pero que podemos encontrar con los RDD es que no son correctamente tratados por el Garbage collector y cuando las lógicas de operación se hacen complejas, su uso puede resultar poco práctico, aquí entran los DataFrames.

![Operaciones_RDD.jpg](../_src/assets/Operaciones_RDD.jpg)

## Data Frames

Colección de RDD’s con esquema. Características

- Los datos están organizados en columnas nombradas.
- Es equivalente a una tabla en una base de datos relacional.

![Spark_DataFrame.jpg](../_src/assets/Spark_DataFrame.jpg)

Esos componentes fueron agregados en la versión 1.3 de Spark y pueden ser invocados con el contexto espacial de Spark SQL. Como indica su nombre, es un módulo especialmente desarrollado para ser ejecutado con instrucciones parecidas al SQL estándar. De la misma forma, como los RDD, estos pueden ser creados a partir de archivos, tablas tipo Hive, bases de datos externas y RDD o DataFrames existentes.

El primer detalle que salta cuando creamos un DataFrame es que poseen columnas nombradas, lo que a nivel conceptual es como trabajar con un DataFrame de Pandas. Con la excepción que a nivel interno Spark trabaja con Scala, lo cual le asigna a cada columna el tipo de dato Row, un tipo especial de objeto sin tipo definido. Pero no es todo, los DataFrames implementan un sistema llamado Catalyst, el cual es un motor de optimización de planes de ejecución, parecido al que usan las bases de datos, pero diseñado para la cantidad de datos propia de Spark, aunado a eso, se tiene implementado un optimizador de memoria y consumo de CPU llamado Tungsten, el cual determina cómo se convertirán los planes lógicos creados por Catalyst a un plan físico.

## Data Set
Es una extensión del Dataframe. Características:
- Clases fuertemente tipadas.
- Verificación de tipos de dato en tiempo de compilación.
- Disponible sólo en Scala y Java.

![Spark_DataSet.jpg](../_src/assets/Spark_DataSet.jpg)

## Particionado

Los RDD son la capa de abstracción primaria para poder interactuar con los datos que viven en nuestro ambiente de Spark. Aunque estos puedan ser enmascarados con un esquema dotándolos de las facultades propias de los DataFrames, la información de fondo sigue operando como RDD. Por lo tanto, la información, como indica el nombre de los RDD, se maneja de forma distribuida a lo largo del clúster, facilitando las operaciones que se van a ejecutar, ya que segmentos de información pueden encontrarse en diferentes ejecutores reduciendo el tiempo necesario para acceder a la información y poder así realizar los cálculos necesarios. Cuando un RDD o DataFrame es creado, según las especificaciones que se indiquen a la aplicación de Spark, creará un esquema de particionado básico, el cual distribuirá los datos a lo largo del clúster.

Siendo así que al momento de ejecutar una acción, esta se ejecutará entre los diversos fragmentos de información que existan para poder así realizar de la forma más rápida las operaciones. Es por eso que un correcto esquema de particionado es clave para poder tener aplicaciones rápidas y precisas que además consuman pocos recursos de red. Otra de las tareas fundamentales es la replicación de componentes y sus fragmentos, ya que al aumentar la disponibilidad de estos podremos asegurar una tolerancia a fallos, mientras más se replique un valor es más probable que no se pierda si existe un fallo de red o energía, además de permitir una disponibilidad casi inmediata del archivo buscado. La partición y replicación son elementos que deben ser analizados según el tipo de negocio o requerimientos que se tengan en el desarrollo que se encuentre en progreso, por lo cual la cantidad de datos replicados o granularidad de datos existentes en los fragmentos dependerá en función de las reglas de negocio.

# Módulos Spark
![Modulos_Spark.jpg](../_src/assets/Modulos_Spark.jpg)

## Spark Core
Brinda velocidad dando capacidades de computación ”in-memory”. Spark Core es la base del procesamiento distribuído de grandes datasets.

### SparkSQL

https://spark.apache.org/sql/

- Lenguaje provisto para tratar con datos estructurados.
- Permite ejecutar consultas sobre los datos y obtener resultados útiles.
- Soporta consultas a través de SQL y HiveQL.

### Spark Streaming

https://spark.apache.org/streaming/

- Permite procesamiento de flujos en forma escalable, rápida y tolerante a fallos.
- Spark divide los “streams” de datos en pequeños “batches”.
- Puede acceder a orígenes de datos como Kafka, Flume, Kinesis o sockets TCP.
- Trata a cada “batch” de datos como RDDs y los procesa.
- Puedo operar con varios algoritmos.
- La data procesada se almacena en el file system y bases de datos.

### Spark MLlib

https://spark.apache.org/mllib/

- Es una librería escalable de Machine learning.
- Contiene librerías para implementar algoritmos de ML, por ejemplo clustering, regression y Filtrado colaborativo.
- El workflow ML incluye estandarización, normalización, hashing, algebra lineal, estadísticas.

### Spark GraphX

https://spark.apache.org/graphx/

- Es un motor de análisis de grafos.
- Extiende Spark RDD brindado una abstracción gráfica de grafos dirigidos con propiedades asignadas a cada nodo y vértice.

## Catalyst Optimizer

Es un motor de optimización de planes de ejecución, parecido al que usan las bases de datos, pero diseñado para la cantidad de datos propia de Spark. Además de eso, se tiene implementado un optimizador de memoria y consumo de CPU, llamado Tungsten, el cual determina cómo se convertirán los planes lógicos creados por Catalyst a un plan físico.

![Catalyst_Optimizer.jpg](../_src/assets/Catalyst_Optimizer.jpg)

**Enlaces de Referencia**

- Pagina oficial Spark http://spark.apache.org/
- Github Spark https://github.com/apache/spark
- Spark Packages https://spark-packages.org/
- Databricks https://docs.databricks.com/getting-started/try-databricks.html
- https://github.com/rb-one/Cuso_Introductorio_de_Spark/blob/master/Notes/notes.md

# Procesamiento Batch y Streaming
## Procesamiento Batch

![Batch.jpg](../_src/assets/Batch.jpg)
Es el procesamiento de transacciones por lote. Los trabajos que pueden ejecutarse sin la interacción del usuario final, o pueden programarse para ejecutarse según lo permitan los recursos. Ej. Reporte anual de ventas.

## Procesamiento Streamming - Herramientas
![Streaming.jpg](../_src/assets/Streaming.jpg)

Procesamiento de datos a medida que se producen o reciben (flujo de datos en movimiento). Los datos se crean como una serie de eventos a lo largo del tiempo.

**Ejemplos**
- Eventos de sensores
- Clicks en un sitio web
- Operaciones financieras

# Arquitectura Lambda
Es una arquitectura de procesamiento de datos diseñada para gestionar grandes volúmenes de datos que combina los métodos Batch y Streaming Esta arquitectura es atribuida a Nathan Marz, creador de Apache Storm y autor del libro “Big Data: Principles and Best Practices of Scalable Real-time Data Systems”
**Capas**
![Capas](../_src/assets/Lambda_Capas.jpg)

**Tecnologías**
![Tecnologías](../_src/assets/Lambda_Tecnologias.jpg)

## Kafka
Sistema de cola de mensajes distribuido que utiliza el patrón productor-consumidor.

![Arquitectura_Kafka.jpg](../_src/assets/Arquitectura_Kafka.jpg)

**Componentes:**
- Topics: categorías para los mensajes
- Producers: envian mensajes a un topic
- Consumers: se suscriben a topics
- Brokers: nodos que forman el cluster

## Spark Streaming
Es el módulo de Spark que nos permite ingestar y procesar flujos de datos continuos. Utiliza micro-batching para dividir flujos de datos continuos en batches correspondientes a un periodo de tiempo acotado. Posibles fuentes de datos : Kafka, Flume, AWS Kinesis, TCP Sockets, Twitter

![Strctured_Streaming.jpg](../_src/assets/Strctured_Streaming.jpg)
![Spark_Streaming.jpg](../_src/assets/Spark_Streaming.jpg)

**Enlaces recomendados:**
- Flink https://flink.apache.org/
- Kafka https://kafka.apache.org/documentation/
- Kafka https://enmilocalfunciona.io/aprendiendo-apache-kafka-parte-1/
- Kafka https://enmilocalfunciona.io/aprendiendo-apache-kafka-parte-2-2/
- Kafka https://enmilocalfunciona.io/aprendiendo-apache-kafka-parte-3-conceptos-basicos-extra/
- Kafka https://enmilocalfunciona.io/aprendiendo-apache-kafka-parte-4/
- Kafka https://enmilocalfunciona.io/aprendiendo-apache-kafka-parte-3-configuracion-de-multiples-brokers/
- Kafka https://enmilocalfunciona.io/aprendiendo-apache-kafka-parte-3-configuracion-con-replicacion/
- Kafka https://enmilocalfunciona.io/acelerando-los-desarrollos-con-contenedores-infraestructura-de-apache-kafka/
- Kinesis https://aws.amazon.com/es/kinesis/

Práctica en Clase
By HENRY ㅤ
HENRY ㅤ
amarilloblanco.jpg
1. Databricks: Para ejecutar los ejercicios en los notebooks vamos a necesitar un cluster: https://docs.databricks.com/getting-started/quick-start.html#quick-start

community_edition.png
Al registrarse en Databricks seleccionar "Get Started with Community Edition":

DataFrames (Python): Cargar el notebook "Dataframes (Python).ipynb"
Datasets (Scala): https://docs.databricks.com/_static/notebooks/getting-started/iotdevicegeoipds.html
1.1) Crear Cluster
Databricks_1.jpg
Databricks_2.jpg
Importar Notebook

Databricks_3.jpg
Ingresar URL
Adjuntar Cluster y Ejecutar 
Databricks_4.jpg
Spark Streaming:
En Databricks ejectuar el notebook:
https://docs.databricks.com/_static/notebooks/structured-streaming-python.html
Flink:
https://github.com/ververica/sql-training/wiki
https://github.com/ververica/sql-training/tree/master/slides
https://github.com/ververica/sql-training/wiki/Setting-up-the-Training-Environment

Detalle de ejecución
Entorno
 Flink Web UI 
Ejecutar consulta
 Visualizar Resultados
Job Status 
Detalle de ejecución
Entorno
 Flink Web UI 
Ejecutar consulta
 Visualizar Resultados
Job Status 
Detalle de ejecución

1
2
3
4
5
6
Entorno

 Flink Web UI

Ejecutar consulta

 Visualizar Resultados


Job Status

Detalle de ejecución

Cluster Spark:


git clone https://github.com/soyHenry/DS-M4-Cluster_Spark
Modificar los yml de 512m a 4098m
sudo docker-compose up
https://towardsdatascience.com/apache-spark-cluster-on-docker-ft-a-juyterlab-interface-418383c95445
Entorno_Spark.jpg
blancoamarillo.jpg
Enlaces sugeridos:

https://github.com/wurstmeister/kafka-docker
https://github.com/bitnami/bitnami-docker-kafka
https://github.com/spotify/docker-kafka

# Notas de la clase complementaria

# Spark

## ¿Qué es?
Es un motor para **procesamiento** a gran escala de datos, integrado, rápido, "in memory" y de propósito general. Tienen su propio sistema de "Cluster Management" y utiliza Hadoop solo como almacenamiento. Spark está escrito en Scala y provee APIs en Java, Scala, Python y R.
 
No permite el almacenamiento.

## Características
* Computación en memoria
* Tolerancia a fallos
* Multipropósito

## ¿Para qué sirve?
Spark es ideal para tareas de procesamiento iterativo e interactivo de grandes "data sets" y flujos de datos ("streaming"). 
![Spark](../_src/assets/MapReduce_Spark.jpg)
> MapReduce guarda la información en cada iteración, la desventaja de este tipo de procesamiento es que los almacenamientos intermedios son costosos, siempre escribir en memoria es costoso.
En cambio, Spark al momento de iniciar el procesamiento, tiene que leer data de una base de datos de disco (por ejemplo HDFS), luego comienza a hacer procesamientos como MapReduce, pero a diferencia de esto, los almacena momentáneamente en la memoria RAM. El hecho de almacenar en memoria RAM nos da la ventaja que es más rápido y menos costoso que almacenar en disco. Spark solo utiliza el disco al momento de leer la información y al momento de guardala (al final).

Brinda una performance entre 10-100x mayor que Hadoop operando con construcciones de datos ("data constructs") llamadas "Resilient Distributed Datasets" (RDDs), esto ayuda a evitar latencias en tareas de lectura escritura en discos. Es una alternativa a MapReduce

Entonces *computación en memoria** hace referencia a la utilización de la memoria RAM, lo que da mucha ventaja en cuestiones de velocidad.

# Arquitectura de Spark
## ¿Para qué sirve?
**Spark** tiene una arquitectura de capas bien definida donde todos los componentes están relacionados e integrados con extensiones y librerías.
Está basado en dos abstracciones:
* **RDD** (Resilient Distributed Dataset)
* **DAG** (Direct Acylic Graph)
![Spark_RDD_DAG](/_src/assets/Arquitectura_Spark.jpg)
> Tiene un **sistema de almacenamiento** (distributed, que significa que si deseamos utilizar un sistema de almacenamiento, puede ser HDFS, pero no únicamente, se puede elegir, aunque la más elegida es HDFS)
> Tiene un **"Cluster Manager"** por lo evidentemente Spark funciona dentro de una arquitectura cluster, que tiene como consecuencia que se necesita un cluster manager que puede ser compartido. (Puede ser YARN)
> Tiene un **Spark Core**, algo así como el código fuente de Spark, dentro del cual están los RDDs (como Spark almacena la información en forma distribuida)
> Y por último, tenemos los servicios de SPARK, como Spark SQL, MLib y GraphX.

![Cluster_Spark](/_src/assets/Spark_Cluster.jpg)

> Cada vez que estemos corriendo un código de Spark, lo haremos en un contexto denominado SparkContext

## Hadoop-Spark
| **Características** | **Hadoop**     | **Spark**                                                                 |
|----------------|---------------------------|------------------------------------------------|
| **Propósito**   | Procesamiento y almacenamiento de grandes datasets                       | Motor de propósito general para procesamiento de datos a gran escala                     |
| **Componentes principales** | Hadoop Distributed File Systems                            | Spark core, motor de procesamiento en memoria                                             |
| **Almacenamiento** | HDFS administra colecciones de datos a través de múltiples nodos de un cluster de servidores “commodity” | Spark no realiza almacenamiento distribuido, opera en colecciones de datos distribuidas |
| **Tolerancia a fallos** | Replicación. Los datos son escritos a discos en varios nodos luego de cada operación | RDD’s minimizado “network I/O”. Los RDDs pueden ser reconstruidos ante fallos.         |
| **Velocidad de procesamiento** | MapReduce es más lento                                   | Hasta 10x más rápido que MAPReduce para “batch processing” y hasta 100x más rápido para “streaming processing” |
| **Soporte de lenguajes** | Java                                                            | Scala, APIs para Python, Java, R y otros                                                  |

# RDD
## ¿Qué es?
* Es la estructura fundamental de datos de Apache Spark, una colección de objetos que se computan en diferentes nodos del Cluster.
* Resilient (**tolerante a fallos**), capacidad de recomponer perticiones de datos dañadas o perdidas por fallos en nodos. Si hay un procesamiento que este realizando un nodo y este falla, el Driver Node (el maestro) se va a dar cuenta y va a derivar ese trabajo a otro worker.
* Distributed, los datos residen en varios nodos
* DataSet, representa registros de los datos, que el usuario puede cargar en forma de archivos JSON, csv, texto o bases de datos por medio de JDBC sin una estructura de datos específica.

![RDDs](../_src/assets/Spark_RDD.jpg)

***Es la forma en la que almacena información Spark en la memoria RAM***

## Operaciones sobre RDD
![Operaciones_RDD](../_src/assets/Operaciones_RDD.jpg)

Un procesamiento sucede de la siguiente forma:
- Se crea un RDD, cargamos un dataset/información
- A ese RDD, se le aplica una transformación y se obtiene otro RDD.
- Aplicamos otra transformación y obtenemos otro RDD. Por eso la línea de procesamiento (*Linage*) va hacia atrás, ya que el último sería el que se ve, mientras que el primero es el que está tapado.
- Los RDD se acumulan y son conceptuales: es decir que Spark no va a realizar nada ("lazyness") hasta un llamado a la acción, un código que pida que me muestre un resultado. Entonces, por ejemplo, dentro de las transformaciones puede haber un GROUP BY y dentro de los resultados/acciones un COUNT.

# Catalyst Optimizer
## ¿Qué es?
Motor de optimización de planes de ejecución, parecido al que usan las bases de datos, pero diseñado para la cantidad de datos propia de Spark. Además de eso, se tiene implementado un optimizador de memoria y consumo de CPU, llamado Tungsten, el cual determina cómo se convertirán los planes lógicos creados por Catalyst a un plan físico.
Con algoritmos matemáticos, Spark ordena todas las transformaciones para que el uso de memoria y consumo de CPU sea el más óptimo, sin cambiar el resultado.

# Dataframes
Cómo almacena la información Spark.
Por un lado son dataframes y por otro datasets.
En cuanto a los dataframes:
Es una colección de RDD's con esquema (similar a un dataframe de pandas).

**Características:**
- Los datos están organizados en columnas nombradas.
- Es equivalente a una tabla en una base de datos relacional.

En un dataframe de Spark, este va a inferir el tipo de dato de las columnas.

![dataframe_Spark](../_src/assets/Spark_DataFrame.jpg)

# Datasets
## ¿Qué es?
Es una extensión del Dataframe.

Características:
- Clases fuertemente tipadas.
- Verificación de tipos de datos en tiempo de compilación.
- Disponible sólo en Scala y Java

Tiene una diferencia fundamental con los Dataframes, que radica en el hecho de que hay que especificar con anterioridad el esquema. Tanto el nombre de la columna como el tipo de dato.
![Spark_DataSet](../_src/assets/Spark_DataSet.jpg)


# Módulos de Spark
## Spark Core
- Brinda velocidad dando capacidades de computación "in-memory". Spark Core es la base del procesamiento distribuido de grandes datasets.
![Spark_Core](../_src/assets/Modulos_Spark.jpg)

### SparkSQL
- Permite lenguaje provisto para tratar con datos estructurados. Permite interactuar con cualquier fuente de información que sea estructurada --> que pueda llevarse a un formato tabular.
- Permite ejecutar consultas sobre los datos y obtener resultados útiles.
- Soporta consultas a traves de SQL y HQL.

### Spark Streaming
Streaming --> flujo constante de información
- Permite procesamiento de flujos en forma escalable, rápida y tolerante a fallos.
- Spark divide los "streams" de datos en pequelos "batches".
- Trata a cada "batch" de datos como RDDs y los procesa.
- Puedo operar con varios logaritmos.

### Spark MLlinb
- Es una librería de Machine Learning
- Contiene librerías para implementar algoritmos de ML, por ejemplo clustering, regression y filtrado colaborativo.
- El workflow ML incluye estandarización, normalización, hashing, algebra lineal, estadísticas.

### Spark GraphX
- Es un motor de análisis de grafos.
- Extiende Spark RDD Brindando una abstracción gráfica de grafos dirigidos con propiedades asignadas a cada nodo y vértice.

# Procesamiento Batch
## ¿Qué es?
El procesamiento de transacciones por lote. Los trabajos que pueden ejecutarse sin la interacción del usuario final, o pueden programarse para ejecutarse según lo permitan los recursos. Ej: Reporte anual de ventas 
 
![Procesamiento_Batch](../_src/assets/Batch.jpg)

# Procesamiento Streaming
## ¿Qué es?
Procesamiento de datos a medida que se producen o reciben (flujo de datos en movimiento). Los datos se crean como una serie de eventos a lo largo del tiempo.
- Ejemplos:
	- Eventos de sensores
	- Clicks en un sitio web
	- Operaciones financieras

![Streaming](../_src/assets/Streaming.jpg)

## Arquitectura Lambda
![Lambda](../_src/assets/Lambda_Capas.jpg)

Nos ofrece una forma de unificar las dos capas, por un lado la capa de velocidad (donde se recibe información a alta velocidad -de manera rápida-) y por otro lado la capa Batch ( de información un poco más curada, más "relievable"/ confiable) y uniendo estas capas, se encuentra la capa serving, que unifica las dos fuentes de información, permitiendo identificar o decidir si la información es confiable y así poder compartirla con el Analytics client.

## Kafka
### ¿Qué es?
Sistema de cola de mensajes distribuido que utiliza el patrón productor-consumidor.
- Topics: categorías para los mensajes
- Producers: Envían mensajes a un topic, produce información en tiempo real.
- Consumers: Se suscriben a los topics
- Brokers: Nodos que forman el cluster.
![Kafka](../_src/assets/Arquitectura_Kafka.jpg)

*Nos permite enviar información streaming a traves de un sistema productor-consumidor.*

Una aclaración importante en esta arquitectura es que la información que recibimos, la redistribuimos y no la procesamos.

## Spark Streaming.
### ¿Qué es?
- Es el módulo de Spark que nos permite ingestar y procesar flujos de datos continuos.
- Utiliza micro-batching para dividir flujos de datos continuos en batches correspondientes a un periodo de tiempo acotado.
- Posibles fuentes de datos: Kafka, Flume, AWS Kinesis, TCP Sockets, Twitter
![spark_streaming](../_src/assets/Strctured_Streaming.jpg)

>**Dato**
> Apache Spark fue desarrollado originalmente en la Universidad de California, Berkeley, en el año 2009, como un proyecto de investigación denominado "AMPLab" (Laboratorio de Análisis de Datos en Memoria Distribuida). El objetivo principal era diseñar una plataforma de ocmputación en clusters que pudiera procesar grandes volúmenes de datos de manera rápida y eficiente.



