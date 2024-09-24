# Formatos de almacenamiento
La elección de un formato correcto puede traducirse en mejoras de performance y reducción de costos.

![Formatos_Almacenamiento2.jpg](../_src/assets/Formatos_Almacenamiento.jpg)

## Factores de elección
Al momento de elegir un formato de almacenamiento, debemos considerar los siguientes puntos:

![row_column.jpg](../_src/assets/RowVsColumn.jpg)

**ROW vs COLUMN:** las consultas serán de tipo SELECT * o agregaciones AVG, SUM, etc

![SCHEMA EVOLUTION](../_src/assets/Schema_Evolution.jpg)

**SCHEMA EVOLUTION:** que sucede si debemos agregar, eliminar o modificar un campo

![COMPRESSION](../_src/assets/Compression.jpg)

**COMPRESSION:** equilibrio entre espacio en disco utilizado y tiempo de procesamiento

Enlace recomendado: Formatos de archivo de Big Data [IR](https://luminousmen.com/post/big-data-file-formats)

## CSV
Texto plano delimitado por el carácter de la coma (pueden utilizarse otros separadores). Generalmente este formato lo utilizan aplicaciones tradicionales para exportar datos hacia otros sistemas.

![CSV.jpg](../_src/assets/CSV.jpg)

## JSON

![JSON.jpg](../_src/assets/JSON.jpg)

## Avro
Almacena los datos en formato binario para reducir el tamaño y mejorar la performance. La definición de los datos (schema) se almacena en formato JSON. Es recomendable utilizarlo para consultas de tipo SELECT *.

![AVRO.jpg](../_src/assets/AVRO.jpg)

## Parquet
Es un formato de almacenamiento columnar que surge de la colaboración de Twitter y Cloudera. Los datos se almacenan en formato binario y al final del archivo se agrega la metadata (schema). Este formato es ideal para agregaciones AVG, SUM, etc.

![PARQUET.jpg](../_src/assets/PARQUET.jpg)

## En resumen...

![Resumen.jpg](../_src/assets/Resumen.jpg)

**Enlaces de referencia:**<br>
**Parquet** [VER](https://parquet.apache.org/documentation/latest/) (este enlace no funciona)<br>
**Avro** [VER](https://avro.apache.org/docs/current/) <br>
**JSON** [VER](https://www.json.org/json-es.html) <br>

## Herramientas de compresión de datos de Hadoop

1. gzip - org.apache.hadoop.io.compress.GzipCodec
2. bzip2 - org.apache.hadoop.io.compress.BZip2Codec
3. LZO - com.hadoop.compression.lzo.LzopCodec
4. Snappy - org.apache.hadoop.io.compress.SnappyCodec
5. Deflate - org.apache.hadoop.io.compress.DeflateCodec

### Ejemplo de Parquet y Snappy
![Ejemplo de Parquet y Snappy](../_src/assets/Parquet_Snappy.jpg)

