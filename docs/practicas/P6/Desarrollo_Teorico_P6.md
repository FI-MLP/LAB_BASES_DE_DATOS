# Tema 6: Introducción a SQL
## Facultad de Ingeniería
### BASES DE DATOS — GRUPO #

**Asignatura:** Bases de Datos  
**Maestra:** M.I.A. Martha López Pelcastre  
**Universidad Nacional Autónoma de México**

---

## Tabla de contenido

1. [S.Q.L. — Lenguaje Estructurado de Consulta](#61-sql-lenguaje-estructurado-de-consulta)
2. [Categorías del SQL](#62-categorías-del-sql)
3. [TransacT SQL](#63-transact-sql)
4. [Tipos de datos](#64-tipos-de-datos)
   - [4.1 Tipos de datos SQL estándar](#641-tipos-de-datos-de-sql-estándar)
   - [4.2 Tipos de datos en SQL Server](#642-tipos-de-datos-en-sql-server)
   - [4.3 Prioridad de los tipos de datos](#643-prioridad-de-los-tipos-de-datos)
   - [4.4 Sentencias SQL](#644-sentencias-sql)

---

## 6.1 S.Q.L. Lenguaje Estructurado de Consulta

Es un **lenguaje estándar de cuarta generación** que se utiliza para **definir, gestionar y manipular** la información contenida en una Base de Datos Relacional. Es un lenguaje normalizado que permite trabajar con cualquier manejador de bases de datos.

Lenguaje definido por el estándar **ISO/ANSI SQL** que utilizan los principales fabricantes de Sistemas de Gestión de Bases de Datos Relacionales.

En los lenguajes procedimentales de tercera generación se deben especificar todos los pasos para conseguir el resultado. Sin embargo, en SQL tan solo deberemos indicar al SGDB **qué** es lo que queremos obtener, y el sistema decidirá **cómo** obtenerlo.

SQL es un lenguaje **sencillo y potente** que se emplea para la gestión de la base de datos a distintos niveles: usuarios, programadores y administradores.

### ¿Qué podemos hacer con SQL?

Los principales SGBD incorporan un motor SQL en el Servidor de Base de Datos, así como herramientas de cliente. Mediante sentencias SQL podemos:

- Crear, modificar y borrar objetos de la Base de Datos
- Insertar, modificar y borrar datos
- Consultar datos de la Base de Datos
- Controlar el acceso a la información
- Garantizar la consistencia de los datos

---

## 6.2 Categorías del SQL

<p align="center">
  <img src="/docs/rs/imgPrevios/DP6-1" alt="Árbol de categorías SQL" width="70%">
</p>

| Categoría | Nombre completo | Descripción | Instrucciones |
|-----------|----------------|-------------|--------------|
| **DDL** | Data Definition Language | Creación, modificación y eliminación de la estructura de objetos | `CREATE`, `DROP`, `ALTER`, `TRUNCATE` |
| **DML** | Data Manipulation Language | Modificación y eliminación de los datos almacenados | `INSERT`, `UPDATE`, `DELETE` |
| **DCL** | Data Control Language | Control de acceso; define accesos y privilegios | `GRANT`, `REVOKE` |
| **DQL** | Data Query Language | Consultas de los datos de la BD | `SELECT` |
| **TCL** | Transaction Control Language | Creación y administración de transacciones | `COMMIT`, `SAVEPOINT`, `ROLLBACK` |

> SQL no es simplemente un lenguaje de interrogación, sino que incluye tanto un DDL como un DML. Está estandarizado; sin embargo, cada SGBD (Oracle, PostgreSQL, SQLite, MySQL) añade sus propias extensiones.

---

## 6.3 TransacT SQL

**Transact SQL** es el lenguaje de programación que proporciona SQL Server para extender el SQL estándar con instrucciones adicionales: variables, sentencias de control de flujo, bucles, etc.

### 6.3.1 Características de SQL Server

- Soporte de transacciones
- Escalabilidad, estabilidad y seguridad
- Soporta procedimientos almacenados
- Entorno gráfico de administración para DDL y DML
- Modo **cliente-servidor**: datos en el servidor, acceso desde terminales
- Permite administrar información de otros servidores de datos

---

## 6.4 Tipos de datos

La definición del tipo de dato y del dominio de los atributos debe reflejar de forma correcta la naturaleza de los datos modelados: cadenas de caracteres, cantidades, valores monetarios, fechas, etc.

### 6.4.1 Tipos de datos de SQL estándar

- **Cadenas:** de caracteres (longitud fija / variable) y cadenas binarias
- **Numéricos:** exactos y aproximados
- **Tiempo y fechas**
- **Otros:** `boolean`, `ROWID`, `UROWID`, `BFILE` (Oracle); `Cursor`, `Uniqueidentifier` (SQLServer); `XML`

---

### 6.4.2 Tipos de datos en SQL Server

#### 6.4.2.1 Tipos de datos numéricos

> Regla general: usar el **tipo de dato mínimo posible**. Todos admiten el valor `NULL`.

| Tipo | Rango | Notas |
|------|-------|-------|
| `BIT` | 0 a 1 | Booleano |
| `TINYINT` | 0 a 255 | — |
| `SMALLINT` | -32,768 a 32,767 | — |
| `INT` | -2³¹ a 2³¹-1 | — |
| `BIGINT` | -2⁶³ a 2⁶³-1 | — |
| `DECIMAL(p,s)` | Variable | `p` = precisión total, `s` = escala decimal |
| `FLOAT` | ±1.79×10³⁰⁸ | Precisión entre 1 y 53 |
| `REAL` | ±3.4×10³⁸ | Sinónimo de `FLOAT(24)` |
| `MONEY` | -2⁶³ a 2⁶³-1 | 4 decimales de precisión |
| `SMALLMONEY` | ±214,748.3647 | 4 decimales de precisión |

> Todos los tipos enteros pueden marcarse con la propiedad **`IDENTITY`** para hacerlos autonuméricos (útil para llaves primarias).

---

#### 6.4.2.2 Tipos de datos de carácter

| Tipo | Encoding | Descripción |
|------|----------|-------------|
| `CHAR(n)` | ASCII (1 byte) | Longitud fija. Rellena con espacios si el valor es menor. |
| `VARCHAR(n)` | ASCII (1 byte) | Longitud variable. Solo ocupa el espacio necesario. |
| `VARCHAR(MAX)` | ASCII | Hasta 2³¹-1 bytes. |
| `NCHAR(n)` | UNICODE (2 bytes) | Longitud fija. Recomendado para múltiples idiomas. |
| `NVARCHAR(n)` | UNICODE (2 bytes) | Longitud variable. Recomendado para múltiples idiomas. |
| `NVARCHAR(MAX)` | UNICODE | Hasta 2³¹-1 bytes. |

---

#### 6.4.2.3 Tipos de datos de fecha

| Tipo | Precisión | Tamaño | Notas |
|------|-----------|--------|-------|
| `TIME` | 100 nanosegundos | 3 a 5 bytes | Solo hora |
| `DATE` | 1 día | 3 bytes | Solo fecha |
| `SMALLDATETIME` | 1 minuto | 4 bytes | Para tablas con muchos datos |
| `DATETIME` | 0.00333 segundos | 8 bytes | Fecha muy específica |
| `DATETIME2` | 100 nanosegundos | 6 a 8 bytes | — |
| `DATETIMEOFFSET` | 100 nanosegundos | 8 a 10 bytes | Con zona horaria |

---

#### 6.4.2.4 Tipos de datos binarios

<p align="center">
  <img src="/docs/rs/imgPrevios/DP6-2" alt="Árbol de categorías SQL" width="70%">
</p>

| Tipo | Descripción |
|------|-------------|
| `BINARY` | Longitud fija, hasta 8,000 bytes |
| `VARBINARY` | Longitud variable, hasta 8,000 bytes. Usa menos espacio en disco que `BINARY` |
| `VARBINARY(MAX)` | Hasta 2³¹-1 bytes |
| `IMAGE` | Longitud variable de 0 hasta 2³¹-1 bytes |



---

#### 6.4.2.5 Tipo de datos XML

| Tipo | Descripción |
|------|-------------|
| `XML` | Para almacenar datos muy estructurados como tablas |

---

#### 6.4.2.6 Otros tipos de datos

| Tipo | Descripción |
|------|-------------|
| `UNIQUEIDENTIFIER` | Para identificadores únicos. Generados con la función `NEWID()` |
| `SQL_VARIANT` | Permite almacenar valores de diferentes tipos (no admite `varchar(max)`, `xml`, `timestamp`) |
| `CURSOR` | Para recorrer registros y resultados de una consulta |
| `ROWVERSION` | Números binarios generados automáticamente para indicar la versión de las filas |
| `HIERARCHYID` | Para representar la posición en una jerarquía de árbol |
| `TABLE` | Para almacenar temporalmente un conjunto de filas |
| `GEOMETRY ESPACIAL` | Para datos espaciales planares en un sistema de coordenadas euclídeo |
| `GEOGRAPHY ESPACIAL` | Para datos elipsoidales como coordenadas GPS (latitud/longitud) |

---

### 6.4.3 Prioridad de los tipos de datos

SQL Server utiliza el siguiente orden de prioridad (de mayor a menor):

| Prioridad | Tipo |
|-----------|------|
| 1 | Tipos definidos por el usuario (el más alto) |
| 2 | `sql_variant` |
| 3 | `xml` |
| 4 | `datetimeoffset` |
| 5 | `datetime2` |
| 6 | `datetime` |
| 7 | `smalldatetime` |
| 8 | `date` |
| 9 | `time` |
| 10 | `float` |
| 11 | `real` |
| 12 | `decimal` |
| 13 | `money` |
| 14 | `smallmoney` |
| 15 | `bigint` |
| 16 | `int` |
| 17 | `smallint` |
| 18 | `tinyint` |
| 19 | `bit` |
| 20 | `ntext` |
| 21 | `text` |
| 22 | `image` |
| 23 | `timestamp` |
| 24 | `uniqueidentifier` |
| 25 | `nvarchar` (incluyendo `nvarchar(max)`) |
| 26 | `nchar` |
| 27 | `varchar` (incluyendo `varchar(max)`) |
| 28 | `char` |
| 29 | `varbinary` (incluyendo `varbinary(max)`) |
| 30 | `binary` (el más bajo) |

---

### 6.4.4 Sentencias SQL

El SQL se compone de sentencias, cada una con una utilidad diferente:

| Sentencia | Descripción |
|-----------|-------------|
| `CREATE DATABASE` | Creación de una base de datos |
| `CREATE TABLE` | Creación de una tabla |
| `CREATE VIEW` | Creación de una vista |
| `CREATE INDEX` | Creación de un índice de una tabla |
| `CREATE PROCEDURE` | Creación de procedimientos almacenados |
| `CREATE TRIGGER` | Creación de disparadores |
| `SELECT` | Consultar los datos almacenados en una tabla |
| `INSERT` | Insertar datos en una tabla |
| `UPDATE` | Modificar datos ya existentes en una tabla |
| `DELETE` | Borrar datos almacenados en una tabla |
| `GRANT` | Dar permiso de acceso a los datos de una tabla |
| `REVOKE` | Eliminar permisos de acceso a datos de una tabla |
| `COMMIT` | Finalizar la transacción de una sentencia SQL |
| `ROLLBACK` | Retroceder la transacción de una sentencia SQL |

---
