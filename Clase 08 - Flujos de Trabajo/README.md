# Flujos de trabajo
Un proyecto de Big Data implica realizar múltiples tareas en diferentes sistemas en un orden especifico. Es por este motivo que existe la necesidad de contar con orquestadores de flujos de trabajo que permitan automatizar el movimiento y la transformación de los datos.

![Workflows.jpg](../_src/assets/Workflows.jpg)

En anteriores clases se menciono que unos de los criterios de la calidad del dato está asociado a la actualización, y esto supone un agregado de complejidad a la hora de armar el repositorio unificado o Data Warehouse, debido a que, hay que tener en cuenta la necesidad de una carga periódica de datos, lo que implica el hecho de que tablas que ya teníamos cargadas, cuyos datos pasaron por un proceso de transformación, deben de verse incrementadas con nuevo dato. Las cargas incrementales en un ETL son esenciales para cumplir con este punto, de otra manera, cada vez que sea necesario actualizar la información, habría que ingestar todo el histórico completo, lo cual, supone mucha más carga de proceso.

Suponer el hecho de que se haya hecho una carga inicial de todas las compras de la compañía, para lo cual se diseñaron procesos de transformación de los datos necesarios para cumplir con reglas de negocio y mantener el modelo relacional. En adelante, las nuevas compras deberán incluirse en ese modelo, con una frecuencia de 1 semana por ejemplo. Cada vez que se ejecute el proceso incremental, deberá tener en cuenta que sólo se deben ingestar los registros que no se habían cargado.

Si se supone una tabla con 1 millón de registros, que semanalmente crece por ejemplo, unos 5 mil registros, nos daremos cuenta de que de hacer una carga completa en cada oportunidad respecto de sólo cargar las novedades, resultaría en un proceso con mucha más carga. Y eso, por supuesto, se traduce en más tiempo de proceso y consumo de recursos.

## DAG

![DAG_(1).jpg](../_src/assets/DAG.jpg)

**Directed Acyclic Graph** 

Es una representación conceptual de una serie de actividades.

- Dirigido: cada relación entre nodos tiene un sentido único
- Acíclico: no hay ningún camino que nos permita volver al nodo inicial

## Notación CRON
En el sistema operativo Unix, cron es un administrador regular de procesos en segundo plano (demonio) que ejecuta procesos o guiones a intervalos regulares (por ejemplo, cada minuto, día, semana o mes). Los procesos que deben ejecutarse y la hora en la que deben hacerlo se especifican en el fichero crontab. Como usuario podemos agregar comandos o scripts con tareas a cron para automatizar algunos procesos.

![CRON.jpg](../_src/assets/CRON.jpg)

**Enlaces recomendados:**

[CRONTAB] (https://crontab.guru/)<br>
[Comando cron](https://blog.desdelinux.net/cron-crontab-explicados/)

## Oozie
Es un sistema de programación de workflows incluido en distribuciones de Hadoop. Los flujos de trabajo en Oozie están definidos como una colección de tareas representadas en un DAG. Acciones soportadas: MapReduce, Shell, Pig, Hive, Spark, Java, entre otros.

![Oozie.jpg](../_src/assets/Oozie.jpg)<br>

[Oozie] (https://oozie.apache.org/docs/5.2.0/DG_Overview.html)

## Nifi

Es una herramienta desarrollada por la NSA (actualmente es un proyecto de alto nivel de la ASF) que permite automatizar flujos de datos entre sistemas. Posee una interfaz web que permite crear flujos sin necesidad de escribir código. Brinda funcionalidades de seguridad, monitoreo y linaje de datos en movimiento.

[Nifi] (https://nifi.apache.org/docs/nifi-docs/html/getting-started.html)<br>

![Nifi.jpg](../_src/assets/Nifi.jpg)


## AirFlow

Es una plataforma de gestión de flujos de trabajo de código abierto desarrollada por Airbnb (actualmente es un proyecto ASF). Las tareas y dependencias se representan como DAG’s definidos en scripts Python. Los DAG’s pueden se programados para ejecutarse en un horario predefinido o en función de la ocurrencia de eventos. 

[Airflow] (https://airflow.apache.org/docs/apache-airflow/stable/concepts/index.html)<br>
![Airflow.jpg](../_src/assets/Airflow.jpg)

# Práctica en Clase

Vamos a utilizar un ambiente generado con Docker para ejecutar un workflow en Airflow.

Utilizar los siguientes links de referencia para configurar el ambiente:
- https://medium.com/@rose4earn/docker-compose-ing-kafka-airflow-spark-b2ea66993c50
- https://github.com/KumarRoshandot/AirFlow_Kafka_Spark_Docker/tree/master/Project_Flight_Docker2

## Arquitectura
![Airflow2.jpg](../_src/assets/Airflow2.jpg)