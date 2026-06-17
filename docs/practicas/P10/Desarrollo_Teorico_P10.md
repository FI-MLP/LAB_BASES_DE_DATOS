# Práctica 10: Lenguaje de Manipulación de Datos (DML) - Material de Apoyo
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 10

**Asignatura:** Laboratorio de Bases de Datos  
**Maestra:** M.I.A. Martha López Pelcastre  
**Universidad Nacional Autónoma de México**

---

## Contenido

1. [Objetivo](#11-objetivo)

   1.1 [Lenguaje de Manipulación de Datos](#lenguaje-de-manipulación-de-datos)
   - [INSERT](#111-insert)
   - [UPDATE](#112-update)
   - [DELETE](#113-delete)

   1.2 [SELECT](#12-select)
   - [Control de transacciones](#13-control-de-transacciones)

---

## Lenguaje de Manipulación de Datos

El lenguaje de manipulación de datos **(DML)** nos permite acceder, crear, modificar o eliminar los datos de un esquema de base de datos. Las instrucciones que se utilizan son:

- `INSERT` — Insertar datos
- `UPDATE` — Actualizar datos
- `DELETE` — Borrar datos

---

### 1.1.1 INSERT

Una vez que se han creado las tablas, se utiliza el comando `INSERT` para agregar información.

```sql
-- Sintaxis con lista de campos
INSERT INTO <nombreTabla> [(campo1 [, campo2, ...])]
VALUES (valor1, valor2, ...);

-- Sintaxis sin lista de campos (seguir el orden de la tabla)
INSERT INTO <nombreTabla>
VALUES (valor1, valor2, ...);

-- INSERT combinado con SELECT
INSERT INTO <nombreTabla> [(campo1 [, campo2, ...])]
SELECT <columna1, columna2, ...>
FROM <nombreTabla>;
```

> Los valores de tipo `DATE` o `CHAR` se deben encerrar entre **comillas simples**. Los valores insertados deben ser de un tipo compatible con el de las columnas de la tabla.

---

### 1.1.2 UPDATE

Se emplea para modificar los datos existentes en una tabla.

```sql
-- Sintaxis
UPDATE <nombreTabla>
SET {<columna> = <expresión> [, ...]}
[WHERE <condición>];
```

> ⚠️ Si se omite la cláusula `WHERE`, se actualizan **todos** los datos de la tabla.

Una expresión puede estar formada por una subconsulta `SELECT` entre paréntesis, cuyo resultado es un único valor simple.

---

### 1.1.3 DELETE

Permite eliminar datos de una tabla.

```sql
-- Sintaxis
DELETE [FROM] <nombreTabla>
[WHERE <condición>];
```

> ⚠️ Si no se especifica condición, se borran **todos** los datos de la tabla.

---

## 1.2. SELECT

Para recuperar la información guardada en una base de datos se utiliza el comando `SELECT`.

```sql
-- Sintaxis básica
SELECT [ALL | DISTINCT | UNIQUE]
    [<tabla|aliasTabla>.] <columna1> [AS <nombreColumna>]
    [, [<tabla|aliasTabla>.] <columna2> [AS <nombreColumna>] ...]
    | *
FROM [<nombreBaseDeDatos>] Tabla [<aliasTabla>]
[WHERE <condición>];
```

**Elementos de la sintaxis:**

| Elemento | Descripción |
|----------|-------------|
| `AS` | Cambia el nombre de una columna en el resultado o asigna nombre a columna derivada |
| `*` | Hace referencia a todas las columnas de la tabla |
| `<tabla>.<columna>` | Columnas ambiguas (iguales en varias tablas) se preceden del nombre de la tabla |

### Cláusula FROM

```sql
FROM {<nombre de tabla> [alias de tabla]} [, ...]
```

### Cláusula WHERE

```sql
WHERE <condición>
```

Una condición está formada por una o varias expresiones condicionales conectadas por los operadores lógicos `AND`, `OR` y `NOT`.

---

## 1.3. Control de transacciones

Una **transacción** es un conjunto de operaciones que van a ser tratadas como una única unidad. Las transacciones deben cumplir las 4 propiedades **ACID**:

| Propiedad | Descripción |
|-----------|-------------|
| **Atomicidad** | Todas las operaciones tienen éxito o todas fracasan |
| **Coherencia** | La BD queda en un estado consistente después de la transacción |
| **Aislamiento** | Las transacciones se ejecutan de forma aislada entre sí |
| **Durabilidad** | Los cambios confirmados persisten aunque haya fallos |

```sql
-- Iniciar una transacción
BEGIN TRANSACTION;

-- Si algo falla → deshacer todo
ROLLBACK TRANSACTION;

-- Si todo tiene éxito → confirmar
COMMIT TRAN;
```
---
