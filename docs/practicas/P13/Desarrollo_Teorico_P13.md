# Práctica 13 : Joins, Vistas y Subconsultas - Material de Apoyo
## Facultad de Ingeniería
### BASES DE DATOS — PRÁCTICA 13 – MATERIAL DE APOYO

**Asignatura:** Bases de Datos  
**Maestra:** Martha López Pelcastre  
**Universidad Nacional Autónoma de México**

---

## Contenido

1. [Joins](#11-joins)
   - [1.1.1 INNER JOIN](#111-inner-join)
   - [1.1.2 LEFT JOIN](#112-left-join)
   - [1.1.3 RIGHT JOIN](#113-right-join)
   - [1.1.4 FULL JOIN](#114-full-join)
2. [Subconsultas](#12-subconsultas)
3. [Vistas](#13-vistas)

---

## 1.1 Joins

En SQL se tienen distintos tipos de JOINs disponibles:

- **INNER JOIN:** es el caso de unión interna clásico, combina dos o más tablas descartando todas las filas resultantes que no se correspondan en ambas.
- **LEFT OUTER JOIN (o LEFT JOIN):** combina dos tablas con la diferencia que selecciona todas las filas de la primera tabla sin importar tengan o no coincidencia en la segunda.
- **RIGHT OUTER JOIN (o RIGHT JOIN):** es la opción inversa a la anterior. En la mayoría de las bases de datos actuales se puede omitir `OUTER`.
- **FULL OUTER JOIN:** combina los resultados de dos o más tablas, tengan o no coincidencia entre sí.
- **CROSS JOIN:** retorna el producto cartesiano de dos o más tablas, es decir, combina cada fila de una tabla con cada fila de otra tabla. No debería llevar la cláusula `ON`.
- **NATURAL JOIN:** es un caso especial de INNER JOIN que compara por cuenta propia la equivalencia de columnas con el mismo nombre y tipo de dato entre dos o más tablas para hacer la combinación de ambas.

> ⚠️ Hay que tener especial cuidado con el uso de `NATURAL JOIN`, pues puede producir resultados ambiguos o generar problemas si se añaden, quitan o renombran las columnas.

No todos ellos están soportados por todos los sistemas de bases de datos. Los más importantes son:

- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `OUTER JOIN`

---

### 1.1.1 INNER JOIN

Sintaxis básica:

```sql
SELECT campos
FROM tabla1
JOIN tabla2
ON condicion_de_combinacion;
```
<p align="center">
  <img src="/docs/rs/img-Practicas/P13innerjoin.png" alt="Diagrama de Inner Join" width="60%">
</p>

**Ejemplo:**
<p align="center">
  <img src="/docs/rs/img-Practicas/P13Ejemplo1.png" alt="Ejemplo 1" width="60%">
</p>

```sql
SELECT * FROM libros
JOIN editoriales
ON codigoeditorial = editoriales.codigo;
```

```sql
SELECT l.codigo, titulo, autor, nombre
FROM libros AS l
JOIN editoriales AS e
ON l.codigoeditorial = e.codigo;
```

El resultado muestra únicamente los registros que tienen coincidencia en ambas tablas. En el ejemplo, los libros cuyo código de editorial no existe en la tabla `editoriales` **no aparecen** en el resultado.

| titulo | nombre |
|--------|--------|
| El aleph | Planeta |
| Martin Fierro | Planeta |
| Aprenda PHP | Emece |

---

### 1.1.2 LEFT JOIN

Selecciona **todas las filas de la tabla izquierda**, sin importar si tienen o no coincidencia en la tabla derecha.

```sql
SELECT campos
FROM tabla_izquierda
LEFT JOIN tabla_derecha
ON condicion;
```
<p align="center">
  <img src="/docs/rs/img-Practicas/P13Leftjoin.png" alt="Diagrama de Left Join" width="60%">
</p>

**Ejemplo:** obtener el título y el nombre de la editorial:

```sql
SELECT titulo, nombre
FROM libros AS l
LEFT JOIN editoriales AS e
ON codigoeditorial = e.codigo;
```

Los títulos cuyo código de editorial no está presente en `editoriales` aparecen en el resultado, pero con el valor `NULL` en el campo `nombre`.

| titulo | nombre |
|--------|--------|
| El aleph | Planeta |
| Martin Fierro | Planeta |
| Aprenda PHP | Emece |
| Java en 10 minutos | NULL |

---

### 1.1.3 RIGHT JOIN

Selecciona **todas las filas de la tabla derecha**, sin importar si tienen o no coincidencia en la tabla izquierda.

<p align="center">
  <img src="/docs/rs/img-Practicas/P13RigthJoin.png" alt="Diagrama de Rigth Join" width="60%">
</p>

```sql
SELECT campos
FROM tabla_izquierda
RIGHT JOIN tabla_derecha
ON condicion;
```


**Ejemplo:** obtener el título y nombre de la editorial de los libros:

```sql
SELECT titulo, nombre
FROM libros AS l
RIGHT JOIN editoriales AS e
ON e.codigo = codigoeditorial;
```

Las editoriales que no tienen un libro asociado aparecen en el resultado, pero con el valor `NULL` en el campo `titulo`.

| titulo | nombre |
|--------|--------|
| El aleph | Planeta |
| Martin Fierro | Planeta |
| Aprenda PHP | Emece |
| NULL | Siglo XXI |

---

### 1.1.4 FULL JOIN

Combina los resultados de ambas tablas, tengan o no coincidencia entre sí.

<p align="center">
  <img src="/docs/rs/img-Practicas/P13Fulljoin.png" alt="Diagrama de Full Join" width="60%">
</p>

```sql
SELECT titulo, nombre
FROM editoriales AS e
FULL JOIN libros AS l
ON codigoeditorial = e.codigo;
```

La salida del `FULL JOIN` muestra **todos los registros de ambas tablas**, incluyendo los libros cuyo código de editorial no existe en la tabla `editoriales` y las editoriales de las cuales no hay correspondencia en `libros`.

| titulo | nombre |
|--------|--------|
| El aleph | Planeta |
| Martin Fierro | Planeta |
| Aprenda PHP | Emece |
| NULL | Siglo XXI |
| Java en 10 minutos | NULL |

---

## 1.2 Subconsultas

Una subconsulta (subquery) es una sentencia `SELECT` anidada en otra sentencia `SELECT`, `INSERT`, `UPDATE` o `DELETE` (o en otra subconsulta).

Las subconsultas se emplean:
- Cuando una consulta es muy compleja y se divide en varios pasos lógicos para obtener el resultado con una única instrucción.
- Cuando la consulta depende de los resultados de otra consulta.

> Puede haber subconsultas dentro de subconsultas; se admiten hasta **32 niveles de anidación**.

Las subconsultas pueden regresar los siguientes datos:

- Un valor simple (1 registro, 1 columna)
- Una lista de valores (N registros, 1 columna)
- Una tabla virtual (N registros, N columnas)
- `null` o vacío (sin resultados)

Las subconsultas pueden aparecer en distintas partes de la sentencia `SELECT`:

| Cláusula | Ejemplo de uso |
|----------|---------------|
| `SELECT` | `SELECT atributo1, atributo2, (subconsulta) AS atributo3 FROM .. WHERE ..` |
| `FROM` | `SELECT * FROM tabla1 t1, tabla2 t2, (subconsulta) t3 WHERE ..` |
| `JOIN` | `SELECT * FROM tabla1 t1 JOIN (subconsulta) t2 ON .. WHERE ..` |
| `WHERE` | `SELECT * FROM tabla1 t1 WHERE atributo1 = (subconsulta)` |
| `WHERE IN` | `SELECT * FROM tabla1 t1 WHERE atributo1 IN (subconsulta)` |
| `WHERE EXISTS` | `SELECT * FROM tabla1 t1 WHERE EXISTS (subconsulta)` |
| `HAVING` | `SELECT c1, COUNT(*) FROM tabla1 t1 WHERE .. GROUP BY c1 HAVING COUNT(*) = (subconsulta)` |

---

## 1.3 Vistas

Una vista es una tabla cuyo contenido está definido por una consulta. Al igual que una tabla base, una vista consta de un conjunto de atributos y tuplas con un nombre; sin embargo, **la vista no existe como conjunto de valores de datos almacenados** en una base de datos. Sus atributos y tuplas provienen de una o varias tablas a las que se les hace referencia cuando se crea la vista y ésta se produce de forma dinámica cuando se hace referencia a ella.

Las vistas suelen utilizarse para:
- Restringir el acceso de usuarios a datos concretos de una tabla.
- Centrar, simplificar y personalizar la percepción de la base de datos para cada usuario.
- Usarse como mecanismos de seguridad.

Para crear vistas se utiliza la sentencia `CREATE VIEW`.

**Sintaxis básica:**

```sql
CREATE VIEW nombre_vista AS
  SELECT campos
  FROM tabla;
```

**Consultar el contenido de una vista:**

```sql
SELECT * FROM nombre_vista;
```

---
