# Práctica 12 – Previo: Consultas Básicas en SQL y Funciones de Agregación
## Facultad de Ingeniería
### LAB. BASES DE DATOS — PRÁCTICA 12 PREVIO

**Asignatura:** Laboratorio de Bases de Datos  
**Maestra:** M.I.A. Martha López Pelcastre  
**Universidad Nacional Autónoma de México**  

---

## Contenido

1. [Ejercicio Previo](#11-ejercicio-previo)
2. [Contenido a entregar](#12-contenido)

---

## 1.1. Ejercicio Previo

Con base en el siguiente modelo relacional, escriba las consultas SQL solicitadas.

```
DEPARTAMENTO = {depto_numero(PK), nombre, localidad}
EMPLEADO     = {emp_numero(PK), nombre, puesto, salario, fingreso, cant_comision(N), depto_numero(FK)}
```

### Ejercicio A — Consultas con condiciones de búsqueda

Escriba la consulta SQL para cada caso:

1. Empleados cuyo salario esté entre $10,000 y $25,000.

```sql
-- BETWEEN
```

2. Empleados cuyo puesto sea `'GERENTE'`, `'ANALISTA'` o `'VENDEDOR'`.

```sql
-- IN
```

3. Empleados cuyo nombre empiece con la letra `'M'`.

```sql
-- LIKE
```

4. Empleados que **no** tengan comisión registrada.

```sql
-- IS NULL
```

5. Empleados del departamento 20 cuyo salario sea mayor a $15,000, ordenados por salario de forma descendente.

```sql
-- AND + ORDER BY DESC
```

---

### Ejercicio B — Funciones de agregación

Escriba la consulta SQL para cada caso:

1. Total de empleados en la empresa.

```sql
-- COUNT(*)
```

2. Salario promedio de todos los empleados.

```sql
-- AVG
```

3. Salario máximo y mínimo pagado en la empresa.

```sql
-- MAX y MIN
```

4. Suma total de salarios por departamento.

```sql
-- SUM + GROUP BY
```

5. Departamentos cuyo salario promedio sea mayor a $12,000. Mostrar el número de departamento y el promedio.

```sql
-- GROUP BY + HAVING
```

6. Número de empleados por puesto, mostrando solo los puestos con más de 2 empleados.

```sql
-- GROUP BY + HAVING + COUNT
```

---

## 1.2. Contenido

1. Escriba cada consulta SQL de forma **completa y documentada**.
2. Indicar junto a cada consulta qué cláusula o función se está aplicando.
3. Llevarlo **impreso** el día de la práctica.

---
