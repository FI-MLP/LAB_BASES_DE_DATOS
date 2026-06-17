# Práctica 14 – Material de Apoyo: Introducción a la Programación con SQL
## Facultad de Ingeniería
### BASES DE DATOS — PRÁCTICA 14 – MATERIAL DE APOYO

**Asignatura:** Bases de Datos  
**Maestra:** Martha López Pelcastre  
**Universidad Nacional Autónoma de México**

---

## Contenido

1. [Introducción](#11-introducción)
2. [Store Procedure](#12-store-procedure)
   - [1.2.1 Variables](#121-variables)
3. [Lenguaje de control de flujo](#13-lenguaje-de-control-de-flujo)
   - [1.3.1 IF](#131-if)
   - [1.3.2 Case](#132-case)
   - [1.3.3 While](#133-while)
4. [Trigger](#14-trigger)

---

## 1.1 Introducción

El lenguaje que se emplea para programar varía de un Sistema Manejador de Bases de Datos Relacional (RDBMS) a otro. Este lenguaje de programación se usa para acceder y trabajar con bases de datos desde distintos entornos.

Se crean subprogramas también llamados **función**, **procedimiento** o **disparador**.

Dentro del lenguaje de programación se puede hacer uso de:
- Funciones numéricas, de carácter, de fecha y de conversión de tipos de datos.
- Los mismos operadores que para SQL: aritméticos, lógicos, de concatenación y paréntesis.
- **Estructuras de control**, que permiten elegir la forma en la que se van a ejecutar las diferentes instrucciones dentro del programa.

> Las funciones de agrupamiento **no** pueden usarse dentro de los subprogramas, ya que éstas se aplican sobre una columna de una tabla.

Las estructuras de control más importantes son las **estructuras condicionales** y las **estructuras de repetición** (también llamadas ciclos).

---

## 1.2 Store Procedure

Un procedimiento almacenado es un conjunto de comandos SQL que pueden ser compilados y almacenados en el servidor. Una vez realizado esto, los clientes no necesitan volver a teclear todas las instrucciones sino únicamente hacer referencia al procedimiento. Esto mejora el rendimiento del servidor, ya que la instrucción SQL solamente es revisada una sola vez y menos información debe ser enviada entre el cliente y el servidor.

Los procedimientos almacenados pueden:
- Incluir parámetros.
- Llamar a otros procedimientos.
- Devolver un valor de estado a un procedimiento de llamada o lote para indicar el éxito o fracaso del mismo.
- Devolver valores de parámetros a un procedimiento de llamada o lote.
- Ejecutarse en SQL Server remotos.

**Tipos de procedimientos almacenados:**

| Tipo | Descripción |
|------|-------------|
| Definidos por el usuario | Son procedimientos definidos por el usuario que se deben llamar explícitamente. |
| Triggers | Son procedimientos definidos por el usuario que se ejecutan automáticamente cuando se modifica un dato en una tabla. |
| Procedimientos del sistema | Procedimientos suministrados por el sistema. |
| Procedimientos extendidos | Procedimientos que hacen llamadas al sistema operativo y ejecutan tareas a ese nivel. |

---

### Sintaxis — Crear un Store Procedure

```sql
-- =============================================
-- Author:
-- Fecha de creación:
-- Descripción:
-- =============================================
CREATE PROCEDURE <NombreProcedimiento>
    -- PARÁMETROS
    @Param1 int = 0,
    @Param2 int = 0
AS
BEGIN  -- INICIO DE LAS INSTRUCCIONES A EJECUTAR
    -- INSTRUCCIONES A EJECUTAR
    SELECT @Param1, @Param2
END    -- FIN DE LAS INSTRUCCIONES A EJECUTAR
GO     -- EJECUTA LA CREACIÓN DEL PROCEDIMIENTO ALMACENADO
```

---

### Operaciones sobre procedimientos

**Borrar un procedimiento:**

```sql
DROP PROCEDURE nombre_procedimiento
```

**Actualizar un procedimiento:**

```sql
ALTER PROCEDURE nombre_procedimiento
```

**Ejecutar un procedimiento:**

```sql
EXEC nombre_procedimiento
```

**Otorgar permisos de ejecución:**

```sql
GRANT EXECUTE ON nombre_procedimiento TO user1, user2, …
```

---

### Parámetros de entrada

Un parámetro de entrada es una variable local del procedimiento almacenado que puede recibir un valor de una sentencia `EXEC`:

```sql
EXEC nombre_procedimiento lista_de_parámetros
```

**Dos métodos para pasar valores a parámetros:**

**Paso por posición** — Los parámetros se deben pasar en el mismo orden en que aparecen en la sentencia `CREATE PROCEDURE`:

```sql
EXEC nombre_procedimiento valor1, valor2, ...
```

**Paso por nombre** — Los parámetros pueden pasarse en cualquier orden. Se recomienda este método por ser menos propenso a errores:

```sql
EXEC nombre_procedimiento @param1 = valor1, @param2 = valor2
```

---

### Retorno de valores (parámetros OUTPUT)

Un parámetro `OUTPUT` es una variable local en un procedimiento almacenado que puede enviarse de regreso a quien lo llama.

**Crear parámetros que retornan valores:**

```sql
CREATE PROCEDURE nombre_procedimiento
    @parametro1 datatype OUTPUT,
    @parametro2 datatype OUTPUT
AS
    -- instrucciones
RETURN
```

**Usar parámetros que retornan valores:**

```sql
EXEC nombre_procedimiento @variable OUTPUT
```

> Se pueden pasar por nombre o por posición. Se recomienda el paso **por nombre**.

---

### Ejemplo

Crea un procedimiento almacenado que obtenga la información de los hoteles y sus estancias:

```sql
CREATE OR ALTER PROCEDURE spuConsultaHotel
AS
BEGIN
    SELECT nombre, categoria, numero, estatus, tipoEstancia
    FROM hotel h
    JOIN estancia e ON h.idhotel = e.idhotel
END
GO

EXECUTE spuConsultaHotel
```

---

## 1.2.1 Variables

Los procedimientos almacenados pueden crear y usar **variables locales**:
- Las variables sólo existen mientras exista el procedimiento.
- Las variables no las puede usar otro proceso.

**Tipos de variables:**

| Tipo | Identificación | Ejemplo |
|------|---------------|---------|
| Variables locales | Comienzan con `@` | `@miVariable` |
| Variables globales | Comienzan con `@@` | `@@rowcount`, `@@error` |

Las variables locales se declaran debajo de la sentencia `AS` usando `DECLARE`, y se les asigna valor con `SELECT`:

```sql
DECLARE
    @nombrevariable1 NUMERIC(18,2),
    @nombrevariable2 VARCHAR(70)

SELECT @variable = campo FROM tabla
```

---

## 1.3 Lenguaje de control de flujo

### 1.3.1 IF

La estructura `IF...ELSE` testea una condición; se emplea cuando un bloque de sentencias debe ejecutarse si una condición se cumple y, si no se cumple, se ejecuta otro bloque diferente.

**Ejemplo 1.** Mostrar títulos de libros sin stock; si no hay, mostrar un mensaje:

```sql
IF EXISTS (SELECT * FROM libros WHERE cantidad = 0)
    SELECT titulo FROM libros WHERE cantidad = 0
ELSE
    SELECT 'No hay libros sin stock';
```

**Ejemplo 2.** Aplicar descuento del 10% a libros de una editorial; si no hay, mostrar un mensaje:

```sql
IF EXISTS (SELECT * FROM libros WHERE editorial = 'Emece')
BEGIN
    UPDATE libros
    SET precio = precio - (precio * 0.1)
    WHERE editorial = 'Emece'

    SELECT 'Libros actualizados'
END
ELSE
    SELECT 'No hay registros actualizados';
```

> Cuando la condición es verdadera y se deben ejecutar **2 o más sentencias**, éstas se deben encerrar en un bloque `BEGIN...END`.

---

### 1.3.2 Case

La función `CASE` compara dos o más valores y devuelve un resultado. Por cada valor hay un `WHEN` y un `THEN`; si no encuentra ninguna coincidencia, ejecuta el `ELSE`. Si no hay parte `ELSE`, retorna `NULL`.

**Sintaxis básica (valor puntual):**

```sql
CASE valor_a_comparar
    WHEN valor1 THEN resultado1
    WHEN valor2 THEN resultado2
    ...
    ELSE resultado_default
END
```

**Ejemplo 1.** Mostrar la nota de cada alumno con su resultado:

```sql
SELECT nombre, nota,
    resultado = CASE nota
        WHEN 0 THEN 'mal'
        WHEN 1 THEN 'mal'
        WHEN 2 THEN 'mal'
        WHEN 3 THEN 'mal'
        WHEN 4 THEN 'regular'
        WHEN 5 THEN 'regular'
        WHEN 6 THEN 'regular'
        WHEN 7 THEN 'reconocimiento'
        WHEN 8 THEN 'reconocimiento'
        WHEN 9 THEN 'reconocimiento'
        WHEN 10 THEN 'reconocimiento'
    END
FROM alumnos;
```

**Sintaxis con comparaciones (rangos):**

```sql
CASE
    WHEN valor OPERADOR valor1 THEN resultado1
    WHEN valor OPERADOR valor2 THEN resultado2
    ...
    ELSE resultado_default
END
```

**Ejemplo 2.** Clasificar la nota del alumno por rango:

```sql
SELECT nombre, nota,
    condicion = CASE
        WHEN nota < 4             THEN 'no aprobado'
        WHEN nota >= 4 AND nota < 7 THEN 'regular'
        WHEN nota >= 7            THEN 'buena nota'
        ELSE 'sin nota'
    END
FROM alumnos;
```

> La expresión `CASE` puede utilizarse en cualquier lugar donde pueda usarse una expresión, incluyendo con `GROUP BY` y funciones de agrupamiento.

---

### 1.3.3 While

La estructura `WHILE` ejecuta en forma repetitiva un conjunto o bloque de instrucciones SQL siempre que la condición especificada sea verdadera. Se puede controlar la ejecución con las palabras clave `BREAK` y `CONTINUE`.

**Sintaxis:**

```sql
WHILE <condicion>
BEGIN
    ...
END
```

**Ejemplo.** Imprimir "Hola Mundo" 10 veces:

```sql
DECLARE @Cont INT = 1;

WHILE (@Cont <= 10)
BEGIN
    SELECT 'Hola Mundo' AS mensaje, @Cont AS contador;
    SET @Cont += 1;
END
```

---

## 1.4 Trigger

Un disparador de base de datos es un procedimiento almacenado que se asocia con una tabla específica y que es llamado cuando un evento particular ocurre, como una inserción, borrado o actualización.

Los disparadores suelen utilizarse para:
- Restricciones de integridad complejas.
- Auditoría de la información de una tabla.
- Aviso a otros programas para ejecutar una acción.

> Los triggers tienen la restricción de que **no pueden manejar parámetros ni ser llamados directamente**.

**Diferencias entre triggers y store procedures:**

| Característica | Store Procedure | Trigger |
|---------------|----------------|---------|
| Invocación | Se llama explícitamente | Se ejecuta automáticamente |
| Parámetros | Sí admite | No recibe ni retorna parámetros |
| Uso principal | Obtener resultados de consultas | Mantener la integridad de los datos |

> Los disparadores **no pueden contener** órdenes SQL de control de transacciones (`COMMIT`, `ROLLBACK` o `SAVEPOINT`), y ningún procedimiento o función llamado por el disparador puede emitirlas.

---

### Sintaxis básica

```sql
CREATE TRIGGER [Nombre_Trigger]        -- Nombre definido por el usuario
ON [Nombre_tabla]                      -- Tabla a la que se aplica el trigger
{ FOR | AFTER | INSTEAD OF } { [INSERT], [UPDATE], [DELETE] }
AS
    { sql_statements }
```

**Tipos de activación:**

| Cláusula | Descripción |
|----------|-------------|
| `FOR` / `AFTER` | El trigger se activa **después** de que todas las operaciones especificadas se han ejecutado correctamente, incluyendo validaciones de restricciones y acciones referenciales en cascada. |
| `INSTEAD OF` | El trigger se activa **en lugar de** la instrucción desencadenadora, sobrescribiendo las acciones de dicha instrucción. |

> Para los desencadenadores `INSTEAD OF`, no se puede usar la opción `DELETE` en tablas con una relación referencial que especifica una acción `ON DELETE` en cascada, ni `UPDATE` en tablas con `ON UPDATE` en cascada.

Las restricciones se comprueban **ANTES** de la ejecución de una instrucción `INSERT`, `UPDATE` o `DELETE`. Si se infringe alguna restricción, el trigger no llega a ejecutarse.

---

### Ejemplo

Trigger que envía un mensaje al usuario al realizar cambios en la tabla `CLIENTE`:

```sql
CREATE OR ALTER TRIGGER trCliente
ON CLIENTE
AFTER INSERT, UPDATE, DELETE
AS
    SELECT * FROM deleted;
    SELECT * FROM inserted;
    PRINT 'Se realizó un cambio en la tabla CLIENTE';
GO

-- Insertar datos
INSERT INTO CLIENTE (nombre, apellidoP, apellidoM, telefono, rfc)
VALUES ('CARLOS', 'ANAYA', 'RODRIGUEZ', 5569854563, 'AARC700915HY7');

-- Borrar un registro
SELECT * FROM CLIENTE
DELETE FROM CLIENTE
WHERE idCliente = 1002

-- Modificar un registro
UPDATE cliente
SET correo = 'dulce24-1@gmail.com'
WHERE idCliente = 7
```

> Las tablas virtuales `inserted` y `deleted` contienen los registros afectados por la operación que disparó el trigger y están disponibles únicamente dentro del cuerpo del mismo.

---