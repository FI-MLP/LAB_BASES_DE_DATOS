# Práctica 07: Diseño Avanzado de Modelos Relacionales - Material de Apoyo
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 07

**Asignatura:** Laboratorio de Bases de Datos  
**Maestra:** M.I.A. Martha López Pelcastre  
**Universidad Nacional Autónoma de México**

---

## Contenido
1. [DISEÑO AVANZADO DE MODELOS RELACIONALES](#)

    1.1. [Introducción](#11-introducción)
        
    1.2. [Transformación de un modelo ER a un Modelo Relacional.](#12-transformación-de-un-modelo-er-a-un-modelo-relacional)
    
    1.2.1 [Generalización no exclusiva](#121-generalización-no-exclusiva)

    1.2.2 [Generalización exclusiva](#122-generalización-exclusiva)

    1.2.3 [Especialización no exclusiva](#123-especialización-no-exclusiva)

    1.2.4 [Especialización exclusiva](#124-especialización-exclusiva)


    1.2.5 [Agregació](#125-agregación)

    1.2.6 [Históricos](#126-históricos)
---

## 1.1. Introducción

El alumno reafirmará los conocimientos adquiridos para realizar la elaboración de diagramas Entidad Relación empleando **notación CHEN** y herramientas CASE para construir modelos de datos de mayor complejidad (modelo extendido).

---

## 1.2 Transformación de un modelo ER a un Modelo Relacional.

Para la transformación del modelo ER extendido al modelo relacional, considerar los siguientes casos:

### 1.2.1 Generalización no exclusiva

|Generalización no exclusiva – traslape total (OVERLAPPING,TOTAL)|Diseño conceptual|
|:-----:|:-----:|
|Regla de negocio: Un empleado debe contar con al menos un rol|<p align="center"><img src="/docs/rs/P7GeneralizacionNoExclusiva.png" alt="Generalización no exclusiva - Traslape Total" width="85%"></p>|
||**Diseño Lógico Notación Crow’s Foot**|
|Regla de negocio: Un empleado debe contar con al menos un rol. Las Pk son heredadas por los subtipos. Se crea una relación para el discriminante vultivalorado|<p align="center"><img src="/docs/rs/P7GeneralizacionNoExclusivaCrowFoot.png" alt="Generalización no exclusiva - Traslape Total" width="85%"></p>|
|Uso de banderas para el discriminante multivalorado|<p align="center"><img src="/docs/rs/P7GeneralizacionNoExclusivaCrowFoot2.png" alt="Generalización no exclusiva - Traslape Total" width="85%"></p>|
||**Notación IDEF1X**|
|Para indicar traslape se emplea una letra “O” (Overlapping)|<p align="center"><img src="/docs/rs/P7GeneralizacionNoExclusivaIDEFX1.png" alt="Generalización no exclusiva - Traslape Total" width="85%"></p>|

---

### 1.2.2 Generalización exclusiva

|Generalización exclusiva – Excluyente total (Disjoint total)|Diseño conceptual|
|:-----:|:-----:|
|Regla de negocio: un empleado debe tener uno y un solo rol Circulo arriba del triángulo indica restricción total Arco indica restricción de exclusión|<p align="center"><img src="/docs/rs/P7GeneralizacionExclusiva.png" alt="Generalización exclusiva - Traslape Total" width="85%"></p>|
||**Diseño Lógico Notación Crow’s Foot**|
|Los subtipos heredan la Pk del supertipo. La cruz en el semicírculo determina la exclusividad. El discriminante se modela como char(1). No existe notación para restricción tota|<p align="center"><img src="/docs/rs/P7GeneralizacionExclusivaCrowFoot.png" alt="Generalización exclusiva - Traslape Total" width="85%"></p>|
||**Notación IDEF1X**|
|Se usa una letra “D” (disjoint) para representar exclusión. Para representar restricción total se usan 2 líneas abajo del círculo.|<p align="center"><img src="/docs/rs/P7GeneralizacionNoExclusivaIDEFX1.png" alt="Generalización exclusiva - Traslape Total" width="85%"></p>|

---

### 1.2.3 Especialización no exclusiva

|Especialización no excluyente – Traslape parcial (Overlaping partial)|Diseño conceptual|
|:-----:|:-----:|
|Regla de negocio: Un empleado debe contar con al menos un rol|<p align="center"><img src="/docs/rs/P7EspecializacionNoExclusiva.png" alt="Especialización no exclusiva" width="85%"></p>|
||**Diseño Lógico Notación Crow’s Foot**|
|En Crow’s foot el diseño no varia con respecto a una restricción de traslape total, salvo en la relación (0,*)|<p align="center"><img src="/docs/rs/P7EspecializacionNoExclusivaCrowFoot.png" alt="Especialización no exclusiva" width="85%"></p>|
|Uso de banderas|<p align="center"><img src="/docs/rs/P7EspecializacionNoExclusivaCrowFoot2.png" alt="Especialización no exclusiva" width="85%"></p>|
||**Notación IDEF1X**|
|En IDEF1X se emplea una sola línea para indicar una restricción parcial. O para indicar overlaping|<p align="center"><img src="/docs/rs/P7EspecializacionNoExclusivaIDEF1X.png" alt="Especialización no exclusiva" width="85%"></p>|

---

### 1.2.4 Especialización exclusiva

|Especialización excluyente- excluyente parcial (Disjoin partial)|Diseño conceptual|
|:-----:|:-----:|
|Regla de negocio: un empleado puede tener uno y un solo rol. Discriminante opcional|<p align="center"><img src="/docs/rs/P7EspecializacionExclusiva.png" alt="Especialización exclusiva" width="85%"></p>|
||**Diseño Lógico Notación Crow’s Foot**|
|El discriminante se define como un atributo opcional (NULL). En crow’s foot no existe notación para restricción excluyente parcial.|<p align="center"><img src="/docs/rs/P7EspecializacionExclusivaCrowFoot.png" alt="Especialización exclusiva" width="85%"></p>|
||**Notación IDEF1X**|
|Se usa una línea para indicar restricción parcial D para indicar disjoin|<p align="center"><img src="/docs/rs/P7EspecializacionExclusivaIDEF1X.png" alt="Especialización exclusiva" width="85%"></p>|


---

### 1.2.5 Agregación

a) Se traduce primero la **relación interna** de la agregación, lo que dará lugar a una tabla T cuya PK permita identificar las instancias de la relación (sea una nueva tabla, una de las ya existentes en la que se propagó la PK de la otra, o una unificación).

b) Luego se traduce la **relación de la que participa la agregación**, considerando que participa con la tabla T.

---

#### 1.2.6 Históricos

<p align="center">
  <img src="/docs/rs/P7Historicos.png" alt="Ejemplo de históricos - Instructor/Alumno/Tipo_Cinta" width="85%">
</p>

<p align="center">
  <img src="/docs/rs/P7Historicos2.png" alt="Ejemplo de históricos - Instructor/Alumno/Tipo_Cinta" width="85%">
</p>


**Acerca de catálogos:**

- Observar el diseño de la tabla tipo_cinta. Se trata de una tabla que contiene los datos del catálogo de tipos de cinta. Este catálogo se considera como estático ya que sus valores no son modificados y tampoco se agregan nuevos.

- En cuanto a la cardinalidad, observar la participación opcional. Generalmente en una relación entre una entidad con un catálogo, la participación es opcional: la existencia de un elemento del catálogo no requiere la existencia de un registro en la tabla hija.

**Acerca del histórico:**
- Observar que en la tabla alumno se guarda el valor de la cinta actual en la columna color y su fecha de nivel en la columna fecha_nivel. Estos 2 campos se duplican en la tabla asigna_historico.

- Se emplea un catálogo estático para representar a cada una de las cintas.

- Se prefiere el uso de un catálogo ya que se emplea en 2 tablas.

- La forma en la que trabaja este modelo es la siguiente: Cuando el alumno tiene una nueva cinta, la actual pasa a la tabla asigna_historico y en la tala alumno se registra la cinta actual

- Sucede algo similar con el profesor, en la tabla dirige_historico2 se registran todos los alumnos que ha dirigido y la fecha.

---



