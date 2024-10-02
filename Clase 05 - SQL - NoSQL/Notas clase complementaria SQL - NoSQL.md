SQL - NoSQL 

# Base de datos SQL
Nace como herramienta para hacer consultas y almacenar tablas relacionadas.

Las tablas tienen formato tabular, tienen diferentes tipos de datos, permite las relaciones (JOINs) y tiene restricciones (PK y FK)

## Integridad
'que los números cuadren' Si hay redundancia, que los números sean coherentes (por ej: si existen dos tablas llamadas 'venta' y 'venta_detalle' y ambas tienen una columna 'monto' que sean coherentes significa que si en el detalle hay tres items correspondientes a una misma venta, que esa suma sea igual al valor hallado en la columna monto de la tabla 'venta')

# Base de datos NoSQL ("Not Only SQL")
en contexto de Big Data, permite organizar gran cantidad de datos heterogéneos, que se logra flexibilizando algunas restricciones de las bases de datos relacionales.
No necesariamente las características de SQL son las mismas que las de NoSQL

## Características:
- caso de uso específicos
- esquema flexible
- Escalabilidad horizontal --> debido a la arquitectura distribuida, se pueden hacer updates agregando nodos, permitiendo mayor capacidad de almacenamiento y mayor capacidad de procesamiento
- no utilizan SQL ni JOINs

# ACID vs BASE.
Son las características que definen los motores de base de datos SQL y NoSQL

## ACID (Atomicidad - Consistencia - Aislamiento - Durabilidad) 
Para entender este concepto es necesario entender el concepto de transacción.
**Transacción:** es una actualización que se le realiza a una tabla. Esta puede ser una INSERSIÓN, un UPDATE o un DELETE, o incluso una combinación de estas.

### Atomicidad
La ejecución de cada transacción es atómica. Se realizan todas las acciones o ninguna.
Esto quiere decir que si en el medio de la transacción (por ejemplo a la mitad de la carga de los datos) ocurre un error, se hace un "roll back", es decir que los cambios que estaban a punto de realizarse, antes de ocurrido el error (siempre en medio de una transacción), se vuelven para atrás,  y se pierde la data, no se hace ninguna acción. Esto es para mantener la **INTEGRIDAD** de los datos. 

### Consistencia
 Las transacciones tienen que estar pensadas de manera que cuadren las tablas.

### Aislamiento (Isolation)
Una transacción no puede afectar a otra.
Por ejemplo si se realiza una consulta (de parte de un analista) en medio de una transacción, la consulta no debe afectar a la transacción, por eso es que deben ser aisladas.
Por lo tanto, la consulta tiene dos opciones: devolver la información hasta antes de la transacción o esperar a que la transacción finalice (dejándome en espera, como analista).

### Durabilidad
Después de que se completa la transacción, se hace un COMMIT, para hacer un guardado seguro de la información.

## BASE (Básicamente disponible - Soft State - COnsistencia evencual)

### Básicamente disponible: 
Garantiza la disponibilidad de los datos, responde a cada solicitud. Esto significa que no te va a dejar en espera, si la consulta (o la nueva transacción), ocurre cuando está en medio de otra transacción. 
Esto significa que puede te va a devolver la data hasta donde está (en medio de la transacción), por lo que puede verse afectada la consistencia, ligeramente.

### Soft State: 
El estado del sistema puede cambiar en el tiempo (consistencia eventual). Por lo explicado anteriormente puede ser que en un momento determinado, haya alguna inconsistencia entre los datos, pero a lo largo del tiempo esa consistencia deseada/requerida, llega.

### Consistencia eventual: 
El sistema eventualmente es consistente una vez que termina de recibir datos, los datos se propagan y el sistema no checkea la consistencia de cada transacción antes de mover a la siguiente. Con este punto hay que tener cuidado.

En SQL, hay ciertas validaciones, por ejemplo, si se hace referencia a un forein key (FK), la primary key (PK) debe existir. En NoSQL, no hay ese tipo de validaciones.

***Preguntas***
*¿Qué significa ACID?* Atomicidad - Consistencia - Aislamiento - Durabilidad

*¿Qué significa BASE?* Básicamente disponible- Soft State - Consistencia eventual.

# Teorema CAP ("Consistency"-"Availability"-"Partition tolerance")
- Un sistema es considerado **consistente** si todas las réplicas contienen el mismo valor.
- Un sistema es considerado **disponible** si los datos están disponibles en todo momento.
- Un sistema tiene tolerancia a **particiones** si el procesamiento puede continuar en ambas particiones en dos o más 'islas'. Un ejemplo, es si está en una arquitectura *"cluster"* (de las que vimos hasta ahora).

> De acuerdo al teorema CAP, no es posible proveer simultáneamente más de dos de las tres propiedades (consistencia, disponibilidad, particionado)
>
>*simultáneamente* --> el momento en el que potencialmente puede ocurrir un fallo, el sistema de base de datos que estemos utilizando (SQL o NoSQL), tiene que priorizar dos de las tres propiedades, no puede priorizar las tres ya que es matemáticamente imposible.
![Teorema](../_src/assets/Teorema_CAP.jpg)
>  

-->*PARTICIÓN:* no se refiere a los índices (por ejemplo de MySQL), sino a tener una arquitectura distribuida, por ejemplo, en nodos (cluster Hadoop). MySQL no tiene arquitectura distribuida (tiene arquitectura cliente-servidor).

*Pregunta*
*¿Cuáles son las tres propiedades que según el teorema CAP no pueden cumplirse simultáneamente?* Consistencia - Disponibilidad - Tolerancia a la partición.
*¿El teorema CAP significa que vamos a perder una de las tres propiedades siempre?* **NO**