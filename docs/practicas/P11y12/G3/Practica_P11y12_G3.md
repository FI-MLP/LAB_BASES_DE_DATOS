# Práctica 11 y 12: Álgebra Relacional y Consultas Básicas y Funciones de Agregación
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 11 y 12
**Asignatura:** Laboratorio de Bases de Datos

**Maestra:** M.I.A. Martha López Pelcastre

**Universidad Nacional Autónoma de México**

---

## 1. Álgebra Relacional y Consultas Básicas y Funciones de Agregación

### Contenido

1. [Álgebra Relacional y Consultas Básicas y Funciones de Agregación](#1-álgebra-relacional-y-consultas-básicas-y-funciones-de-agregación)
   
   1.1. [Antecedentes teóricos](#11-antecedentes-teóricos)
   
   1.2. [Álgebra relacional](#12-álgebra-relacional)
   
   - 1.2.1. [Selección](#121-selección)
   
   - 1.2.2. [Proyección](#122-proyección)
   
   - 1.2.3. [Unión](#123-unión)
   
   - 1.2.4. [Diferencia](#124-diferencia)
   
   - 1.2.5. [Producto Cartesiano](#125-producto-cartesiano)
   
   - 1.2.6. [Intersección](#126-intersección)
   
   - 1.2.7. [Join](#127-join)
   
   - 1.2.8. [Tabla de operadores](#128-tabla-de-operadores)
   
   1.3. [Consultas con condiciones de búsqueda](#13-consultas-con-condiciones-de-búsqueda)
   
   1.4. [Consultas con condiciones de ordenamiento](#14-consultas-con-condiciones-de-ordenamiento)
   
   1.5. [Consultas con funciones de agregación](#15-consultas-con-funciones-de-agregación)
   
   1.6. [Consultas con funciones de agrupación](#16-consultas-con-funciones-de-agrupación)
   
   1.7. [Actividades a realizar](#17-actividades-a-realizar)
   
   - 1.7.1. [Tabla de resultados álgebra relacional](#171-tabla-de-resultados-algebra-relacional)
   
   - 1.7.2. [Tabla de resultados consultas básicas](#172-tabla-de-resultados-consultas-básicas)
   
   - 1.7.3. [Tabla de resultados sentencias GROUP BY y HAVING](#173-tabla-de-resultados-sentencias-group-by-y-having)
   
   1.8. [Contenido del reporte](#18-contenido-del-reporte)

---

### 1.1. Antecedentes teóricos

La manera en que los usuarios solicitan información de la base de datos es a través del lenguaje de consultas, que es un lenguaje de nivel superior a los de los lenguajes de programación, pues a través del menor número de instrucciones se puede obtener la información solicitada. Dentro del lenguaje de consulta se encuentra el lenguaje procedimental, también llamado álgebra relacional, el cual consiste en un conjunto de operaciones que toman una o dos relaciones como entrada y generan otra relación nueva como resultado.

---

### 1.2. Álgebra relacional

Dentro del álgebra relacional tenemos dos tipos de operadores:

- **Operadores básicos o fundamentales:** selección, proyección, unión, diferencia y producto cartesiano.
- **Operadores compuestos o derivados:** intersección y unión natural (join).

#### 1.2.1. Selección

Extrae las tuplas específicas de una relación dada presentando sólo aquellas que satisfagan las condiciones específicas.

```sql
SELECT <columna>
FROM tabla
WHERE <condición>;
```

#### 1.2.2. Proyección

Extrae los atributos especificados de una relación dada.

```sql
SELECT <columna1, columna2, columna3, …>
FROM tabla;
```

#### 1.2.3. Unión

Construye una relación formada por todas las tuplas que aparecen en las dos relaciones especificadas sin repeticiones.

```sql
SELECT <columna>
FROM tabla1
UNION
SELECT <columna>
 FROM tabla2;
```

#### 1.2.4. Diferencia

Construye una relación formada por todas las tuplas de la primera relación que no aparezcan en la segunda, de las dos relaciones especificadas. EXCEPT o MINUS devuelve los valores de la primera consulta que no se encuentran en la segunda. Así podemos averiguar qué registros están en una consulta, pero no en la otra, calculando la diferencia entre dos conjuntos de registros

```sql
SELECT <columna>
FROM tabla1
EXCEPT
SELECT <columna>
FROM tabla2;
```

#### 1.2.5. Producto Cartesiano

Combina cada dato de una tabla con cada dato de otra tabla.

```sql
SELECT <columnaA>,<columnaB>
FROM tabla1, tabla2;
```

#### 1.2.6. Intersección

De dos relaciones específicas se obtienen las tuplas que coinciden en ambas.

```sql
SELECT <columna>
FROM tabla1
INTERSECT
SELECT <columna>
FROM tabla2;
```

#### 1.2.7. Join

Es usado para consultar datos de más de una tabla. Los datos se combinan relacionando valores comunes, típicamente valores de primary key y foreign key. Su combinación está basada en todas las columnas comunes entre ambas tablas. Si dos tablas en una consulta no tienen ninguna condición de combinación, entonces SE devuelve su producto cartesiano.

```sql
select <campo1, campo2, campo3, ...>
from <nombretabla1>
JOIN <nombretabla2> ON <condición>
```

#### 1.2.8. Tabla de operadores

Considerando las tablas A y B, los operadores de álgebra relacional se muestran en las siguientes tablas:

**Operadores básicos**

| TIPO | OPERADOR | REPRESENTACIÓN |
|---|---|---|
| Unario | Selección o restricción | σ\<PREDICADO\> (A) |
| Unario | Proyección | π C1, c2, c3, (A) |
| Binario | Unión | A U B |
| Binario | Diferencia | A – B |
| Binario | Producto Cartesiano | A x B |

**Operadores compuestos.** Se obtienen a partir de los operadores básicos

| TIPO | OPERADOR | REPRESENTACIÓN |
|---|---|---|
| Binario | Intersección | A ∩ B |
| Binario | Join | A ⋈ predicado B |

---

### 1.3. Consultas con condiciones de búsqueda

Las condiciones de búsqueda se agrupan en distintos contrastes: comparación, rango, correspondencia con patrón, de valor nulo y compuestos.

**Comparación**

Calcula y compara los valores de dos expresiones SQL, utilizando los operadores de comparación (=, <>, <,>, <=,>=).

<p align="center">
  <img src="/docs/rs/imgPracticas/P11y12-1.png" alt="Diagrama de tablas DEPARTAMENTO y EMPLEADO" width="85%">
</p>

**EJEMPLO 1.** Obtener información de los departamentos que se encuentran ubicados en la ciudad de NEW YORK:

```sql
SELECT depot_num, nombre
FROM departamento
WHERE localidad = ‘NEW YORK’;
```

**Rango**

Cláusula BETWEEN…AND

Comprueba si un valor se encuentra entre dos valores especificados.

**EJEMPLO 2.** Nombre de los empleados y el puesto de aquellos que tienen un salario entre 1200 y 3000

```sql
SELECT nombre, puesto
FROM empleado
WHERE salario BETWEEN 1200 AND 3000;
```

**Pertenencia a un conjunto**

Cláusula IN

Comprueba si un valor dado coincide con uno de una lista de valores especificada.

**EJEMPLO 3.** Nombre de los empleados y el puesto de aquellos que ganan 2975, 3000 o 5000.

```sql
SELECT nombre, puesto
FROM empleado
WHERE salario IN (2975, 3000, 5000);
```

**Correspondencia con patrón** Cláusula LIKE

Obtiene las filas para las que el contenido de una columna de texto coincide con un patrón especificado. En este tipo de consulta se utiliza el símbolo % como comodín. También se utiliza el símbolo subrayado bajo (_), que representa exactamente una posición de carácter, sólo un carácter.

**EJEMPLO 4**

a) Liste la clave y nombre del empleado, de aquellos cuyo puesto inicie con la letra S

```sql
SELECT emp_numero, nombre
FROM empleado
WHERE puesto LIKE ‘S%’;
```

b) Muestre todos los datos de los empleados donde en la tercera posición de su nombre tengan una letra A

```sql
SELECT emp_numero, nombre
FROM empleado
WHERE puesto LIKE ‘_ _A%’;
```

**Valor nulo**

Cláusula IS NULL o IS NOT NULL

Comprueba si existen valores nulos en las columnas.

**EJEMPLO 5.** Muestre la clave de los empleados sin comisión.

```sql
SELECT empno
FROM emp
WHERE comm IS NULL;
```

**Compuestos** Cláusulas AND, OR y NOT

Utilizando las reglas de la lógica se pueden combinar condiciones de búsqueda SQL simples para formar condiciones compuestas únicas.

**EJEMPLO 6.** Liste el nombre de los empleados que son administradores o analistas y su sueldo es mayor a $2500

```sql
SELECT nombre
FROM empeado
WHERE (puesto=’MANAGER’
OR job=‘ANALISTA’)
AND salario>2500;
```

---

### 1.4. Consultas con condiciones de ordenamiento

Cláusula ORDER BY

Ordena los registros resultantes de una consulta por un campo o unos campos especificados en orden ascendente o descendente. Su sintaxis es la siguiente:

```sql
SELECT <lista de campos>
FROM <tabla>
WHERE <criterios de selección >
[ORDER BY <campo1 [as|des],[,campo2 [as|des]]];
```

**EJEMPLO 7.** Nombre de los empleados y puesto, ordenados por este último.

```sql
SELECT nombre, puesto
FROM empleados
ORDER BY puesto;
```

**Ejemplo 8.** Nombre de los empleados ordenados por la fecha de ingreso en forma descendente.

```sql
SELECT nombre
FROM empleado
ORDER BY fingreso DESC;
```

---

### 1.5. Consultas con funciones de agregación

Las funciones de agregación generan valores de resumen en las consultas; procesan todos los valores seleccionados en una única columna para generar un único resultado. Estas funciones se pueden aplicar a todas las filas de una tabla, a un conjunto de una tabla especificado por una cláusula WHERE o a uno o varios grupos de filas de una tabla. Cuando se aplica una función de agregación se genera un valor individual por cada conjunto de filas.

Las funciones de agregación son las siguientes:

| Función | Acción |
|---|---|
| COUNT(*) | Regresa el número de registros encontrados |
| COUNT(\<campo\>) | Regresa el número de registros cuyo valor del campo especificado no es nulo |
| SUM(\<campo\>) | Suma los valores de la columna especificada |
| AVG(\<campo\>) | Promedia los valores del campo especificado |
| MIN(\<campo\>) | Regresa el valor mínimo del campo especificado |
| MAX(\<campo\>) | Regresa el valor máximo del campo especificado |

**EJEMPLO 9**

a) Cantidad de empleados que son administradores.

```sql
SELECT COUNT(nombre)
FROM empleado
WHERE puesto=’MANAGER’;
```

b) Cantidad de empleados que reciben comisión.

```sql
SELECT COUNT(cant_comision)
FROM empleado;
```

c) El salario máximo pagado a un empleado.

```sql
SELECT MAX(salario)
FROM empleado;
```

---

### 1.6. Consultas con funciones de agrupación

Cláusula GROUP BY

En la cláusula GROUP BY se indica el o los campos por los cuales se desea agrupar un conjunto de registros. Comúnmente esta agrupación va acompañada con una serie de funciones agregación.

**EJEMPLO 10.**

a) Clave del departamento y el monto total necesario para pagar a los empleados de dicho departamento.

```sql
SELECT depto_numero, SUM(salario)
FROM emp
GROUP BY deptno;
```

b) Sueldo promedio por cada clave de departamento.

```sql
SELECT depto_numero, AVG(salario)
FROM empleado
GROUP BY depto_numero;
```

c) Salario mínimo pagado por puesto.

```sql
SELECT puesto, MIN(salario)
FROM empleado
GROUP BY puesto;
```

**Cláusula GROUP BY…HAVING**

Esta cláusula es el equivalente a la cláusula WHERE, es decir, especifica un criterio o condición, pero la diferencia radica en que se ocupa únicamente cuando se desea especificar una función de agregación en la condición.

**EJEMPLO 11.** Clave de departamento y sueldo promedio de sus empleados, de aquellos departamentos cuyo salario promedio sea mayor que $2000.

```sql
SELECT depto_numero, AVG(salario)
FROM empleado
GROUP BY depot_numero
HAVING AVG(salario)>2000;
```

---

### 1.7. Actividades a realizar

En base al modelo anterior, realice lo que se pide:

<p align="center">
  <img src="/docs/rs/Practica11y12Imagen2.png" alt="Modelo entidad-relación - DUEÑO, INMUEBLE, SERVICIO, PAGO, etc." width="85%">
</p>

**A) Exprese en algebra relacional y SQL los siguientes enunciados:**

1. Genere una consulta que obtenga tipo de inmueble, tamaño, precio_actual, alcaldia, de los inmuebles con costo mayos a $2,000,000 y sean casas, sin considerar las de tamaño menor a 140 metros cuadrados (utilizar operaciones de conjuntos, no utilizar el operador **and** ni **or**)
2. Obtenga listado de inmuebles (identificador y tamaño) de aquellos con valor de entre 2 y 3 millones, sin considerar a los que ya se vendieron (diferencia)
3. Obtenga toda la información de los servicios y los pagos (producto cartesiano)
4. Obtenga toda la información de los inmuebles, y su historial de costos (join)

#### 1.7.1. Tabla de resultados algebra relacional

Llena la siguiente tabla:

**Ejercicio 1**

| Campo | Contenido |
|---|---|
| Algebra relacional | |
| Consulta en SQL | |
| Análisis | |
| Imagen | |

**Ejercicio 2**

| Campo | Contenido |
|---|---|
| Algebra relacional | |
| Consulta en SQL | |
| Análisis | |
| Imagen | |

**Ejercicio 3**

| Campo | Contenido |
|---|---|
| Algebra relacional | |
| Consulta en SQL | |
| Análisis | |
| Imagen | |

**Ejercicio 4**

| Campo | Contenido |
|---|---|
| Algebra relacional | |
| Consulta en SQL | |
| Análisis | |
| Imagen | |



**B). Conéctese a la base de datos y realice las siguientes consultas:**

1. Obtenga el listado de las alcaldías y el total de inmuebles de cada una de ellas. Ordené de manera descendiente (distinct)
2. Obtenga todos los inmuebles cuyo costo este entre 2500000 y 3800000, utilice BETWEEN y ordénelos por el costo de mayor a menor.
3. Obtenga todos los inmuebles vendidos que no tengan un pago (utilice NOT)
4. Obtenga los datos de los inmuebles que estén vendidos (utiliced not null) y que hayan contratado servicios que inicien con la letra G
5. Obtenga todos los datos de los inmuebles, incluyendo los datos si son casas o departamentos y datos de escrituración, si es que ya fue vendido.

#### 1.7.2. Tabla de resultados consultas básicas

Llena la siguiente tabla:

**Ejercicio 1**

| Campo | Contenido |
|---|---|
| Consulta en SQL | |
| Análisis | |
| Imagen | |

**Ejercicio 2**

| Campo | Contenido |
|---|---|
| Consulta en SQL | |
| Análisis | |
| Imagen | |

**Ejercicio 3**

| Campo | Contenido |
|---|---|
| Consulta en SQL | |
| Análisis | |
| Imagen | |

**Ejercicio 4**

| Campo | Contenido |
|---|---|
| Consulta en SQL | |
| Análisis | |
| Imagen | |

**Ejercicio 5**

| Campo | Contenido |
|---|---|
| Consulta en SQL | |
| Análisis | |
| Imagen | |


**C) Consultas en las que se involucren las sentencias GROUP BY y HAVING, generar conjuntos de datos agrupados por más de una columna.** (ponga alias a las columnas)

1. Genere el listado de los inmuebles y el número de pagos de cada uno de ellos, pero solo de aquellos que tienen un costo mayor al costo promedio de los inmuebles. Agrupado por tipo. Muestre el identificador del inmueble, el número de pagos.
2. Genere el listado del inmueble y el total de sus pagos (cuanto se ha pagado), pero solo de aquellos cuyo promedio de pagos supera los $10,000. Muestre clave del inmueble, cuanto se ha pagado y el promedio de sus pagos
3. Obtenga el identificador y costo de aquellos inmuebles con 3, 4 y 5 pagos utilicen IN (en casos de no contar con estos datos, usted seleccione 3 que si existan en su base de datos).
4. Obtenga todos los inmuebles vendidos en este año, excluyendo aquellos que tengan menos de 3 precios históricos. Mostrar clave, precio actual, precio promedio y cantidad de precios registrados en la tabla histórico.
5. Obtenga el nombre, correo, teléfono, cantidad de inmuebles comprados, incluya el nombre y correo del dueño que lo recomendó.

#### 1.7.3. Tabla de resultados sentencias GROUP BY y HAVING

Llena la siguiente tabla:

**Ejercicio 1**

| Campo | Contenido |
|---|---|
| Consulta en SQL | |
| Análisis | |
| Imagen | |

**Ejercicio 2**

| Campo | Contenido |
|---|---|
| Consulta en SQL | |
| Análisis | |
| Imagen | |

**Ejercicio 3**

| Campo | Contenido |
|---|---|
| Consulta en SQL | |
| Análisis | |
| Imagen | |

**Ejercicio 4**

| Campo | Contenido |
|---|---|
| Consulta en SQL | |
| Análisis | |
| Imagen | |

**Ejercicio 5**

| Campo | Contenido |
|---|---|
| Consulta en SQL | |
| Análisis | |
| Imagen | |


> **Nota:** puede mover el valor de las condiciones si fuera necesario, ya que no se aceptan ejercicios sin resultado (registros) de las consultas. No mover la condición, solo valores. Si es necesario debe insertar información en las tablas.

---

### 1.8. Contenido del reporte

- Elementos comunes a todas las prácticas especificados en la rúbrica correspondiente
- Evidencia de cada actividad, imagen del código y correcta ejecución del mismo
- Incluir imagen de los registros resultado de cada consulta (de ambos integrantes del equipo)
- Análisis de la función que realiza cada operador utilizado
- Script documentado, código limpio de cada una de las actividades

---
