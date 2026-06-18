# Prácticas 11 y 12 – Material de Apoyo: Álgebra Relacional y Consultas Básicas
## Facultad de Ingeniería
### BASES DE DATOS — PRÁCTICAS 11 Y 12 – MATERIAL DE APOYO

**Asignatura:** Bases de Datos  
**Maestra:** Martha López Pelcastre  
**Universidad Nacional Autónoma de México**

---

## Contenido

1. [Antecedentes teóricos](#11-antecedentes-teóricos)
2. [Álgebra relacional](#12-álgebra-relacional)
   - [1.2.1 Selección](#121-selección)
   - [1.2.2 Proyección](#122-proyección)
   - [1.2.3 Unión](#123-unión)
   - [1.2.4 Diferencia](#124-diferencia)
   - [1.2.5 Producto Cartesiano](#125-producto-cartesiano)
   - [1.2.6 Intersección](#126-intersección)
   - [1.2.7 Join](#127-join)
   - [1.2.8 Tabla de operadores](#128-tabla-de-operadores)
3. [Consultas con condiciones de búsqueda](#13-consultas-con-condiciones-de-búsqueda)
4. [Consultas con condiciones de ordenamiento](#14-consultas-con-condiciones-de-ordenamiento)
5. [Consultas con funciones de agregación](#15-consultas-con-funciones-de-agregación)
6. [Consultas con funciones de agrupación](#16-consultas-con-funciones-de-agrupación)

---

## 1.1 Antecedentes teóricos

La manera en que los usuarios solicitan información de la base de datos es a través del lenguaje de consultas, que es un lenguaje de nivel superior a los de los lenguajes de programación, pues a través del menor número de instrucciones se puede obtener la información solicitada.

Dentro del lenguaje de consulta se encuentra el lenguaje procedimental, también llamado **álgebra relacional**, el cual consiste en un conjunto de operaciones que toman una o dos relaciones como entrada y generan otra relación nueva como resultado.

---

## 1.2 Álgebra relacional

Dentro del álgebra relacional tenemos dos tipos de operadores:

- **Operadores básicos o fundamentales:** selección, proyección, unión, diferencia y producto cartesiano.
- **Operadores compuestos o derivados:** intersección y unión natural (join).

---

### 1.2.1 Selección

Extrae las tuplas específicas de una relación dada presentando sólo aquellas que satisfagan las condiciones específicas.

```sql
SELECT <columna>
FROM tabla
WHERE <condición>;
```

---

### 1.2.2 Proyección

Extrae los atributos especificados de una relación dada.

```sql
SELECT <columna1, columna2, columna3, …>
FROM tabla;
```

---

### 1.2.3 Unión

Construye una relación formada por todas las tuplas que aparecen en las dos relaciones especificadas sin repeticiones.

```sql
SELECT <columna>
FROM tabla1
UNION
SELECT <columna>
FROM tabla2;
```

---

### 1.2.4 Diferencia

Construye una relación formada por todas las tuplas de la primera relación que no aparezcan en la segunda. `EXCEPT` o `MINUS` devuelve los valores de la primera consulta que no se encuentran en la segunda.

```sql
SELECT <columna>
FROM tabla1
EXCEPT
SELECT <columna>
FROM tabla2;
```

---

### 1.2.5 Producto Cartesiano

Combina cada dato de una tabla con cada dato de otra tabla.

```sql
SELECT <columnaA>, <columnaB>
FROM tabla1, tabla2;
```

---

### 1.2.6 Intersección

De dos relaciones específicas se obtienen las tuplas que coinciden en ambas.

```sql
SELECT <columna>
FROM tabla1
INTERSECT
SELECT <columna>
FROM tabla2;
```

---

### 1.2.7 Join

Es usado para consultar datos de más de una tabla. Los datos se combinan relacionando valores comunes, típicamente valores de primary key y foreign key. Su combinación está basada en todas las columnas comunes entre ambas tablas. Si dos tablas en una consulta no tienen ninguna condición de combinación, entonces se devuelve su producto cartesiano.

```sql
SELECT <campo1, campo2, campo3, ...>
FROM <nombretabla1>
JOIN <nombretabla2> ON <condición>
```

---

### 1.2.8 Tabla de operadores

Considerando las tablas A y B, los operadores de álgebra relacional se muestran en las siguientes tablas:

**Operadores básicos:**

| TIPO | OPERADOR | REPRESENTACIÓN |
|------|----------|----------------|
| Unario | Selección o restricción | σ\<PREDICADO\> (A) |
| Unario | Proyección | πC1, c2, c3, (A) |
| Binario | Unión | A **U** B |
| Binario | Diferencia | A – B |
| Binario | Producto Cartesiano | A **x** B |

**Operadores compuestos** — se obtienen a partir de los operadores básicos:

| TIPO | OPERADOR | REPRESENTACIÓN |
|------|----------|----------------|
| Binario | Intersección | A ∩ B |
| Binario | Join | A ⋈ predicado B |

---

## 1.3 Consultas con condiciones de búsqueda

Las condiciones de búsqueda se agrupan en distintos contrastes: comparación, rango, correspondencia con patrón, de valor nulo y compuestos.

### Comparación

Calcula y compara los valores de dos expresiones SQL, utilizando los operadores de comparación (`=`, `<>`, `<`, `>`, `<=`, `>=`).

<p align="center">
  <img src="/docs/rs/imgPracticas/DP11y12-1.png" alt="Consultas con condiciones de búsqueda" width="60%">
</p>


**EJEMPLO 1.** Obtener información (clave y nombre) de los departamentos que se encuentran ubicados en la localidad de NEW YORK:

```sql
SELECT depto_numero, nombre
FROM departamento
WHERE localidad = 'NEW YORK';
```

---

### Rango — Cláusula `BETWEEN…AND`

Comprueba si un valor se encuentra entre dos valores especificados.

**EJEMPLO 2.** Nombre de los empleados y el puesto de aquellos que tienen un salario entre 1200 y 3000:

```sql
SELECT nombre, puesto
FROM empleado
WHERE salario BETWEEN 1200 AND 3000;
```

---

### Pertenencia a un conjunto — Cláusula `IN`

Comprueba si un valor dado coincide con uno de una lista de valores especificada.

**EJEMPLO 3.** Nombre de los empleados y el puesto de aquellos que ganan 2975, 3000 o 5000:

```sql
SELECT nombre, puesto
FROM empleado
WHERE salario IN (2975, 3000, 5000);
```

---

### Correspondencia con patrón — Cláusula `LIKE`

Obtiene las filas para las que el contenido de una columna de texto coincide con un patrón especificado. Se utiliza el símbolo `%` como comodín y el símbolo `_` que representa exactamente una posición de carácter.

**EJEMPLO 4.**

a) Liste la clave y nombre del empleado, de aquellos cuyo puesto inicie con la letra S:

```sql
SELECT emp_numero, nombre
FROM empleado
WHERE puesto LIKE 'S%';
```

b) Muestre todos los datos de los empleados donde en la tercera posición de su nombre tengan una letra A:

```sql
SELECT emp_numero, nombre
FROM empleado
WHERE puesto LIKE '__A%';
```

---

### Valor nulo — Cláusula `IS NULL` o `IS NOT NULL`

Comprueba si existen valores nulos en las columnas.

**EJEMPLO 5.** Muestre la clave de los empleados sin comisión:

```sql
SELECT emp_numero
FROM empleado
WHERE cant_comision IS NULL;
```

---

### Compuestos — Cláusulas `AND`, `OR` y `NOT`

Utilizando las reglas de la lógica se pueden combinar condiciones de búsqueda SQL simples para formar condiciones compuestas únicas.

**EJEMPLO 6.** Liste el nombre de los empleados que son administradores o analistas y su sueldo es mayor a $25000:

```sql
SELECT nombre
FROM empleado
WHERE (puesto = 'ADMINISTRADOR'
    OR puesto = 'ANALISTA')
AND salario > 25000;
```

---

## 1.4 Consultas con condiciones de ordenamiento

### Cláusula `ORDER BY`

Ordena los registros resultantes de una consulta por un campo o unos campos especificados en orden ascendente o descendente.

```sql
SELECT <lista de campos>
FROM <tabla>
WHERE <criterios de selección>
[ORDER BY <campo1 [ASC|DESC]>, <campo2 [ASC|DESC]>];
```

**EJEMPLO 7.** Nombre de los empleados y puesto, ordenados por este último:

```sql
SELECT nombre, puesto
FROM empleado
ORDER BY puesto;
```

**EJEMPLO 8.** Nombre de los empleados ordenados por la fecha de ingreso en forma descendente:

```sql
SELECT nombre
FROM empleado
ORDER BY fingreso DESC;
```

---

## 1.5 Consultas con funciones de agregación

Las funciones de agregación generan valores de resumen en las consultas; procesan todos los valores seleccionados en una única columna para generar un único resultado. Cuando se aplica una función de agregación se genera un valor individual por cada conjunto de filas.

| Función | Acción |
|---------|--------|
| `COUNT(*)` | Regresa el número de registros encontrados |
| `COUNT(<campo>)` | Regresa el número de registros cuyo valor del campo especificado no es nulo |
| `SUM(<campo>)` | Suma los valores de la columna especificada |
| `AVG(<campo>)` | Promedia los valores del campo especificado |
| `MIN(<campo>)` | Regresa el valor mínimo del campo especificado |
| `MAX(<campo>)` | Regresa el valor máximo del campo especificado |

**EJEMPLO 9.**

a) Cantidad de empleados que son administradores:

```sql
SELECT COUNT(nombre)
FROM empleado
WHERE puesto = 'ADMINISTRADOR';
```

b) Cantidad de empleados que reciben comisión:

```sql
SELECT COUNT(cant_comision)
FROM empleado;
```

c) El salario máximo pagado a un empleado:

```sql
SELECT MAX(salario)
FROM empleado;
```

---

## 1.6 Consultas con funciones de agrupación

### Cláusula `GROUP BY`

En la cláusula `GROUP BY` se indica el o los campos por los cuales se desea agrupar un conjunto de registros. Comúnmente esta agrupación va acompañada con una serie de funciones de agregación.

**EJEMPLO 10.**

a) Clave del departamento y el monto total necesario para pagar a los empleados de dicho departamento:

```sql
SELECT depto_numero, SUM(salario)
FROM empleado
GROUP BY depto_numero;
```

b) Sueldo promedio por cada clave de departamento:

```sql
SELECT depto_numero, AVG(salario)
FROM empleado
GROUP BY depto_numero;
```

c) Salario mínimo pagado por puesto:

```sql
SELECT puesto, MIN(salario)
FROM empleado
GROUP BY puesto;
```

---

### Cláusula `GROUP BY…HAVING`

Esta cláusula es el equivalente a la cláusula `WHERE`, es decir, especifica un criterio o condición, pero la diferencia radica en que se ocupa únicamente cuando se desea especificar una **función de agregación en la condición**.

**EJEMPLO 11.** Clave de departamento y sueldo promedio de sus empleados, de aquellos departamentos cuyo salario promedio sea mayor que $2000:

```sql
SELECT depto_numero, AVG(salario)
FROM empleado
GROUP BY depto_numero
HAVING AVG(salario) > 2000;
```

---
