# Práctica 09: Lenguaje de Definición de Datos (DDL) - Material de Apoyo
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 09

**Asignatura:** Laboratorio de Bases de Datos  
**Maestra:** M.I.A. Martha López Pelcastre  
**Universidad Nacional Autónoma de México**

---

## Contenido

1. [Antecedentes teóricos](#11-antecedentes-teóricos)
2. [Lenguaje de Definición de Datos DDL](#12-lenguaje-de-definición-de-datos-ddl)
   - [1.2.1 Creación de una Base de Datos](#121-creación-de-una-base-de-datos)
   - [1.2.2 Creación de una tabla](#122-creación-de-una-tabla)
   - [1.2.3 Borrar una tabla](#123-borrar-una-tabla)
   - [1.2.4 Modificar tabla](#124-modificar-tabla)
   - [1.2.5 Modificar una columna](#125-modificar-una-columna)
   - [1.2.6 Constraints o restricciones](#126-constraints-o-restricciones)
   - [1.2.7 Índices](#127-índices)

---

## 1.1 Antecedentes teóricos

SQL es un lenguaje estándar tanto de ANSI como de ISO. Fue adoptado por la mayoría de empresas desarrolladoras de bases de datos e incluido en sus productos: Microsoft, Oracle, MySQL, IBM, etc.

Posteriormente, estas empresas decidieron ampliar este SQL estándar con características propias:
- Microsoft → **Transact-SQL**
- Oracle → **PL-SQL**

---

## 1.2. Lenguaje de Definición de Datos DDL

La primera fase de cualquier base de datos siempre comienza con órdenes del **DDL (Data Definition Language)**, para diseñar los objetos de la base de datos.

Los comandos más comunes son:

| Comando | Descripción |
|---------|-------------|
| `CREATE DATABASE` | Crea una nueva base de datos vacía |
| `DROP DATABASE` | Elimina completamente una base de datos existente |
| `CREATE TABLE` | Crea una nueva tabla |
| `ALTER TABLE` | Modifica una tabla ya existente |
| `DROP TABLE` | Elimina por completo una tabla existente |

---

### 1.2.1 Creación de una Base de Datos

```sql
-- Sintaxis
CREATE DATABASE nombreBD;

-- Ejemplo
CREATE DATABASE bd_lab09;
```

---

### 1.2.2 Creación de una tabla

```sql
-- Sintaxis
CREATE TABLE NombreTabla (
    Campo1 TipoDeDato,
    Campo2 TipoDeDato,
    ...
);

-- Ejemplo
CREATE TABLE empleado (
    nombre          VARCHAR(50) NOT NULL,
    paterno         VARCHAR(50) NOT NULL,
    materno         VARCHAR(50) NOT NULL,
    domicilio       VARCHAR(150) NOT NULL,
    ciudad          VARCHAR(50) NOT NULL,
    fechaNacimiento DATE NULL
);
```

---

### 1.2.3 Borrar una tabla

```sql
-- Sintaxis
DROP TABLE "nombre_tabla";

-- Ejemplo
DROP TABLE cliente;
```

> ⚠️ **Importante:**
> - `DROP TABLE` no puede utilizarse para eliminar una tabla a la que hace referencia una restricción `FOREIGN KEY`. Primero hay que eliminar la FK.
> - Cuando se elimina una tabla, sus reglas y restricciones asociadas se eliminan automáticamente.
> - No se puede utilizar `DROP TABLE` en tablas del sistema.

---

### 1.2.4 Modificar tabla

El comando `ALTER TABLE` se utiliza para:
1. Añadir o modificar columnas
2. Agregar y quitar restricciones
3. Habilitar y deshabilitar restricciones

```sql
-- Agregar una columna
ALTER TABLE nombre_tabla
ADD nombre_columna tipodedato;

-- Ejemplo: agregar columna de experiencia
ALTER TABLE empleado
ADD añosExperiencia NUMERIC(3);

-- Eliminar una columna
ALTER TABLE nombre_tabla
DROP COLUMN nombre_columna;

-- Ejemplo: quitar el campo ciudad
ALTER TABLE empleado
DROP COLUMN ciudad;
```

---

### 1.2.5 Modificar una columna
**ALTER COLUMN**

Especifica que la columna con nombre va a cambiarse o modificarse.
La columna modificada no puede ser ninguna de las siguientes:
- timestamp data type." Una columna con un tipo de datos timestamp.
- La columna ROWGUIDCOL de la tabla.
- Una columna calculada o usada en una columna calculada.
- Una columna utilizada en una restricción PRIMARY KEY o [FOREIGN KEY] REFERENCES.
- Una columna utilizada en una restricción CHECK o UNIQUE. Sin embargo, se permite el cambio de longitud de una columna de longitud variable en una restricción CHECK o UNIQUE.

```sql
-- Sintaxis
ALTER TABLE nombre_tabla
ALTER COLUMN nombre_campo datatype;

-- Ejemplo
ALTER TABLE EMPLEADO
ALTER COLUMN añosExperiencia NUMERIC(2,0);
```

> ⚠️ La columna modificada **no puede ser**: columna de tipo `timestamp`, columna `ROWGUIDCOL`, columna calculada, columna en restricción `PRIMARY KEY` o `FOREIGN KEY`.

---

### 1.2.6 Constraints o restricciones

Para asegurar la integridad de los datos almacenados en nuestras tablas, podemos crear restricciones, algunos los hemos utilizado sin querer o simplemente desconocemos que lo que hicimos fue una restricción, por ejemplo, una llave primaria. Estas restricciones las podemos implementar al momento de crear nuestras tablas o de modificarlas, también es necesario señalar que dichas restricciones son objetos propios de la base de datos y por lo tanto requieren de un nombre único compuesto del nombre del esquema al que pertenece y el nombre que lo identifica, un ejemplo sería nombreRestriccion.

Los diferentes tipos de restricción que existen son:

- `PRIMARY KEY`
- `UNIQUE`
- `FOREIGN KEY`
- `CHECK`
- `DEFAULT`

#### 1.2.6.1 Primary Key

Es la más común. Identifica cada fila de forma única dentro de la tabla.

**Requerimientos:**
- La(s) columna(s) utilizada(s) no pueden aceptar `NULL`
- No se pueden repetir valores (deben ser únicos)
- Solo puede existir **una** restricción `PRIMARY KEY` por tabla

```sql
-- Al crear la tabla
CREATE TABLE nombreTabla (
    nombreColumna1 INT NOT NULL,
    nombreColumna2 VARCHAR(100) NOT NULL,
    CONSTRAINT PK_nombreRestriccion PRIMARY KEY (nombreColumna1)
);

-- Modificando una tabla existente
ALTER TABLE nombreTabla
ADD CONSTRAINT PK_nombreRestriccion PRIMARY KEY (nombreColumna1);
```

> Cada vez que se genera una llave primaria, esta crea un índice de tipo **CLUSTERED** automáticamente.

---

#### 1.2.6.2 Unique

Muy parecida a `PRIMARY KEY`, con estas diferencias:
- Genera un índice de tipo **NONCLUSTERED** automáticamente
- La tabla puede tener **más de una** restricción `UNIQUE`
- Puede aceptar `NULL`, pero **solo una fila** puede contenerlo

```sql
CREATE TABLE nombreTabla (
    nombreColumna1 INT NULL,
    nombreColumna2 VARCHAR(100) NOT NULL,
    CONSTRAINT UQ_nombreRestriccion  UNIQUE (nombreColumna1),
    CONSTRAINT UQ_nombreRestriccion2 UNIQUE (nombreColumna2),
    CONSTRAINT UQ_nombreRestriccion3 UNIQUE (nombreColumna1, nombreColumna2)
);
```

---

#### 1.2.6.3 Foreign Key

Una columna (o combinación de columnas) que se relaciona con la `PRIMARY KEY` de otra tabla.

```sql
-- Al crear la tabla
CREATE TABLE nombreTabla (
    nombreColumna1 INT NULL,
    nombreColumna2 VARCHAR(100) NOT NULL,
    CONSTRAINT FK_nombreRestriccion FOREIGN KEY (nombreColumna1)
        REFERENCES otraTabla (nombreColumna1)
);

-- Modificando una tabla existente
ALTER TABLE nombreTabla
ADD CONSTRAINT FK_nombreRestriccion FOREIGN KEY (nombreColumna1)
    REFERENCES otraTabla (nombreColumna1);
```

**Requerimientos:**
- Los valores ingresados en la FK deben existir en la tabla referenciada
- Solo se pueden referenciar tablas dentro de la misma base de datos
- Solo puede hacer referencia a columnas con restricciones `PRIMARY KEY` o `UNIQUE`
- No se puede utilizar en tablas temporales

---

#### 1.2.6.4 Check

Especifica que los valores ingresados en la columna deben cumplir una regla especificada.

```sql
-- Al crear la tabla
CREATE TABLE nombreTabla (
    nombreColumna1 INT NULL,
    -- Solo valores positivos
    CONSTRAINT CH_restriccion1 CHECK (nombreColumna1 >= 0),
    -- Solo valores específicos
    CONSTRAINT CH_restriccion2 CHECK (nombreColumna1 IN (10, 20, 30, 40)),
    -- Valores en un rango
    CONSTRAINT CH_restriccion3 CHECK (nombreColumna1 >= 1 AND nombreColumna1 <= 30)
);

-- Modificando una tabla existente
ALTER TABLE nombreTabla
ADD CONSTRAINT CH_restriccion CHECK (nombreColumna1 >= 0);
```

**Consideraciones:**
- Una columna puede tener **cualquier número** de restricciones `CHECK`
- La condición debe evaluarse como una expresión booleana
- No se pueden definir en columnas de tipo `text`, `ntext` o `image`
- Si la columna acepta `NULL`, el `NULL` pasará la restricción (es un valor desconocido)

---

#### 1.2.6.5 Default

Permite insertar un valor predeterminado cuando ninguno otro sea especificado.

```sql
CREATE TABLE nombreTabla (
    nombreColumna1 INT NULL CONSTRAINT DF_nombreRestriccion DEFAULT (0),
    nombreColumna2 VARCHAR(100) NOT NULL,
    nombreColumna3 VARCHAR(200) NOT NULL
);
```

---

### 1.2.7 Índices

SQL Server permite crear dos tipos de índices:

| Tipo | Descripción |
|------|-------------|
| **CLUSTERED** | Similar a una guía telefónica; los registros con el mismo valor se agrupan juntos. Determina el orden de almacenamiento físico. Solo puede existir **1** por tabla. |
| **NONCLUSTERED** | Como el índice de un libro; los datos se almacenan en un lugar diferente al índice con punteros. Puede haber hasta **249** por tabla. |

```sql
-- Índice agrupado único
CREATE UNIQUE CLUSTERED INDEX idx_rfc
ON empleado(rfc);

-- Índice no agrupado
CREATE NONCLUSTERED INDEX idx_empleado_ciudad
ON empleado(ciudad);

-- Índice compuesto
CREATE INDEX idx_empleado_alfabetico
ON empleado(paterno, materno, nombre);
```

> SQL Server crea automáticamente índices cuando se establece una restricción `PRIMARY KEY` (CLUSTERED) o `UNIQUE` (NONCLUSTERED).

---
