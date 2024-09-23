# Hive
1. Permite crear infraestructuras de tipo de data warehouse sobre Hadoop para realizar análisis de grandes volúmenes de datos.
2. Asigna una estructura tabular (metadata) a los datos en bruto almacenados en HDFS.

![Hive.jpg](../_src/assets/Hive.jpg)

## HiveQL (Hive Query Language)
1. Hive utiliza un subconjunto de comandos SQL.
2. Data Definition Language https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL
3. Data Manipulation Language https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DML
4. Las operaciones de UPDATE y DELETE no están habilitadas por defecto.

## Tipos de Tablas
| **MANAGED**                                                                 | **EXTERNAL**                                                                |
|-----------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| Hacen referencia a un path dentro de HDFS que es administrado por Hive   | Generan metadata para un path de HDFS que no es administrado por Hive    |
| El valor por defecto se especifica en el parámetro `hive.metastore.warehouse.dir` y típicamente es `/user/hive/warehouse/`  | Debemos agregar la palabra clave EXTERNAL y especificar el path de HDFS en la sección LOCATION  |
| En caso de realizar una operación de tipo DROP TABLE, Hive eliminaría la metadata de la tabla y los datos(1) | En caso de realizar una operación de tipo DROP TABLE, Hive eliminaría la metadata de la tabla pero no los datos |

## Tipos de datos
Hive, además de los tipos de datos comunes a todos los motores de bases de datos relacionales, ofrece una nueva categoría de tipos de datos complejos:

- ARRAY<data_type>
- MAP<primitive_type, data_type>
- STRUCT<col_name : data_type, ...>

## Formatos de Almacenamiento
Hive permite leer y escribir datos en diferentes formatos de archivos. Habitualmente se utilizan 2 formatos:
- CSV para los datos en bruto
- Parquet para los datos procesados

![Formatos_Almacenamiento.jpg](../_src/assets/Formatos_Almacenamiento.jpg)

## Particiones
El particionamiento es una forma de dividir una tabla en partes relacionadas en función de los valores de columnas particulares (por ej. fecha, la ciudad y el departamento). Cada tabla puede tener una o más claves de partición para identificar una partición particular. Esta forma de almacenar los datos permite realizar consultas mas eficientes.

![Hive_Particiones.jpg](../_src/assets/Hive_Particiones.jpg)
Enlace de Referencia: [Hive](https://cwiki.apache.org/confluence/display/Hive/Home)

## Hive SerDes
Acrónimo de Serializer/Deserializer. Permite interpretar diferentes formatos. SerDes disponibles en Hive:
- Avro (Hive 0.9.1 and later)
- ORC (Hive 0.11 and later)
- RegEx
- Thrift
- Parquet (Hive 0.13 and later)
- CSV (Hive 0.14 and later)
- JsonSerDe (Hive 0.12 and later in hcatalog-core)

![Hive_SerDes](../_src/assets/Hive_Ejemplo.jpg)
Enlace de Referencia: [SerDes](https://cwiki.apache.org/confluence/display/Hive/SerDe)

### Hue (Hadoop User Experience)
Es una interfaz web que permite ejecutar consultas SQL hacia diferentes motores de bases de datos, principalmente relacionados a Big Data.

**Bases de datos soportadas** --> [VER](https://docs.gethue.com/administrator/configuration/connectors/)
**Entorno de prueba gratuito** --> [VER](https://demo.gethue.com/hue/accounts/login?next=/)