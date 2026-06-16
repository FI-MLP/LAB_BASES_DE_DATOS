# Práctica 05 – Material de Apoyo: Diseño Básico de Modelos Relacionales
## Facultad de Ingeniería
### BASES DE DATOS — PRÁCTICA 05 – MATERIAL DE APOYO

**Asignatura:** Bases de Datos  
**Maestra:** M.I.A. Martha López Pelcastre  
**Universidad Nacional Autónoma de México**

---

## Contenido

1. [Introducción](#11-introducción)
2. [Transformación de un modelo ER a un Modelo Relacional](#12-transformación-de-un-modelo-er-a-un-modelo-relacional)
   - [1.2.1 Entidad Fuerte](#121-entidad-fuerte)
   - [1.2.2 Entidades Débiles](#122-entidades-débiles)
   - [1.2.3 Relaciones](#123-relaciones)
   - [1.2.4 Relaciones Recursivas](#124-relaciones-recursivas)
3. [Notaciones para diseño lógico de una base de datos](#13-notaciones-para-diseño-lógico-de-una-base-de-datos)
   - [1.3.1 Representación de entidades, atributos y llaves primarias](#131-representación-de-entidades-atributos-y-llaves-primarias)
   - [1.3.2 Tipos de llaves en el modelo relacional](#132-tipos-de-llaves-en-el-modelo-relacional)
   - [1.3.3 Representación de atributos compuestos](#133-representación-de-atributos-compuestos)
   - [1.3.4 Representación de atributos multivalorados](#134-representación-de-atributos-multivalorados)
   - [1.3.5 Representación de relaciones](#135-representación-de-relaciones)
4. [Generación de modelos relacionales con ER/Studio](#14-generación-de-modelos-relacionales-con-erstudio)

---

## 1.1 Introducción

El diseño lógico de una base de datos relacional consiste en el desarrollo de un modelo relacional que se obtiene a partir del modelo ER así como del enunciado y las reglas de negocio del caso de estudio.

---

## 1.2 Transformación de un modelo ER a un Modelo Relacional

Para obtener un modelo relacional a partir de un modelo Entidad-Relación se tienen varias reglas.

### 1.2.1 Entidad Fuerte

Toda entidad fuerte se transforma en una relación:

- Se conservan los atributos y la llave primaria
- En claves candidatas se establece restricción de unicidad
- Atributos compuestos se colocan en forma individual
- Atributos multivalorados: se crea una nueva relación propagando la llave primaria de la relación como foránea y primaria a la nueva relación
- Atributos derivados o calculados se establece como atributo calculado
- Se establecen restricciones sobre atributos

**Simbología a utilizar:**

| Símbolo | Significado |
|---------|-------------|
| PK | PRIMARY KEY |
| U  | UNIQUE |
| FK | FOREIGN KEY |
| CK | CHECK |
| C  | Calculados |
| D  | Discriminantes |
| N  | No obligatorio |

**Ejemplo:**

```
PROFESOR = {cveProf(PK), nomProf, apPat, apMat(N), rfcProf(U), edad(C)*CS1}
EMAILPROF = {cveProf(PK,FK), email(PK)} **cuidar la unicidad   
```


*CS1 Se obtiene del rfc del profesor

<p align="center">
  <img src="/docs/rs/P5MatApoyoEntidadFuerte.png" alt="Ejemplo Entidad Fuerte" width="60%">
</p>

---

### 1.2.2 Entidades Débiles

- Se crea la relación conservando todos sus atributos y se propaga la llave principal de la entidad fuerte de la que depende.
- La llave principal se formará con la llave primaria de la entidad fuerte y el discriminante de la entidad débil.

**Ejemplo:**

```
MATERIA = {claveMat(PK), nomMateria}
GRUPO   = {[claveMat(FK), numGrupo(D)](PK), horario}
```

<p align="center">
  <img src="/docs/rs/P5MatApoyoEntidadDebil.png" alt="Ejemplo Entidad Débil" width="60%">
</p>

---

### 1.2.3 Relaciones

- **1:1** — La llave primaria de una entidad se propaga a la otra entidad como llave foránea con la restricción de unicidad, dependiendo de la cardinalidad mínima. Si la cardinalidad mínima es cero, se pasa el atributo de la entidad de cardinalidad uno hacia la de cardinalidad cero; si en ambas es la misma cardinalidad, dependerá del contexto.
- **m:1 ó 1:m** — La llave primaria de la entidad que tiene la cardinalidad uno se propaga a la relación de muchos como llave foránea.
- **m:m** — Se genera una nueva relación que contendrá la llave primaria de cada una de las entidades que une, pero como llaves foráneas y juntas como llave primaria, además de sus atributos propios (descriptivos) de la relación.

Las relaciones (1:1, 1:m, m:1) que contengan atributos descriptivos tienen dos opciones:
- Generar una nueva relación que contendrá la llave primaria de cada una de las entidades que une como llaves foráneas, además de sus atributos descriptivos, conservando la unicidad en la nueva relación.
- Propagar la llave primaria de la entidad uno junto con todos los atributos de la relación a la entidad m.

---

### 1.2.4 Relaciones Recursivas

La llave primaria de la entidad pasa como llave foránea de la misma entidad.

**Ejemplo:**

```
EMPLEADO = {claveEmp(PK), nombreEmp, claveSup(FK)}
```

<p align="center">
  <img src="/docs/rs/P5MatApoyoRelacionRecursiva.png" alt="Ejemplo Relación Recursiva" width="50%">
</p>

---

## 1.3 Notaciones para diseño lógico de una base de datos

Existen varias notaciones para realizar la construcción de un modelo relacional. Las 2 notaciones comúnmente empleadas en la industria del desarrollo de software son:

- **Notación Crow's Foot**
- **Notación IDEF1X**

Ambas notaciones son muy similares. En esta sección se muestran las características de ambas haciendo énfasis en donde exista una diferencia entre ellas.

---

### 1.3.1 Representación de entidades, atributos y llaves primarias

**Notación Crow's Foot e IDEF1X:**

- Las entidades se representan por tablas. En el rectángulo superior se indica la llave primaria.
- Se sugiere que tanto el nombre de la tabla como el de los atributos se especifiquen en **MAYÚSCULAS**. Las palabras compuestas se separan por guion bajo.
- En lo posible omitir abreviaturas. Si se usan deben ser muy claras.
- Todos los atributos se consideran como obligatorios por default; para un atributo opcional se especifica con la palabra `null`.

<p align="center">
  <img src="/docs/rs/P5MatApoyoTablaEjemplo.png" alt="Ejemplo tabla notación Crow's Foot" width="65%">
</p>

---

### 1.3.2 Tipos de llaves en el modelo relacional

| Clave principal en modelo ER | Tipo de llave primaria en modelo relacional |
|-----------------------------|---------------------------------------------|
| Clave principal | Llave primaria natural / Llave primaria artificial |
| Clave compuesta | Llave primaria compuesta / Llave primaria artificial o subrogada |
| Clave candidata | Llave candidata o alternativa |

En el modelo relacional se sugiere en la medida de lo posible el uso de una **PK artificial** principalmente por los beneficios que ofrece:
- Mejor rendimiento (el índice tiene mejor desempeño en valores numéricos de preferencia consecutivos)
- Sin problemas de duplicidad
- Sin probabilidad de cambio de valores

Para el caso de una PK compuesta, se debe tener cuidado con su selección, ya que implica la generación de combinaciones de valores de cada atributo, lo cual pudiera ser incorrecto para algunos escenarios.

---

### 1.3.3 Representación de atributos compuestos

En el diseño lógico, el atributo compuesto se omite; únicamente se incluyen los **sub atributos**.

<p align="center">
  <img src="/docs/rs/P5MatApoyoAtributoCompuesto.png" alt="Representación de atributos compuestos" width="75%">
</p>

---

### 1.3.4 Representación de atributos multivalorados

El modelo relacional no soporta de forma directa la representación de un atributo multivalorado. Por cada registro y columna debe existir un solo valor.

Para implementar este concepto se deberá crear una nueva tabla. A nivel general, la PK de la nueva tabla será una PK compuesta formada por la PK de la tabla padre y por el atributo multivalorado.

> 💡 Para resolver la PK compuesta (que puede no ser eficiente), se puede especificar una **PK artificial**, dejando la llave natural indicada como única.

<p align="center">
  <img src="/docs/rs/P5MatApoyoAtributoMultivalorado.png" alt="Representación de atributos multivalorados" width="75%">
</p>

---

### 1.3.5 Representación de relaciones

Las relaciones en el modelo relacional se representan a través de **llaves foráneas**. Para este concepto sí existe diferencia entre las notaciones Crow's Foot e IDEF1X.

<p align="center">
  <img src="/docs/rs/P5MatApoyoRelaciones.png" alt="Notaciones de relaciones Crow's Foot e IDEF1X" width="80%">
</p>

#### 1.3.5.1 Relaciones identificativas y no identificativas

| Tipo de línea | Tipo de relación |
|---------------|-----------------|
| Punteada | Relación no identificativa, suave o débil |
| Continua | Relación identificativa, dura o fuerte |

- En una **relación identificativa**, la PK de la tabla padre se propaga como PK y FK en la tabla hija.
- En una **relación no identificativa**, la PK de la tabla padre se propaga únicamente como FK en la tabla hija.

> La FK siempre se debe ubicar en la tabla que tiene la cardinalidad **muchos** o **many** (m/*).

<p align="center">
  <img src="/docs/rs/P5MatApoyoRelacion1M.png" alt="Ejemplo relación 1:M Profesor-Curso" width="70%">
</p>

#### 1.3.5.2 Relaciones 1:1

Las relaciones 1:1 se tienen diferentes técnicas. La solución final depende en buena medida de las reglas de negocio.

> Si una entidad tiene cardinalidad mínima 0, dicha tabla recibe la FK; no olvidar colocar `UNIQUE` para conservar la unicidad.

<p align="center">
  <img src="/docs/rs/P5MatApoyoRelacion11.png" alt="Ejemplo relación 1:1 Estudiante-Credencial" width="70%">
</p>

#### 1.3.5.3 Relaciones unarias o recursivas

<p align="center">
  <img src="/docs/rs/P5MatApoyoRelacionUnaria.png" alt="Ejemplo relación unaria - Farmacia" width="65%">
</p>

> A nivel general, una FK que proviene de la misma tabla siempre deberá ser marcada como `NULL`.

#### 1.3.5.4 Relaciones muchos a muchos

En el modelo relacional las relaciones m:m requieren descomponer la relación en 2 relaciones 1:m haciendo uso de una **tabla intermedia**.

En una relación m:m la PK de la tabla intermedia es compuesta. Los atributos que se asignan a la tabla intermedia tienen sentido únicamente con la combinación de los valores de la PK.

<p align="center">
  <img src="/docs/rs/P5MatApoyoRelacionMM.png" alt="Ejemplo relación muchos a muchos" width="70%">
</p>

---

## 1.4 Generación de modelos relacionales con ER/Studio

ER/Studio es una herramienta que permite realizar modelos relacionales empleando varias notaciones. Su uso es sencillo y permite generar modelos físicos a partir de modelos relacionales para diversos RDBMS como SQLServer, Oracle, DB2, PostgreSQL, etc.

### 1.4.1 Personalizar el editor

Antes de iniciar con el editor, es conveniente realizar algunos ajustes a la apariencia y valores por default. Abrir ER/Studio (no crear un nuevo modelo) y seleccionar `Tools -> Options`.

<p align="center">
  <img src="/docs/rs/P5ERStudioOptions.png" alt="ER/Studio - Tools Options" width="75%">
</p>

**Pestaña Logical:**

<p align="center">
  <img src="/docs/rs/P5ERStudioLogical.png" alt="ER/Studio - Configuración pestaña Logical" width="65%">
</p>

**Pestaña Physical:**

<p align="center">
  <img src="/docs/rs/P5ERStudioPhysical.png" alt="ER/Studio - Configuración pestaña Physical" width="65%">
</p>

**Pestaña Name Handling:**

<p align="center">
  <img src="/docs/rs/P5ERStudioNameHandling.png" alt="ER/Studio - Configuración Name Handling" width="65%">
</p>

**Pestaña Display:**

<p align="center">
  <img src="/docs/rs/P5ERStudioDisplay.png" alt="ER/Studio - Configuración pestaña Display" width="65%">
</p>

Para modificar la notación de un diagrama en particular (no a nivel global):

A. Seleccionar `View -> Diagram and object display options`.
B. Seleccionar la pestaña **Relationships** para modificar la notación solo para el diagrama en turno.

<p align="center">
  <img src="/docs/rs/P5ERStudioRelationships.png" alt="ER/Studio - Pestaña Relationships" width="65%">
</p>

### 1.4.2 Creación de un nuevo modelo

ER/Studio permite la creación de un nuevo modelo de datos a partir de 3 fuentes distintas:

```
File -> New -> Draw a new data model
```

<p align="center">
  <img src="/docs/rs/P5ERStudioNuevoModelo.png" alt="ER/Studio - Crear nuevo modelo" width="50%">
</p>

> Es posible crear un modelo a partir de una base de datos existente o realizar la importación de un modelo de ERWin.

### 1.4.3 Agregando objetos al modelo lógico

Al crear el nuevo modelo, por default se crea un **modelo lógico** (independiente del manejador). En ER/Studio un modelo lógico corresponde con el concepto de "Modelo relacional" revisado en clase. Permite crear un modelo relacional con características estándares implementable para diversos RDBMs.

### 1.4.4 Elementos del modelo lógico

Para iniciar con la creación de los elementos del modelo de datos, se emplea la barra de herramientas.

#### 1.4.4.1 Creación de entidades

Seleccionar `Insert -> Entity`, o hacer clic en el ícono correspondiente de la barra de herramientas.

<p align="center">
  <img src="/docs/rs/P5ERStudioEntidad.png" alt="ER/Studio - Creación de entidades" width="75%">
</p>

#### 1.4.4.2 Atributos de una entidad

Para agregar atributos a una entidad: seleccionar la entidad en el editor, dar doble clic, o clic derecho `-> Edit Entity`. En la pantalla que aparece, seleccionar la opción **Add**.

<p align="center">
  <img src="/docs/rs/P5ERStudioAtributos.png" alt="ER/Studio - Atributos de entidad" width="75%">
</p>

#### 1.4.4.3 Documentación de entidades y atributos

Es muy importante que el modelo esté bien documentado, tanto a nivel tabla como a nivel atributo. En ER/Studio se agrega la documentación seleccionando la pestaña **Definition**.

#### 1.4.4.4 Asociación de entidades empleando relaciones

La asociación se realiza a partir de los tipos de relaciones:
- Relaciones identificativas
- Relaciones no identificativas obligatorias
- Relaciones no identificativas opcionales
- Subtipos

Para asociar 2 entidades:
1. Hacer clic en el ícono que representa el tipo de relación a usar.
2. Hacer clic sobre la entidad origen.
3. Hacer clic sobre la entidad destino (la tabla que contendrá la FK).

<p align="center">
  <img src="/docs/rs/P5ERStudioRelacionFinal.png" alt="ER/Studio - Modelo con relaciones" width="75%">
</p>

> Los valores de la cardinalidad se deben escribir de forma manual, empleando la herramienta de texto.

#### 1.4.4.5 Opciones para relaciones

Al hacer doble clic en la línea que representa la relación, aparecerá una ventana para personalizar o modificar las propiedades de la relación:
- Tipo de relación
- Cardinalidad
- Role name (cambio del nombre de la FK)

#### 1.4.4.6 Cambio del nombre a la FK

En algunas situaciones es conveniente cambiar el nombre a la FK para tener una mayor comprensión del modelo. Seleccionar la pestaña **Role Name** en las propiedades de la relación.

<p align="center">
  <img src="/docs/rs/P5ERStudioRoleName.png" alt="ER/Studio - Cambio de nombre FK" width="65%">
</p>

### 1.4.5 Generación de reportes

Con ER/Studio es posible crear reportes en formato RTF o HTML que describen de forma detallada todas las opciones del modelo. Para generar el reporte: `Tools -> Generate Reports`.

- Seleccionar la creación de un reporte HTML y seguir las indicaciones en pantalla.
- En el segundo paso, seleccionar las pestañas **Diagram** y **Data Dictionary**, seleccionar todas las opciones.

<p align="center">
  <img src="/docs/rs/P5ERStudioReporte.png" alt="ER/Studio - Generación de reportes" width="75%">
</p>

#### 1.4.5.1 Exportando diagramas

ER/Studio permite exportar un diagrama en diferentes formatos. Para efectos del reporte de la práctica, usar `File -> Export Image`.

- Es posible seleccionar un conjunto de tablas y generar un diagrama solo para las tablas seleccionadas haciendo clic en **"Selected Objects Only"**.
- Se recomienda no dejar demasiado espacio entre tablas para que el tamaño de todos los objetos sea lo más grande posible.

### 1.4.6 Generando modelos físicos

Una vez que se ha concluido con la creación, revisión y validación exitosa del modelo lógico, es posible crear un **modelo físico**.

El modelo físico se genera de manera automática para un RDBMS en particular. En ER/Studio se puede generar haciendo clic derecho en el ícono `Logical -> Generate Physical Model`.

<p align="center">
  <img src="/docs/rs/P5ERStudioModeloFisico.png" alt="ER/Studio - Generación de modelo físico" width="75%">
</p>

Uno de los principales usos de un modelo físico es que ER/Studio puede generar el **código SQL** para crear la estructura de todos los objetos de una base de datos (`Database -> Generate DDL`).

En la generación de código SQL, modificar las siguientes opciones (segunda pantalla al hacer clic en "Next"):

- **Generate foreign key Constraints:**
  - ✅ *Implement via CREATE TABLE* — Permite crear las restricciones de referencia dentro de la definición de la tabla.
  - ✅ *Generate tables in dependency Order* — Permite crear las tablas en el orden correcto (primero tablas "padre", después las dependientes).

Finalmente, hacer clic en **"SQL Preview"** para mostrar el código SQL generado.

---