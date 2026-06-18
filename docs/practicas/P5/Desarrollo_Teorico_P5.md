# Práctica 5 – Material de Apoyo: Diseño Básico de Modelos Relacionales
## Facultad de Ingeniería
### BASES DE DATOS — PRÁCTICA 05 – MATERIAL DE APOYO
**Asignatura:** Bases de Datos  
**Universidad Nacional Autónoma de México**

---

## 1. Diseño Básico de Modelos Relacionales

### Contenido

1. [Diseño Básico de Modelos Relacionales](#1-diseño-básico-de-modelos-relacionales)
   1.1 [Introducción](#11-introducción)
   1.2 [Transformación de un modelo ER a un Modelo Relacional](#12-transformación-de-un-modelo-er-a-un-modelo-relacional)
   - 1.2.1 [Entidad Fuerte](#121-entidad-fuerte)
   - 1.2.2 [Entidades Débiles](#122-entidades-débiles)
   - 1.2.3 [Relaciones](#123-relaciones)
   - 1.2.4 [Relaciones recursivas](#124-relaciones-recursivas)
   1.3 [Notaciones para diseño lógico de una base de datos](#13-notaciones-para-diseño-lógico-de-una-base-de-datos)
   - 1.3.1 [Representación de entidades, atributos y llaves primarias](#131-representación-de-entidades-atributos-y-llaves-primarias)
   - 1.3.2 [Tipos de llaves en el modelo relacional](#132-tipos-de-llaves-en-el-modelo-relacional)
   - 1.3.3 [Representación de atributos compuestos](#133-representación-de-atributos-compuestos)
   - 1.3.4 [Representación de atributos multivalorados](#134-representación-de-atributos-multivalorados)
   - 1.3.5 [Representación de relaciones](#135-representación-de-relaciones)
   1.4. [Generación de modelos relacionales con ER/Studio](#14-generación-de-modelos-relacionales-con-erstudio)
   - 1.4.1. [Personalizar el editor](#141-personalizar-el-editor)
   - 1.4.2. [Creación de un nuevo modelo](#142-creación-de-un-nuevo-modelo)
   - 1.4.3. [Agregando objetos al modelo lógico](#143-agregando-objetos-al-modelo-lógico)
   - 1.4.4. [Elementos del modelo lógico](#144-elementos-del-modelo-lógico)
   - 1.4.5. [Generación de reportes](#145-generación-de-reportes)
   - 1.4.6. [Generando modelos físicos](#146-generando-modelos-físicos)

---

### 1.1 Introducción

El diseño lógico de una base de datos relacional consiste en el desarrollo de un modelo relacional que se obtiene a partir del modelo ER así como del enunciado y las reglas de negocio del caso de estudio.

---

### 1.2 Transformación de un modelo ER a un Modelo Relacional

Para obtener un modelo relacional a partir de un modelo Entidad-Relación se tienen varias reglas

#### 1.2.1 Entidad Fuerte

Toda entidad fuerte se transforma en una relación

- Se conservan los atributos y la llave primaria
- En claves candidatas se establece restricción de unicidad
- Atributos compuestos se colocan en forma individual
- Atributos multivalorados se crea una nueva relación propagando la llave primaria de la relación como foránea y primaria a la nueva relación.
- Atributos derivados o calculados se establece como atributo calculados
- Se establecen restricciones sobre atributos

**Simbología a utilizar**

- PRIMARY KEY (PK)
- UNIQUE (U)
- FOREIGN KEY (FK)
- CHECK (CK)
- Calculados (C)
- Discriminantes (D)
- No obligatorio (N)

**Ejemplo:**

```
PROFESOR={cveProf(PK),nomProf,apPat,apMat(N),rfcProf(U),edad(C)*CS1}
EMAILPROF={cveProf(PK,FK),email(PK)} ** cuidar la unicidad
*CS1 Se obtiene del rfc del profesor
```

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-1.png" alt="Ejemplo Entidad Fuerte - PROFESOR" width="60%">
</p>

---

#### 1.2.2 Entidades Débiles

- Se crea la relación conservando todos sus atributos y se propaga la llave principal de la entidad fuerte de la que depende.
- La llave principal se formará con la llave primaria de la entidad fuerte y el discriminante de la entidad débil

**Ejemplo:**

```
MATERIA= {claveMat(PK), nomMateria}
GRUPO= {[claveMat(FK), numGrupo(D)](PK), horario}
```

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-2.png" alt="Ejemplo Entidad Débil - MATERIA y GRUPO" width="60%">
</p>

---

#### 1.2.3. Relaciones

- **1:1** La llave primaria de una entidad se propaga a la otra entidad como llave foránea con la restricción de unicidad, dependiendo de la cardinalidad mínima, si la cardinalidad mínima es cero, se pasa el atributo de la entidad de cardinalidad uno, hacía la de cardinalidad cero, si en ambas es la misma cardinalidad, dependerá del contexto.

- **m:1 ó 1:m** La llave primaria de la entidad que tiene la cardinalidad uno se propaga a la relación de muchos como llave foránea.

- **m:m** Se genera una nueva relación que contendrá la llave primaria de cada una de las entidades que une, pero como llaves foráneas y juntas como llave primaria, además de sus atributos propios (descriptivos) de la relación.

Las relaciones (1:1, 1:m, m:1) que contengan atributos descriptivos, se tienen dos opciones

- Generar una nueva relación que contendrá la llave primaria de cada una de las entidades que une como llaves foráneas, además de sus atributos descriptivos, conservando la unicidad en la nueva relación.
- Propagar la llave primaria de la entidad uno junto con todos los atributos de la relación a la entidad m

---

#### 1.2.4 Relaciones recursivas

**Ejemplo:**

La llave primaria de la entidad pasa como llave foránea de la misma entidad.

```
EMPLEADO= {claveEmp(PK), nombreEmp, claveSup(FK)}
```

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-3.png" alt="Ejemplo Relación Recursiva - EMPLEADO" width="50%">
</p>

---

### 1.3. Notaciones para diseño lógico de una base de datos

Existen varias notaciones para realizar la construcción de un modelo relacional. Las 2 notaciones comúnmente empleadas en la industria del desarrollo de software son:

- Notación Crow's foot
- Notación IDEF1X

Ambas notaciones son muy similares. En esta sección se muestran las características de ambas haciendo énfasis en donde exista una diferencia entre ambas.

---

#### 1.3.1 Representación de entidades, atributos y llaves primarias

**Notación crow's foot e IDEF1X**

- Las entidades se representan por tablas. En el rectángulo superior se indica la llave primaria.
- Se sugiere que tanto el nombre de la tabla como el de los atributos se especifican en mayúsculas. Las palabras compuestas se separan por guion bajo.
- En lo posible omitir abreviaturas. Si se usan deben ser muy claras.
- Todos los atributos se consideran como obligatorios por default, por lo que para un atributo opcional se especifica con la palabra null.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-4.png" alt="Ejemplo tabla notación Crow's Foot - CLIENTE" width="65%">
</p>

---

#### 1.3.2 Tipos de llaves en el modelo relacional

| Clave principal en modelo ER | Tipo de llave primaria en modelo relacional |
|---|---|
| clave principal | llave primaria natural / llave primaria artificial |
| clave compuesta | llave primaria compuesta / llave primaria artificial o subrogada |
| clave candidata | llave candidata o alternativa |

- En el modelo relacional se sugiere en la medida de lo posible el uso de una **PK artificial** principalmente por los beneficios que ofrece:
  - Mejor rendimiento. El índice que genera una llave primaria tiene un mejor desempeño en valores numéricos de preferencia consecutivos.
  - Sin problemas de duplicidad
  - Sin probabilidad de cambio de valores

- Para el caso de una PK compuesta, se debe tener cuidado con su selección. Una PK compuesta implica la generación de combinaciones de valores de cada atributo lo cual pudiera ser incorrecto para algunos escenarios.

---

#### 1.3.3 Representación de atributos compuestos

| Diseño conceptual | Diseño lógico Crow's Foot e IDEF1X |
|---|---|

- En el diseño lógico, el atributo compuesto se omite, únicamente se incluyen los sub atributos.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-5.png" alt="Representación de atributos compuestos - ESTUDIANTE" width="75%">
</p>

---

#### 1.3.4 Representación de atributos multivalorados

| Diseño conceptual | Diseño lógico Crow's Foot e IDEF1X |
|---|---|

- El modelo relacional no soporta de forma directa la representación de un atributo multivalorado. Por cada registro y columna debe existir un solo valor.
- Para implementar este concepto se deberá crear una nueva tabla. A nivel general, la PK de la nueva tabla será una PK compuesta formada por la PK de la tabla, en este caso num_trabajador y por el atributo multivalorado, en este caso, teléfono.
- El ejemplo anterior la PK compuesta anterior no es del todo eficiente al ser compuesta y formada por un identificador más un número telefónico.
- Para resolver este detalle se puede especificar una PK artificial, dejando la llave natural indicada como única.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-6.png" alt="Representación de atributos multivalorados - TRABAJADOR y TRABAJADOR_TELEFONO" width="75%">
</p>

---

#### 1.3.5 Representación de relaciones

Las relaciones en el modelo relacional se representan a través de **llaves foráneas**. Para este concepto si existe diferencia entre las notaciones Crow's foot e IDEF1X.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-7.png" alt="Notación Crow's foot vs Notación IDEF1X" width="80%">
</p>

##### 1.3.5.1 Relaciones identificativas y no identificativas

Como se puede observar en el diagrama anterior, existe una diferencia importante entre el uso de una línea punteada o continua

- **Punteada:** Relación no identificativa, suave o débil
- **Continua:** Relación identificativa, dura, o fuerte
- En una relación identificativa la PK de la tabla padre se propaga como PK y FK en la tabla hija.
- En una relación no identificativa, la PK de la tabla hija se propaga únicamente como FK en la tabla hija

**Ejemplo:**

Curso y profesor 1:m

- **Un** profesor imparte **varios** cursos. 1:m
- **Un** curso es impartido por **un** profesor. 1:1

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-8.png" alt="Ejemplo relación 1:M Profesor-Curso" width="70%">
</p>

- Para una relación 1:m se emplea una relación no identificativa. Notar que la PK profesor_id se propaga únicamente como FK hacia la tabla hija curso.
- La FK siempre se debe ubicar en la tabla que tiene la cardinalidad muchos o many (m). En este ejemplo, corresponde con el valor *. Un profesor imparte varios cursos, por lo tanto, la FK deberá ubicarse en la tabla curso.

##### 1.3.5.2 Relaciones 1:1

Las relaciones 1:1 se tienen diferentes técnicas. La solución final depende en buena medida de las reglas de negocio.

**Ejemplo:**

Estudiante y Credencial 1:1

A cada estudiante se le asigna su credencial 1:1
Una credencial se le asigna a un solo estudiante 1:1

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-9.png" alt="Ejemplo relación 1:1 Estudiante-Credencial" width="70%">
</p>

Si una entidad tiene cardinalidad mínima 0 dicha tabla recibe la fk, no olvidar colocar unique para conservar la unicidad

##### 1.3.5.3 Relaciones unarias o recursivas

El siguiente ejemplo muestra la representación de una relación unaria

Cada farmacia cuenta con su centro de distribución a partir del cual se le proporcionan sus medicamentos. Un centro de distribución almacena grandes cantidades de medicamentos para distribuir a otras farmacias. El centro de distribución también se considera como farmacia ya que ahí mismo se atienden a los clientes.

De lo anterior:

- Una farmacia cuenta con su farmacia de distribución (centro de distribución) 1:1
- Una farmacia de distribución surte medicamentos a varias farmacias 1:m

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-10.png" alt="Ejemplo relación unaria - Farmacia" width="65%">
</p>

- En este ejemplo la tabla farmacia representa a la entidad **hija**, y la farmacia de distribución que es en sí una farmacia representa a la tabla **padre**.
- La cardinalidad (0,1) indica que no todas las farmacias están asociadas a una farmacia de distribución. Las reglas anteriores indican lo contrario, pero existe un caso de excepción: Las farmacias de distribución por ser consideradas como tal no cuentan a su vez con una farmacia de distribución. Para todas ellas, el valor de la FK deberá ser nula.
- A nivel general, una FK que proviene de la misma tabla siempre deberá ser marcada como null.

##### 1.3.5.4 Relaciones muchos a muchos

En modelo relacional las relaciones m:m, Se requiere descomponer la relación en 2 relaciones 1:m haciendo uso de una tabla intermedia.

En una relación m:m la PK de la tabla intermedia es compuesta. Esto permite relacionar ambas tablas. Las combinaciones de la PK compuesta generan la relación m:m, es decir, un mismo partido puede asociarse con varios jugadores, y un mismo jugador puede asociarse con varios partidos.

Los atributos que se asignan a la tabla intermedia tienen sentido únicamente con la combinación de los valores de la PK. En el ejemplo, el número de anotaciones depende de ambas cosas, del jugador que las realizó en un partido en específico.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-11.png" alt="Ejemplo relación muchos a muchos - PARTIDO y JUGADOR" width="70%">
</p>

---

### 1.4. Generación de modelos relacionales con ER/Studio

ER/Studio es una herramienta que permite realizar modelos relacionales empleando varias notaciones. Su uso es sencillo, permite generar modelos físicos a partir de modelos relacionales para diversos RDBMS como SQLServer, Oracle, DB2, PostgreSQL, etc.

Para realizar el modelado de datos se hará uso de ER/Studio V8. A continuación, se presenta una breve descripción del uso de la herramienta y su configuración requerida para generar modelos de datos.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-12.png" alt="ER/Studio - Vista general del editor con modelo de viajes" width="75%">
</p>

#### 1.4.1. Personalizar el editor

Antes de iniciar con el editor, es conveniente realizar algunos ajustes a la apariencia, así como algunos valores por default, principalmente para homologar las vistas de los diagramas generados. Para realizar esta personalización, Abrir ER/Studio, (no crear un nuevo modelo), seleccionar `Tools -> Options`.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-13.png" alt="ER/Studio - Menú Tools Options" width="75%">
</p>

Aparecerá una ventana de opciones. Aplicar las configuraciones como se muestra en la imagen, pestaña **Logical**

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-14.png" alt="ER/Studio - Configuración pestaña Logical" width="65%">
</p>

En la pestaña **Physical**, aplicar los siguientes cambios:

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-15.png" alt="ER/Studio - Configuración pestaña Physical" width="65%">
</p>

En la pestaña **Name handling**, seleccionar las opciones como se indica en la siguiente imagen

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-16.png" alt="ER/Studio - Configuración pestaña Name Handling" width="65%">
</p>

En la pestaña **Display**, seleccionar las opciones como se indica en la siguiente imagen:

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-17.png" alt="ER/Studio - Configuración pestaña Display" width="65%">
</p>

Finalmente, en caso de requerir modificar la notación para un diagrama en particular y no a nivel global como se indicó en las imágenes anteriores, realizar las siguientes acciones:

A. Seleccionar la opción `View -> Diagram and object display options` o en su defecto, seleccionar el ícono como se muestra en la siguiente figura.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-18.png" alt="ER/Studio - Barra de herramientas, ícono de opciones de despliegue" width="75%">
</p>

B. Seleccionar la pestaña **Relationships**. Aparecerá una pantalla en la que se podrá modificar la notación sólo para el diagrama en turno.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-19.png" alt="ER/Studio - Pestaña Relationships" width="65%">
</p>

---

#### 1.4.2. Creación de un nuevo modelo

ER/Studio permite la creación de un nuevo modelo de datos a partir de 3 fuentes distintas. Seleccionar: `file -> new -> Draw a new data model`

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-20.png" alt="ER/Studio - Ventana Create a New Model" width="50%">
</p>

Observar que es posible crear un modelo a partir de una base de datos existente, o realizar la importación de un modelo de ERWin.

---

#### 1.4.3. Agregando objetos al modelo lógico

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-21.png" alt="ER/Studio - Árbol del modelo lógico (Entities, Views, Relationships, Users, Roles, Shapes)" width="75%">
</p>

Al crear el nuevo modelo, por default se crea un **modelo lógico** (independiente del manejador). Se muestran del lado izquierdo los elementos del modelo: entidades, vistas, relaciones, usuarios. En ER/Studio un modelo lógico corresponde con el concepto de "Modelo relacional" revisado en clase. El modelo lógico de ER/Studio permite crear un modelo relacional con características estándares y puede ser implementado para diversos RDBMs.

---

#### 1.4.4. Elementos del modelo lógico

Para iniciar con la creación de los elementos del modelo de datos, se emplea la barra de herramientas

##### 1.4.4.1. Creación de entidades

Seleccionar `insert -> Entity`, o hacer clic en el icono que se muestra a continuación

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-22.png" alt="ER/Studio - Creación de entidad en el editor" width="75%">
</p>

##### 1.4.4.2. Atributos de una entidad

Para agregar los atributos a una entidad, seleccionar la entidad en el editor, dar doble clic, o clic derecho `-> edit entity`. En la pantalla que aparece, seleccionar la opción **Add**.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-23.png" alt="ER/Studio - Ventana Edit Entity, pestaña Attributes - ESTUDIANTE" width="75%">
</p>

Observar el combo que muestra los tipos de datos. Estos corresponden a los tipos de datos que define el estándar SQL. Al terminar de agregar los atributos de la entidad, el resultado es un diagrama como el siguiente:

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-24.png" alt="ER/Studio - Entidad SOLICITUD con atributos completos" width="60%">
</p>

##### 1.4.4.3. Documentación de entidades y atributos

Es muy importante que el modelo esté bien documentado, tanto a nivel tabla como a nivel atributo. Esta documentación permitirá entre otras cosas transmitir el conocimiento y entendimiento del modelo. En ER/Studio se agrega la documentación seleccionada en la pestaña **definition**.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-25.png" alt="ER/Studio - Pestaña Definition de la entidad PASAJERO" width="75%">
</p>

##### 1.4.4.4. Asociación de entidades empleando relaciones

La asociación se realiza a partir de los tipos de relaciones vistos en clase:

- Relaciones identificativas
- Relaciones no identificativas obligatorias
- Relaciones no identificativas opcionales
- Subtipos

Para seleccionar alguno de los tipos de relación, hacer clic en alguno de los íconos mostrados en la figura.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-26.png" alt="ER/Studio - Barra de herramientas con tipos de relación y entidad ESTUDIANTE" width="75%">
</p>

Para asociar 2 entidades:

I. Hacer clic en el icono que representa el tipo de relación a usar.
II. Hacer clic sobre la entidad origen
III. Hacer clic sobre la entidad destino (la tabla que contendrá la FK).
IV. Al final, se obtiene un modelo como el siguiente:

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-27.png" alt="ER/Studio - Modelo completo VIAJE con relaciones VIAJE, STATUS_VIAJE, LUGAR, HISTORICO_STATUS_VIAJE" width="80%">
</p>

Observar que los valores de la cardinalidad se deben escribir de forma manual, empleando la herramienta de texto mostrada en la imagen.

##### 1.4.4.5. Opciones para relaciones

Al hacer doble clic en la línea que representa la relación, aparecerá una ventana como la siguiente, en la que se puede personalizar o modificar las propiedades de la relación.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-28.png" alt="ER/Studio - Ventana propiedades de relación ESTATUS_VIAJE - VIAJE" width="65%">
</p>

Algunas de las opciones que se pueden modificar son:

- Tipo de relación
- Cardinalidad
- Role name (cambio del nombre de la FK)

##### 1.4.4.6. Cambio del nombre a la FK

En algunas situaciones es conveniente cambiar el nombre a la FK para tener una mayor comprensión del modelo.

**Ejemplo:**

Suponer que se desea cambiar el nombre de la FK: `entrenador_id` A `director_tecnico_id`.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-29.png" alt="ER/Studio - Tablas EQUIPO y ENTRENADOR antes de cambiar FK" width="70%">
</p>

Para realizar el cambio, seleccionar la pestaña **Role Name** mostrada en la figura anterior, aparecerá una pantalla como la siguiente:

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-30.png" alt="ER/Studio - Pestaña RoleName de la relación ENTRENADOR-EQUIPO" width="65%">
</p>

Para cambiar el nombre, dar doble clic al registro que aparece en la pantalla anterior, aparecerá una nueva pantalla como la siguiente en la que se captura el nombre de la FK:

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-31.png" alt="ER/Studio - Ventana cambio Logical Rolename a DIRECTOR_TECNICO_ID" width="65%">
</p>

Para el caso de relaciones unarias, la herramienta por default, presenta una pantalla para cambiar el nombre al momento de establecer la FK hacia la misma tabla:

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-32.png" alt="ER/Studio - Ventana relación unaria JUGADOR, Logical Rolename LIDER_GPO_ID" width="65%">
</p>

---

#### 1.4.5. Generación de reportes

Con ER/Studio es posible crear reportes en formato RTF o en formato HTML que describen de forma detallada todas las opciones del modelo. Para generar el reporte, seleccionar `Tools -> Generate Reports`.

- Seleccionar la creación de un reporte HTML, seguir las indicaciones en pantalla.
- En el segundo paso, seleccionar las pestañas **Diagram** y **Data Dictionary**, seleccionar todas las opciones.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-33.png" alt="ER/Studio - Wizard Generate Reports, selección de objetos del modelo" width="75%">
</p>

Al final del proceso, el reporte HTML que se genera es el siguiente:

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-34.png" alt="Reporte HTML generado por ER/Studio - Tabla PASAJERO con DDL Code" width="80%">
</p>

##### 1.4.5.1. Exportando diagramas

ER/Studio permite exportar un diagrama en diferentes formatos. Uno de ellos es a través de una imagen. Esta última opción es útil sobre todo para efectos del reporte de la práctica. Para realizar este proceso seleccionar `File->Export Image`. Aparecerá una pantalla similar a la siguiente.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-35.png" alt="ER/Studio - Ventana Export Image con opciones de tipo, contenido y tamaño" width="60%">
</p>

Observar que es posible seleccionar un conjunto de tablas (tal vez no se desea generar una imagen con todo el diagrama) y generar un diagrama solo para las tablas seleccionadas haciendo clic en la opción "Selected Objects Only".

Para efectos del reporte se recomienda emplear esta funcionalidad de tal forma que los diagramas que se incluirán en el reporte sean claros y fáciles de leer.

Se recomienda adicionalmente, no dejar demasiado espacio entre tablas para que el tamaño de todos los objetos sea lo más grande posible.

---

#### 1.4.6. Generando modelos físicos

Cuando se inicia la construcción de un modelo de datos se prefiere empezar por la creación de un modelo lógico, es decir, un modelo que es totalmente independiente del manejador. Este diagrama emplea únicamente las definiciones del estándar SQL. En la siguiente imagen se muestra un ejemplo de un modelo lógico, observar el color azul de la carpeta.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-36.png" alt="ER/Studio - Árbol modelo UNIVERSIDAD.DM1 con carpeta Logical en azul" width="45%">
</p>

Una vez que se ha concluido con la creación, revisión y validación exitosa del modelo lógico, es posible crear un modelo físico.

El modelo físico se genera de manera automática para un RDBMS en particular. En ER/Studio se puede generar haciendo clic derecho en el ícono `Logical -> Generate physical Model`. Aparecerá una pantalla similar a la siguiente en la que se configuran las opciones para generar el modelo. Observar la creación del nuevo modelo empleado una estructura de color verde.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-37.png" alt="ER/Studio - Wizard Generate Physical Model y árbol UNIVERSIDAD.DM1 con carpeta oracle en verde" width="75%">
</p>

Uno de los principales usos de un modelo físico es que ER/Studio puede generar el código SQL para crear la estructura de todos los objetos de una base de datos. Para generar el código SQL seleccionar la opción que se muestra en la siguiente figura:

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-38.png" alt="ER/Studio - Barra de herramientas, ícono Generate SQL Code" width="75%">
</p>

Al seleccionar la opción anterior (Generación de código SQL), aparecerá una serie de opciones empleadas para personalizar la generación de código SQL.

En general, todas las opciones se pueden dejar con sus valores por default, excepto las opciones indicadas en la siguiente figura que corresponden a la segunda pantalla que se muestra al hacer clic en "Next".

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-39.png" alt="ER/Studio - Wizard de generación de modelo físico, plataforma Oracle 11g" width="75%">
</p>

En la imagen anterior se han modificado 2 opciones:

- **Generate foreign key Constraints:**
  - *Implement vía create table.* Permite crear las restricciones de referencia dentro de la definición de la tabla en lugar de crearlas empleando la instrucción alter table.
  - *Generate tables in dependency Order.* Permite crear las tablas en el orden correcto de tal forma que primero sean creadas las tablas "padre" y después las tablas dependientes.

<p align="center">
  <img src="/docs/rs/imgPracticas/DP5-40.png" alt="ER/Studio - Opciones Generate Other Object Types, Referential Integrity Implementation" width="65%">
</p>

Finalmente, para mostrar el código SQL, hacer clic en "SQL Preview".

Una vez que se han aplicado las configuraciones descritas en este documento, continuar con los ejercicios de esta práctica.

---
*Martha López Pelcastre — martha.lopez@ingenieria.unam.edu*